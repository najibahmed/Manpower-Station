// ignore_for_file: unused_import

import 'package:dio/dio.dart';
import 'package:manpower_station/utils/appLoggerUtils.dart';
import '../../../network/api_client.dart';
import '../../../network/api_list.dart';

class UserRepository {


   Future<Response<dynamic>> postData(requestData,String appUrl) async {
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

   Future<Response<dynamic>> getData(String appUrl) async {
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


   Future<Response<dynamic>> putData(requestData,String appUrl) async {
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
