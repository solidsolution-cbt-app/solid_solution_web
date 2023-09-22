// // import 'dart:async';
// import 'dart:async';
// import 'dart:convert';
// import 'dart:io';
// import 'package:http/http.dart' as http;

// class ApiService {
//   // String token = StorageUtil.getString(key: "token");
//   ApiErrors apiErrors = ApiErrors();
//   Future<LocalExceptionModel> signUp({required String dataSent}) async {
//     try {
//       http.Response? response;
//       // print(dataSent);
//       response = await http.post(
//         Uri.parse(EndPoints.baseUrl + EndPoints.userRegister),
//         body: dataSent,
//         headers: {
//           HttpHeaders.contentTypeHeader: 'application/json',
//         },
//       );
//       var data = jsonDecode(response.body);
//       // print("response: $data");
//       // print(response.statusCode.toString());
//       if (response.statusCode == 200) {
//         SignUpModel returnedData = SignUpModel.fromjson(apiData: data);
//         return LocalExceptionModel(
//           isSuccessful: true,
//           message: "success",
//           model: returnedData,
//         );
//       } else {
//         return LocalExceptionModel(
//           isSuccessful: false,
//           message: data["message"],
//         );
//       }
//     } catch (e) {
//       // print(e);
//       if (e is SocketException) {
//         return LocalExceptionModel(
//           isSuccessful: false,
//           message: apiErrors.getErrorMessageFromException(
//             e: RunTimeTypeExceptions.socketException,
//           ),
//         );
//       } else if (e is TimeoutException) {
//         return LocalExceptionModel(
//           isSuccessful: false,
//           message: apiErrors.getErrorMessageFromException(
//             e: RunTimeTypeExceptions.timeOutException,
//           ),
//         );
//       } else {
//         return LocalExceptionModel(
//           isSuccessful: false,
//           message: apiErrors.getErrorMessageFromException(
//             e: RunTimeTypeExceptions.unKnownException,
//           ),
//         );
//       }
//     }
//   }

//   Future<LocalExceptionModel> login({required String dataSent}) async {
//     try {
//       http.Response? response;
//       // print(dataSent);
//       response = await http.put(
//         Uri.parse(EndPoints.baseUrl + EndPoints.login),
//         body: dataSent,
//         headers: {
//           HttpHeaders.contentTypeHeader: 'application/json',
//         },
//       );
//       var data = jsonDecode(response.body);
//       // print(data);
//       if (response.statusCode == 200) {
//         LoginModel returnedData = LoginModel.fromjson(apiData: data["data"]);
//         return LocalExceptionModel(
//           isSuccessful: true,
//           message: "success",
//           model: returnedData,
//         );
//       } else {
//         return LocalExceptionModel(
//           isSuccessful: false,
//           message: data["message"],
//         );
//       }
//     } catch (e) {
//       // print(e);
//       if (e is SocketException) {
//         return LocalExceptionModel(
//           isSuccessful: false,
//           message: apiErrors.getErrorMessageFromException(
//             e: RunTimeTypeExceptions.socketException,
//           ),
//         );
//       } else if (e is TimeoutException) {
//         return LocalExceptionModel(
//           isSuccessful: false,
//           message: apiErrors.getErrorMessageFromException(
//             e: RunTimeTypeExceptions.timeOutException,
//           ),
//         );
//       } else {
//         return LocalExceptionModel(
//           isSuccessful: false,
//           message: apiErrors.getErrorMessageFromException(
//             e: RunTimeTypeExceptions.unKnownException,
//           ),
//         );
//       }
//     }
//   }

//   Future<LocalExceptionModel> initiatePasswordReset(
//       {required String phoneNumber}) async {
//     try {
//       http.Response? response;
//       response = await http.put(
//         Uri.parse(
//           EndPoints.baseUrl + EndPoints.initiatePasswordRecovery + phoneNumber,
//         ),
//         headers: {
//           HttpHeaders.contentTypeHeader: 'application/json',
//         },
//       );
//       var data = jsonDecode(response.body);
//       // print("response: $data");
//       // print(response.statusCode.toString());
//       if (response.statusCode == 200) {
//         return LocalExceptionModel(
//           isSuccessful: true,
//           message: data["message"],
//         );
//       } else {
//         return LocalExceptionModel(
//           isSuccessful: false,
//           message: data["message"],
//         );
//       }
//     } catch (e) {
//       // print(e);
//       if (e is SocketException) {
//         return LocalExceptionModel(
//           isSuccessful: false,
//           message: apiErrors.getErrorMessageFromException(
//             e: RunTimeTypeExceptions.socketException,
//           ),
//         );
//       } else if (e is TimeoutException) {
//         return LocalExceptionModel(
//           isSuccessful: false,
//           message: apiErrors.getErrorMessageFromException(
//             e: RunTimeTypeExceptions.timeOutException,
//           ),
//         );
//       } else {
//         return LocalExceptionModel(
//           isSuccessful: false,
//           message: apiErrors.getErrorMessageFromException(
//             e: RunTimeTypeExceptions.unKnownException,
//           ),
//         );
//       }
//     }
//   }

