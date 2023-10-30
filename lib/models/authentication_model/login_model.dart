import 'dart:convert';

class LoginModel {
  String? phoneNumber;
  String? password;
  String? token;
  String? dataSent;
  LoginModel({required this.password, required this.phoneNumber});

  LoginModel.tojson({required LoginModel loginModel}) {
    Map<String, dynamic> loginData = {
      "phone": loginModel.phoneNumber,
      "password": loginModel.password
    };
    dataSent = jsonEncode(loginData);
  }
  LoginModel.fromJson({required Map<String, dynamic> apiData}) {
    token = apiData["data"]["auth"];
  }
  @override
  String toString() {
    Map<String, dynamic> data = {
      "phoneNumber": phoneNumber,
      "password": password,
    };
    return data.toString();
  }
}
