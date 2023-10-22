class LocalExceptionModel {
  bool isSuccessful;
  String message;
  final dynamic model;
  LocalExceptionModel(
      {required this.isSuccessful, required this.message, this.model});
  @override
  String toString() {
    Map<String, dynamic> data = {
      "isSuccessful": isSuccessful,
      "message": message,
      "model": model
    };
    return data.toString();
  }
}