//   Future<LocalExceptionModel> verifyForgotPasswordToken(
//       {required String token}) async {
//     try {
//       http.Response? response;
//       response = await http.put(
//         Uri.parse(
//             EndPoints.baseUrl + EndPoints.verifyForgotPasswordToken + token),
//         headers: {
//           HttpHeaders.contentTypeHeader: 'application/json',
//         },
//       );
//       var data = jsonDecode(response.body);
//       // print("response: $data");
//       // print(response.statusCode.toString());
//       if (response.statusCode == 200) {
//         return LocalExceptionModel(
//           isSuccessful: true,
//           message: data["message"],
//           model: data["data"]["auth"],
//         );
//       } else {
//         return LocalExceptionModel(
//           isSuccessful: false,
//           message: data["message"],
//         );
//       }
//     } catch (e) {
//       // print(e);
//       if (e is SocketException) {
//         return LocalExceptionModel(
//           isSuccessful: false,
//           message: apiErrors.getErrorMessageFromException(
//             e: RunTimeTypeExceptions.socketException,
//           ),
//         );
//       } else if (e is TimeoutException) {
//         return LocalExceptionModel(
//           isSuccessful: false,
//           message: apiErrors.getErrorMessageFromException(
//             e: RunTimeTypeExceptions.timeOutException,
//           ),
//         );
//       } else {
//         return LocalExceptionModel(
//           isSuccessful: false,
//           message: apiErrors.getErrorMessageFromException(
//             e: RunTimeTypeExceptions.unKnownException,
//           ),
//         );
//       }
//     }
//   }

//   Future<LocalExceptionModel> setNewPassword(
//       {required String newPassword}) async {
//     String token = StorageUtil.getString(key: LocalDBStrings.token);
//     try {
//       http.Response? response;
//       response = await http.put(
//         Uri.parse(EndPoints.baseUrl + EndPoints.updatePassword + newPassword),
//         headers: {
//           HttpHeaders.contentTypeHeader: 'application/json',
//           "x-auth-code": token
//         },
//       );
//       var data = jsonDecode(response.body);
//       // print("response: $data");
//       // print(response.statusCode.toString());
//       if (response.statusCode == 200) {
//         return LocalExceptionModel(
//           isSuccessful: true,
//           message: data["message"],
//         );
//       } else {
//         return LocalExceptionModel(
//           isSuccessful: false,
//           message: data["message"],
//         );
//       }
//     } catch (e) {
//       // print(e);
//       if (e is SocketException) {
//         return LocalExceptionModel(
//           isSuccessful: false,
//           message: apiErrors.getErrorMessageFromException(
//             e: RunTimeTypeExceptions.socketException,
//           ),
//         );
//       } else if (e is TimeoutException) {
//         return LocalExceptionModel(
//           isSuccessful: false,
//           message: apiErrors.getErrorMessageFromException(
//             e: RunTimeTypeExceptions.timeOutException,
//           ),
//         );
//       } else {
//         return LocalExceptionModel(
//           isSuccessful: false,
//           message: apiErrors.getErrorMessageFromException(
//             e: RunTimeTypeExceptions.unKnownException,
//           ),
//         );
//       }
//     }
//   }

