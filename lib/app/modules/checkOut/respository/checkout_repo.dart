import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:manpower_station/utils/appLoggerUtils.dart';
import '../../../components/custom_snackbar.dart';
import '../../../data/local/my_shared_pref.dart';
import '../../../network/api_client.dart';


class CheckoutRepo {

   Future<Response<dynamic>> postData( requestData,String appUrl) async {
    late Response<dynamic> apiResponse;
    try {
      await await BaseClient.safeApiCall(
            appUrl,
            RequestType.post,
            data: requestData,
            headers: {
              'Content-Type': 'application/json',
              'Accept': 'application/json',
              'Authorization': MySharedPref.getAccessToken()        //MySharedPref.getAccessToken()
            },
            onSuccess: (response) async {
                apiResponse=response;
            }
        );

    } catch (e) {
      LoggerUtil.instance.printLog(msg: 'Error Post Data : ${e.toString()}');
    }
    return apiResponse;
  }

  Future<Response<dynamic>> postWithOutData(String appUrl) async {
    late Response<dynamic> apiResponse;
    try {
      await await BaseClient.safeApiCall(
            appUrl,
            RequestType.post,
            headers: {
              'Content-Type': 'application/json',
              'Accept': 'application/json',
              'Authorization': MySharedPref.getAccessToken()        //MySharedPref.getAccessToken()
            },
          onError: (err){
            apiResponse= err.response!;
          },
            onSuccess: (response) async {
                apiResponse = response;
            }
        );

    } catch (e) {
      LoggerUtil.instance.printLog(msg: 'Error Post Data : ${e.toString()}');
    }
    return apiResponse;
  }
}

