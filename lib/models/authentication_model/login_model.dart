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



/*

{
    "success": true,
    "message": "Admin logged in successfully",
    "data": {
        "phoneVerified": true,
        "auth": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY1MWFhOTQzNzVlMDliMmU2ZTBlYTIxNCIsImNyZWF0ZWRBdCI6IjIwMjMtMTAtMDJUMTE6Mjg6MDMuNDEwWiIsInVwZGF0ZWRBdCI6IjIwMjMtMTAtMDJUMTE6Mjg6MjIuMjg3WiIsImZ1bGxOYW1lIjoiTGF3YWwgWXVzdWYiLCJ1c2VyTmFtZSI6InNvbGlkc29sdXRpb25zMDAxIiwicGFzc3dvcmQiOiIkMmEkMTAkQWlOSnVubG0uaFp0a3kxemJrdWM4LmhKZDZVWnBwNmJvbVFQeWtEeVhneVh1T0p3ajlPL0MiLCJlbWFpbCI6Im51cnVkZWVucmFiaXU4MUBnbWFpbC5jb20iLCJwaG9uZU51bWJlciI6IjA5MDM3NTgzNDMwIiwiYWNjb3VudFN0YXR1cyI6ImFjdGl2ZSIsInBob25lVmVyaWZpY2F0aW9uVG9rZW4iOiIiLCJwaG9uZVZlcmlmaWNhdGlvblRva2VuVFRMIjoiIiwiZW1haWxWZXJpZmljYXRpb25Ub2tlbiI6IiIsImVtYWlsVmVyaWZpZWQiOnRydWUsInBob25lVmVyaWZpZWQiOnRydWUsInBhc3N3b3JkUmVzZXRUb2tlblRUTCI6IiIsInBhc3N3b3JkUmVzZXRUb2tlbiI6IiIsImF2YXRhciI6IiIsImxvZ2luU2Vzc2lvbiI6InhwTXl5eUNOYVRlMWZTM0FhQ2hsZyIsInJvbGUiOiJhZG1pbiIsImlhdCI6MTY5NjI0NjEwMiwiZXhwIjoxNjk4ODM4MTAyfQ.w0Ioyqq7bwficfcePccnUhaS3jYzqXLYJpj40hTwZ2Y"
    }
}

 */