//   Future<LocalExceptionModel> resendOtp() async {
//     String token = StorageUtil.getString(key: LocalDBStrings.token);
//     try {
//       http.Response? response;
//       response = await http.put(
//         Uri.parse(EndPoints.baseUrl + EndPoints.resendOtp),
//         headers: {"AUTHORIZATION": "Bearer $token"},
//       );
//       var data = jsonDecode(response.body);
//       // print("response: $data");
//       // print(response.statusCode.toString());
//       if (response.statusCode == 200) {
//         return LocalExceptionModel(
//           isSuccessful: true,
//           message: data["message"],
//         );
//       } else {
//         return LocalExceptionModel(
//           isSuccessful: false,
//           message: data["message"],
//         );
//       }
//     } catch (e) {
//       // print(e);
//       if (e is SocketException) {
//         return LocalExceptionModel(
//           isSuccessful: false,
//           message: apiErrors.getErrorMessageFromException(
//             e: RunTimeTypeExceptions.socketException,
//           ),
//         );
//       } else if (e is TimeoutException) {
//         return LocalExceptionModel(
//           isSuccessful: false,
//           message: apiErrors.getErrorMessageFromException(
//             e: RunTimeTypeExceptions.timeOutException,
//           ),
//         );
//       } else {
//         return LocalExceptionModel(
//           isSuccessful: false,
//           message: apiErrors.getErrorMessageFromException(
//             e: RunTimeTypeExceptions.unKnownException,
//           ),
//         );
//       }
//     }
//   }

//   Future<LocalExceptionModel> verifyOtp({required String token}) async {
//     try {
//       http.Response? response;
//       response = await http.put(
//         Uri.parse(EndPoints.baseUrl + EndPoints.verifyOtp + token),
//         headers: {
//           HttpHeaders.contentTypeHeader: 'application/json',
//         },
//       );
//       var data = jsonDecode(response.body);
//       // print("response: $data");
//       // print(response.statusCode.toString());
//       if (response.statusCode == 200) {
//         return LocalExceptionModel(
//           isSuccessful: true,
//           message: data["message"],
//           model: data["data"]["auth"],
//         );
//       } else {
//         return LocalExceptionModel(
//           isSuccessful: false,
//           message: data["message"],
//         );
//       }
//     } catch (e) {
//       // print(e);
//       if (e is SocketException) {
//         return LocalExceptionModel(
//           isSuccessful: false,
//           message: apiErrors.getErrorMessageFromException(
//             e: RunTimeTypeExceptions.socketException,
//           ),
//         );
//       } else if (e is TimeoutException) {
//         return LocalExceptionModel(
//           isSuccessful: false,
//           message: apiErrors.getErrorMessageFromException(
//             e: RunTimeTypeExceptions.timeOutException,
//           ),
//         );
//       } else {
//         return LocalExceptionModel(
//           isSuccessful: false,
//           message: apiErrors.getErrorMessageFromException(
//             e: RunTimeTypeExceptions.unKnownException,
//           ),
//         );
//       }
//     }
//   }

//   Future<LocalExceptionModel> getSubjects() async {
//     try {
//       http.Response? response;
//       // print(dataSent);
//       response = await http.get(
//         Uri.parse(EndPoints.baseUrl + EndPoints.subjects),
//         headers: {
//           HttpHeaders.contentTypeHeader: 'application/json',
//         },
//       );
//       var data = jsonDecode(response.body);
//       // print(data);
//       if (response.statusCode == 200) {
//         SubjectModel subjects = SubjectModel.fromjson(apisubjects: data);
//         return LocalExceptionModel(
//           isSuccessful: true,
//           message: "success",
//           model: subjects,
//         );
//       } else {
//         return LocalExceptionModel(
//           isSuccessful: false,
//           message: data["message"],
//         );
//       }
//     } catch (e) {
//       // print(e);
//       if (e is SocketException) {
//         return LocalExceptionModel(
//           isSuccessful: false,
//           message: apiErrors.getErrorMessageFromException(
//             e: RunTimeTypeExceptions.socketException,
//           ),
//         );
//       } else if (e is TimeoutException) {
//         return LocalExceptionModel(
//           isSuccessful: false,
//           message: apiErrors.getErrorMessageFromException(
//             e: RunTimeTypeExceptions.timeOutException,
//           ),
//         );
//       } else {
//         return LocalExceptionModel(
//           isSuccessful: false,
//           message: apiErrors.getErrorMessageFromException(
//             e: RunTimeTypeExceptions.unKnownException,
//           ),
//         );
//       }
//     }
//   }
// }


