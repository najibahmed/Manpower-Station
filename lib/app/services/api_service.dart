import 'package:manpower_station/app/models/worker_model.dart';
import 'package:manpower_station/app/services/api_client.dart';
import 'package:manpower_station/utils/constants.dart';

class ApiServices{


  static Future<WorkerModel> getSingleWorker(id) async {
    late WorkerModel workerModel;
    try {
      var url='/api/workers/get/unique/worker/profile/$id';
      await BaseClient.safeApiCall(url, RequestType.get, onSuccess: (response) {
        if (response.statusCode == 201) {
          var jsonData = response.data['worker'];
           workerModel = WorkerModel.fromJson(jsonData);
        } else {
          print('Failed to load worker: ${response.statusMessage}');
        }
      });
    } catch (e) {
      print(e);
    }
    return workerModel;
  }
static Future<void> userReview(bookingId, Map<String, dynamic> reviewData ) async {
    try {
      var url='/api/reviews/create/review/$bookingId';
      await BaseClient.safeApiCall(
          url, RequestType.put,
          headers: {
        'Authorization': Constants.accessToken
          },
          // data: {
          //   "comment": "${data['comment']}",
          //   "rating":data['rating'],
          //   "serviceId": data['serviceId'],
          //   "workerId": data['workerId'],
          // },
          data:reviewData,
          onSuccess: (response) {
        if (response.statusCode == 200) {
          // var jsonData = response.data['worker'];
          print("${response.data}");

        } else {
          print('Failed to give review: ${response.statusMessage}');
        }
      });
    } catch (e) {
      print('Failed to give review: $e');
    }
  }
}
