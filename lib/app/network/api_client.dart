// ignore_for_file: unnecessary_string_interpolations

import 'dart:async';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart' as Route;
import 'package:get/get_utils/get_utils.dart';
import 'package:logger/logger.dart';
import 'package:manpower_station/app/data/local/my_shared_pref.dart';
import 'package:manpower_station/app/network/api_list.dart';
import 'package:manpower_station/utils/appLoggerUtils.dart';
import 'package:manpower_station/utils/constants.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import '../routes/app_pages.dart';
import 'api_exceptions.dart';
import '../../../config/translations/strings_enum.dart';
import '../components/custom_snackbar.dart';

enum RequestType {
  get,
  post,
  put,
  delete,
}

class BaseClient {
  static final Dio _dio = Dio(BaseOptions(
    baseUrl: ApiList.baseUrl,
    headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    },
    receiveTimeout: const Duration(seconds: 30),
    connectTimeout: const Duration(seconds: 30),
  ))
    ..interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async {
        // Attach the access token to every request
        String? accessToken = MySharedPref.getAccessToken();
        if (accessToken != null) {
          options.headers['Authorization'] = '$accessToken';
        }
        return handler.next(options); // Continue
      },
      onError: (DioException error, handler) async {
        // "interceptor for refreshToken error: ${error.response?.statusCode}");
        // Check if the error is due to expired access token (400)
        if (error.response?.statusCode == 400) {
          // print(
              // "interceptor for refreshToken error: ${error.response?.statusCode}");
          // Attempt to refresh the token
          try {
            print('inside try refresh token');
            final newTokens = await _refreshToken();
            // Save the new tokens
            await MySharedPref.setAccessToken(newTokens['access_token']!);
            await MySharedPref.setRefreshToken(newTokens['refresh_token']!);
            // Retry the original request with new access token
            RequestOptions requestOptions = error.requestOptions;
            requestOptions.headers['Authorization'] =
                '${newTokens['access_token']}';

            final response = await _dio.request(
              requestOptions.path,
              options: Options(
                method: requestOptions.method,
                headers: requestOptions.headers,
              ),
              data: requestOptions.data,
              queryParameters: requestOptions.queryParameters,
            );
            return handler.resolve(response); // Retry the request
          } catch (e) {
            // Handle failure to refresh token (logout, etc.)
            Route.Get.offAllNamed(AppPages.SignIn);
             CustomSnackBar.showCustomErrorToast(message: "Session LogOut");

            return handler.reject(error);
          }
        } else {
          return handler.next(error); // Continue if it's not 401
        }
      },
    ))
    ..interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      error: true,
      compact: true,
      maxWidth: 90,
    ));

  // request timeout (default 10 seconds)
  static const int _timeoutInSeconds = 10;

  /// dio getter (used for testing)
  static get dio => _dio;


  /// perform safe api request
  static safeApiCall(
    String url,
    RequestType requestType, {
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParameters,
    required Function(Response response) onSuccess,
    Function(ApiException)? onError,
    Function(int value, int progress)? onReceiveProgress,
    Function(int total, int progress)?
        onSendProgress, // while sending (uploading) progress
    Function? onLoading,
    dynamic data,
  }) async {
    try {
      // 1) indicate loading state
      await onLoading?.call();
      // 2) try to perform http request
      late Response response;
      if (requestType == RequestType.get) {
        response = await _dio.get(
          url,
          onReceiveProgress: onReceiveProgress,
          queryParameters: queryParameters,
          options: Options(
            headers: headers,
          ),
        );
      } else if (requestType == RequestType.post) {
        response = await _dio.post(
          url,
          data: data,
          onReceiveProgress: onReceiveProgress,
          onSendProgress: onSendProgress,
          queryParameters: queryParameters,
          options: Options(headers: headers),
        );
      } else if (requestType == RequestType.put) {
        response = await _dio.put(
          url,
          data: data,
          onReceiveProgress: onReceiveProgress,
          onSendProgress: onSendProgress,
          queryParameters: queryParameters,
          options: Options(headers: headers),
        );
      } else {
        response = await _dio.delete(
          url,
          data: data,
          queryParameters: queryParameters,
          options: Options(headers: headers),
        );
      }
      // 3) return response (api done successfully)
      await onSuccess(response);
    } on DioException catch (error) {
      // dio error (api reach the server but not performed successfully
      _handleDioError(error: error, url: url, onError: onError);
    } on SocketException {
      // No internet connection
      _handleSocketException(url: url, onError: onError);
    } on TimeoutException {
      // Api call went out of time
      _handleTimeoutException(url: url, onError: onError);
    } catch (error, stackTrace) {
      // print the line of code that throw unexpected exception
      Logger().e(stackTrace);
      // unexpected error for example (parsing json error)
      _handleUnexpectedException(url: url, onError: onError, error: error);
    }
  }

  /// download file
  static download(
      {required String url, // file url
      required String savePath, // where to save file
      Function(ApiException)? onError,
      Function(int value, int progress)? onReceiveProgress,
      required Function onSuccess}) async {
    try {
      await _dio.download(
        url,
        savePath,
        options: Options(
            receiveTimeout: const Duration(seconds: _timeoutInSeconds),
            sendTimeout: const Duration(seconds: _timeoutInSeconds)),
        onReceiveProgress: onReceiveProgress,
      );
      onSuccess();
    } catch (error) {
      var exception = ApiException(url: url, message: error.toString());
      onError?.call(exception) ?? _handleError(error.toString());
    }
  }

  /// handle unexpected error
  static _handleUnexpectedException(
      {Function(ApiException)? onError,
      required String url,
      required Object error}) {
    if (onError != null) {
      onError(ApiException(
        message: error.toString(),
        url: url,
      ));
    } else {
      _handleError("${error.toString()}");
    }
  }

  /// handle timeout exception
  static _handleTimeoutException(
      {Function(ApiException)? onError, required String url}) {
    if (onError != null) {
      onError(ApiException(
        message: Strings.serverNotResponding.tr,
        url: url,
      ));
    } else {
      _handleError("TimeOut here ${Strings.serverNotResponding.tr}");
    }
  }

  /// handle timeout exception
  static _handleSocketException(
      {Function(ApiException)? onError, required String url}) {
    if (onError != null) {
      onError(ApiException(
        message: Strings.noInternetConnection.tr,
        url: url,
      ));
    } else {
      _handleError(Strings.noInternetConnection.tr);
    }
  }

  /// handle Dio error
  static _handleDioError(
      {required DioException error,
      Function(ApiException)? onError,
      required String url}) {
    // 404 error
    if (error.response?.statusCode == 404) {
      if (onError != null) {
        return onError(ApiException(
          message: Strings.urlNotFound.tr,
          url: url,
          statusCode: 404,
        ));
      } else {
        return _handleError(Strings.urlNotFound.tr);
      }
    }

    // no internet connection
    if (error.message != null &&
        error.message!.toLowerCase().contains('socket')) {
      if (onError != null) {
        return onError(ApiException(
          message: Strings.noInternetConnection.tr,
          url: url,
        ));
      } else {
        return _handleError(Strings.noInternetConnection.tr);
      }
    }

    // check if the error is 500 (server problem)
    if (error.response?.statusCode == 500) {
      var exception = ApiException(
        message: Strings.serverError.tr,
        url: url,
        statusCode: 500,
      );

      if (onError != null) {
        return onError(exception);
      } else {
        return handleApiError(exception);
      }
    }

    var exception = ApiException(
        url: url,
        message: error.message ?? 'Un-Expected Api Error!',
        response: error.response,
        statusCode: error.response?.statusCode);

    if (onError != null) {
      return onError(exception);
    } else {
      return handleApiError(exception);
    }
  }

  /// handle error automatically (if user didn't pass onError) method
  /// it will try to show the message from api if there is no message
  /// from api it will show the reason (the dio message)
  static handleApiError(ApiException apiException) {
    String msg = apiException.toString();
    if (kDebugMode) {
      LoggerUtil.instance
          .printLog(msg: "handle api error:$msg", logType: LogType.error);
      CustomSnackBar.showCustomErrorSnackBar(title: "Error Occurred", message: "Request Timed Out!!");
    }
  }

  /// handle errors without response (500, out of time, no internet,..etc)
  static _handleError(String msg) {
    if (kDebugMode) {
      CustomSnackBar.showCustomErrorToast(message: "handle error:$msg");
    }
  }
}

Future<Map<String, String>> _refreshToken() async {
  print('inside refresh token');
  String? refreshToken = await MySharedPref.getRefreshToken();
  print("refresh token:${refreshToken}");
  if (refreshToken == null) {
    LoggerUtil.instance.printLog(
        msg: "Refresh token null : ${MySharedPref.getRefreshToken()}",
        logType: LogType.warning);
    throw Exception('No Access token available');
  }
  Dio dio = Dio(
    BaseOptions(
      baseUrl: ApiList.baseUrl,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': refreshToken
      },
    ),
  );
  final response = await dio.post(
    '/api/users/refresh/token',
  );
  if (response.statusCode == 200) {
    LoggerUtil.instance.printLog(msg: response.data);
    return {
      'access_token': response.data['access_token'],
      'refresh_token': response.data['refresh_token'],
    };
  } else {
    throw Exception('Failed to refresh token');
  }
}