//  // Future<LocalExceptionModel> resendOtp({
//   //   required String emailAddress,
//   //   required AccountType userType,
//   // }) async {
//   //   ResendOtpModel resendOtp = ResendOtpModel.tojson(
//   //     email: emailAddress,
//   //     userType: userType,
//   //   );
//   //   try {
//   //     http.Response? response;
//   //     response = await http.post(
//   //       Uri.parse(EndPoints.baseUrl + EndPoints.resendVerificationToken),
//   //       body: resendOtp.dataSent,
//   //       headers: {
//   //         HttpHeaders.contentTypeHeader: 'application/json',
//   //       },
//   //     );
//   //     var data = jsonDecode(response.body);
//   //     // print("response: $data");
//   //     // print(response.statusCode.toString());
//   //     if (response.statusCode == 200) {
//   //       return LocalExceptionModel(
//   //         isSuccessful: true,
//   //         message: data["message"],
//   //       );
//   //     } else {
//   //       return LocalExceptionModel(
//   //         isSuccessful: false,
//   //         message: "unable to complete the process, please try again",
//   //       );
//   //     }
//   //   } catch (e) {
//   //     throw LocalExceptionModel(isSuccessful: false, message: e.toString());
//   //   }
//   // }

//   // Future<LocalExceptionModel> verifyAccount({
//   //   required String emailAddress,
//   //   required AccountType userType,
//   //   required String code,
//   // }) async {
//   //   VerifyAccountModel verifyAccount = VerifyAccountModel.tojson(
//   //     email: emailAddress,
//   //     userType: userType,
//   //     code: code,
//   //   );
//   //   try {
//   //     http.Response? response;
//   //     response = await http.post(
//   //       Uri.parse(
//   //         EndPoints.baseUrl + EndPoints.verifyAccount,
//   //       ),
//   //       body: verifyAccount.dataSent,
//   //       headers: {
//   //         HttpHeaders.contentTypeHeader: 'application/json',
//   //       },
//   //     );
//   //     var data = jsonDecode(response.body);
//   //     // print("response: $data");
//   //     // print(response.statusCode.toString());
//   //     if (response.statusCode == 200) {
//   //       VerifyAccountModel successData =
//   //           VerifyAccountModel.fromjson(data: data);
//   //       return LocalExceptionModel(
//   //         isSuccessful: true,
//   //         message: successData.message!,
//   //         model: successData,
//   //       );
//   //     } else {
//   //       VerifyAccountModel errorData = VerifyAccountModel.error(data: data);
//   //       if (errorData.success == false) {
//   //         return LocalExceptionModel(
//   //           isSuccessful: false,
//   //           message: errorData.message!,
//   //         );
//   //       }
//   //       return LocalExceptionModel(
//   //         isSuccessful: false,
//   //         message: "unable to complete the process, please try again",
//   //       );
//   //     }
//   //   } catch (e) {
//   //     throw LocalExceptionModel(isSuccessful: false, message: e.toString());
//   //   }
//   // }

//   // Future<LocalExceptionModel> login({
//   //   required String emailAddress,
//   //   required AccountType userType,
//   //   required String password,
//   //   required String pushToken,
//   // }) async {
//   //   LoginModel loginModel = LoginModel.tojson(
//   //     email: emailAddress,
//   //     password: password,
//   //     pushToken: "",
//   //     accountType: userType,
//   //   );
//   //   try {
//   //     http.Response? response;
//   //     response = await http.post(
//   //       Uri.parse(
//   //         EndPoints.baseUrl + EndPoints.login,
//   //       ),
//   //       body: loginModel.dataSent,
//   //       headers: {
//   //         HttpHeaders.contentTypeHeader: 'application/json',
//   //       },
//   //     );
//   //     var data = jsonDecode(response.body);
//   //     // print("response: $data");
//   //     // print(response.statusCode.toString());
//   //     if (response.statusCode == 200) {
//   //       LoginModel successData = LoginModel.fromjson(data: data);
//   //       return LocalExceptionModel(
//   //         isSuccessful: true,
//   //         message: successData.message!,
//   //         model: successData,
//   //       );
//   //     } else {
//   //       LoginModel errorData = LoginModel.error(data: data);
//   //       if (errorData.success == false) {
//   //         // print("data$errorData");
//   //         return LocalExceptionModel(
//   //           isSuccessful: false,
//   //           message: errorData.message!,
//   //           model: errorData,
//   //         );
//   //       }
//   //       return LocalExceptionModel(
//   //         isSuccessful: false,
//   //         message: "unable to complete the process, please try again",
//   //       );
//   //     }
//   //   } catch (e) {
//   //     throw LocalExceptionModel(isSuccessful: false, message: e.toString());
//   //   }
//   // }

