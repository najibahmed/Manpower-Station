import 'package:dio/dio.dart';
import 'package:manpower_station/utils/appLoggerUtils.dart';
import '../../../network/api_client.dart';
import '../../../network/api_list.dart';

class ServiceRepository {

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

}
