class ResponseModel {
  ResponseModel({
    this.errorMessage,
    required this.statusCode,
    required this.body,
  });
  final String? errorMessage;
  final int statusCode;
  final dynamic body;
}