//   // Future<LocalExceptionModel> requestPasswordResetOtp({
//   //   required String emailAddress,
//   //   required AccountType userType,
//   // }) async {
//   //   RequestPasswordResetModel requestPasswordResetModel =
//   //       RequestPasswordResetModel.tojson(
//   //     email: emailAddress,
//   //     userType: userType,
//   //   );
//   //   try {
//   //     http.Response? response;
//   //     response = await http.post(
//   //       Uri.parse(EndPoints.baseUrl + EndPoints.passwordResetRequest),
//   //       body: requestPasswordResetModel.dataSent,
//   //       headers: {
//   //         HttpHeaders.contentTypeHeader: 'application/json',
//   //       },
//   //     );
//   //     var data = jsonDecode(response.body);
//   //     // print("response: $data");
//   //     // print(response.statusCode.toString());
//   //     if (response.statusCode == 200) {
//   //       return LocalExceptionModel(
//   //         isSuccessful: true,
//   //         message: data["message"],
//   //       );
//   //     } else {
//   //       RequestPasswordResetModel errorData =
//   //           RequestPasswordResetModel.error(data: data);
//   //       return LocalExceptionModel(
//   //         isSuccessful: false,
//   //         message: errorData.message!,
//   //       );
//   //     }
//   //   } catch (e) {
//   //     throw LocalExceptionModel(isSuccessful: false, message: e.toString());
//   //   }
//   // }

//   // Future<LocalExceptionModel> setNewPassword({
//   //   required String emailAddress,
//   //   required AccountType userType,
//   //   required String password,
//   //   required String code,
//   // }) async {
//   //   SetNewPasswordModel setNewPasswordModel = SetNewPasswordModel.tojson(
//   //     email: emailAddress,
//   //     password: password,
//   //     code: code,
//   //     accountType: userType,
//   //   );
//   //   try {
//   //     http.Response? response;
//   //     response = await http.post(
//   //       Uri.parse(
//   //         EndPoints.baseUrl + EndPoints.resetPassword,
//   //       ),
//   //       body: setNewPasswordModel.dataSent,
//   //       headers: {
//   //         HttpHeaders.contentTypeHeader: 'application/json',
//   //       },
//   //     );
//   //     var data = jsonDecode(response.body);
//   //     // print("response: $data");
//   //     // print(response.statusCode.toString());
//   //     if (response.statusCode == 200) {
//   //       SetNewPasswordModel successData =
//   //           SetNewPasswordModel.fromjson(data: data);
//   //       return LocalExceptionModel(
//   //         isSuccessful: true,
//   //         message: successData.message!,
//   //         model: successData,
//   //       );
//   //     } else {
//   //       SetNewPasswordModel errorData = SetNewPasswordModel.error(data: data);
//   //       if (errorData.success == false) {
//   //         // print("data$errorData");
//   //         return LocalExceptionModel(
//   //           isSuccessful: false,
//   //           message: errorData.message!,
//   //           model: errorData,
//   //         );
//   //       }
//   //       return LocalExceptionModel(
//   //         isSuccessful: false,
//   //         message: "unable to complete the process, please try again",
//   //       );
//   //     }
//   //   } catch (e) {
//   //     throw LocalExceptionModel(isSuccessful: false, message: e.toString());
//   //   }
//   // }

//   // Future<List<dynamic>> getSuggestedAppliances() async {
//   //   try {
//   //     http.Response? response;
//   //     response = await http.get(
//   //       Uri.parse(
//   //         EndPoints.baseUrl + EndPoints.suggestedAppliance,
//   //       ),
//   //       headers: {
//   //         HttpHeaders.contentTypeHeader: 'application/json',
//   //       },
//   //     );
//   //     var data = jsonDecode(response.body);
//   //     // print("response: $data");
//   //     // print(response.statusCode.toString());
//   //     SuggestedApplianceModel suggestedApplianceModel =
//   //         SuggestedApplianceModel.fromjson(data: data);
//   //     // print(suggestedApplianceModel.toString());
//   //     List<dynamic> suggestedAppliances =
//   //         suggestedApplianceModel.suggestedAppliances;
//   //     return suggestedAppliances;
//   //   } catch (e) {
//   //     // print(e);
//   //     return [];
//   //   }
//   // }