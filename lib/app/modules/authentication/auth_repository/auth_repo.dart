import 'package:dio/dio.dart';
import 'package:manpower_station/utils/appLoggerUtils.dart';
import '../../../network/api_client.dart';
import '../../../network/api_list.dart';

class AuthRepository {

  static Future<Response<dynamic>> postLogin(requestData,String appUrl) async {
    Dio dio=Dio(
      BaseOptions(
        baseUrl: ApiList.baseUrl,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    );
    late Response<dynamic> apiResponse;
    try {
      final response = await dio.post(
      appUrl,
        data: requestData
      );
      apiResponse=response;
    } on DioException catch (err) {
      apiResponse=err.response!;
    }
    return apiResponse;
  }

  static Future<Response<dynamic>> postData(requestData,String appUrl) async {
      late Response<dynamic> apiResponse;
    try {
      await BaseClient.safeApiCall(
          appUrl,
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
          },
          RequestType.post,
          data: requestData,
          onError: (err){
            apiResponse= err.response!;
          },
          onSuccess: (response) {
        apiResponse = response;
      });

    } catch (e) {
      LoggerUtil.instance.printLog(msg: 'Error Post Data : ${e.toString()}');
    }
    return apiResponse;
  }

  static Future<Response<dynamic>> getData(String appUrl) async {
      late Response<dynamic> apiResponse;
    try {
      await BaseClient.safeApiCall(
          appUrl,
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
          },
          RequestType.get,
          onSuccess: (response) {
        apiResponse = response;
      });

    } catch (e) {
      LoggerUtil.instance.printLog(msg: 'Error Post Data : ${e.toString()}');
    }
    return apiResponse;
  }


  static Future<Response<dynamic>> putData(requestData,String appUrl) async {
      late Response<dynamic> apiResponse;
    try {
      await BaseClient.safeApiCall(
          appUrl,
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
          },
          RequestType.put,
          data: requestData, onSuccess: (response) {
        apiResponse = response;
      });

    } catch (e) {
      LoggerUtil.instance.printLog(msg: 'Error Put Data : ${e.toString()}');
    }
    return apiResponse;
  }
}
