import 'package:manpower_station/app/models/worker_model.dart';
import 'package:manpower_station/app/services/api_client.dart';

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
static Future<void> userReview(bookingId,mapData) async {

    try {
      var url='/api/reviews/create/review/$bookingId';
      await BaseClient.safeApiCall(url, RequestType.put,
          data: mapData,
          onSuccess: (response) {
        if (response.statusCode == 200) {
          var jsonData = response.data['worker'];
          print("successful");

        } else {
          print('Failed to give review: ${response.statusMessage}');
        }
      });
    } catch (e) {
      print(e);
    }
  }
}
