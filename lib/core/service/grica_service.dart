import 'package:dio/dio.dart';
import 'package:grica/core/model/response_model.dart';

class GricaServices {
  final Dio api = Dio();
  final String apiUrl = "http://178.32.198.12:8084/";
  Future<ResponseModel> getParameter(String route) async {
    try {
      Response res = await api.get(apiUrl + route);
      return ResponseModel(
          statusCode: res.statusCode ?? 404,
          body: res.data,
          errorMessage: res.statusMessage);
    } on DioError catch (e) {
      return ResponseModel(
        errorMessage:
            e.response!.statusMessage.toString() + e.message.toString(),
        statusCode: e.response?.statusCode ?? 404,
        body: null,
      );
    }
  }

  Future<ResponseModel> handlePostMethode(
      String route, Map<String, dynamic> data) async {
    try {
      Response response = await api.post(apiUrl, data: data

          // options: Options(contentType: Headers.jsonContentType),
          );

      return ResponseModel(
          statusCode: response.statusCode ?? 404,
          body: response.data,
          errorMessage: response.statusMessage);
    } on DioError catch (e) {
      // print("welcome to the error");
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.
      if (e.response != null) {
        // print(e.response!.data);
        // print(e.response!.headers);
        // print(e.response!.requestOptions.path);
      }
      return ResponseModel(
        errorMessage:
            e.response!.statusMessage.toString() + e.message.toString(),
        statusCode: e.response?.statusCode ?? 404,
        body: null,
      );
    }
  }
}
