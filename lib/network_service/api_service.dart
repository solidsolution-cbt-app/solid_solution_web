// import 'dart:async';
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:solidsolutionweb/core/local_data_base.dart';
import 'package:solidsolutionweb/models/authentication_model/login_model.dart';
import 'package:solidsolutionweb/models/exception_model_calss/api_errors.dart';
import 'package:solidsolutionweb/models/exception_model_calss/local_errors.dart.dart';
import 'package:solidsolutionweb/models/topic_quiz_model.dart';
import 'package:solidsolutionweb/network_service/end_point.dart';

ApiService apiService = ApiService();

class ApiService {
  Future<LocalExceptionModel> login({required String dataSent}) async {
    try {
      http.Response? response;
      response = await http.put(
        Uri.parse(EndPoints.baseUrl + EndPoints.login),
        body: dataSent,
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
        },
      );
      var data = jsonDecode(response.body);

      if (response.statusCode == 200) {
        LoginModel returnedData = LoginModel.fromJson(apiData: data);
        return LocalExceptionModel(
          isSuccessful: true,
          message: "success",
          model: returnedData,
        );
      } else {
        return LocalExceptionModel(
          isSuccessful: false,
          message: data["message"],
        );
      }
    } catch (e) {
      if (e is SocketException) {
        return LocalExceptionModel(
          isSuccessful: false,
          message: apiErrors.getErrorMessageFromException(
            e: RunTimeTypeExceptions.socketException,
          ),
        );
      } else if (e is TimeoutException) {
        return LocalExceptionModel(
          isSuccessful: false,
          message: apiErrors.getErrorMessageFromException(
            e: RunTimeTypeExceptions.timeOutException,
          ),
        );
      } else {
        return LocalExceptionModel(
          isSuccessful: false,
          message: apiErrors.getErrorMessageFromException(
            e: RunTimeTypeExceptions.unKnownException,
          ),
        );
      }
    }
  }

  Future<LocalExceptionModel> addTopicQuiz({
    required Map<String, String> dataSent,
  }) async {
    String token = StorageUtil.getString(
      key: LocalDBStrings.token,
    );
    try {
      http.Response? response;
      response = await http.post(
        Uri.parse(EndPoints.baseUrl + EndPoints.addTopic),
        body: jsonEncode(dataSent),
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
          HttpHeaders.authorizationHeader: "Bearer $token",
        },
      );
      var data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        TopicModel returnedData = TopicModel.fromjson(data: data["data"]);
        return LocalExceptionModel(
          isSuccessful: true,
          message: data["message"],
          model: returnedData,
        );
      } else {
        return LocalExceptionModel(
          isSuccessful: false,
          message: data["message"],
        );
      }
    } catch (e) {
      if (e is SocketException) {
        return LocalExceptionModel(
          isSuccessful: false,
          message: apiErrors.getErrorMessageFromException(
            e: RunTimeTypeExceptions.socketException,
          ),
        );
      } else if (e is TimeoutException) {
        return LocalExceptionModel(
          isSuccessful: false,
          message: apiErrors.getErrorMessageFromException(
            e: RunTimeTypeExceptions.timeOutException,
          ),
        );
      } else {
        return LocalExceptionModel(
          isSuccessful: false,
          message: apiErrors.getErrorMessageFromException(
            e: RunTimeTypeExceptions.unKnownException,
          ),
        );
      }
    }
  }

  Future<LocalExceptionModel> getTopicQuiz({
    required String subject,
    required String pageNumber,
  }) async {
    String token = StorageUtil.getString(
      key: LocalDBStrings.token,
    );
    try {
      http.Response? response;
      response = await http.get(
        Uri.parse(
          "${EndPoints.baseUrl}${EndPoints.getTopic}=$subject&page=$pageNumber",
        ),
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
          HttpHeaders.authorizationHeader: "Bearer $token",
        },
      );
      var data = jsonDecode(response.body);

      if (response.statusCode == 200) {
        List<dynamic> topics = data["data"];
        List<TopicModel> returnedData = topics
            .map(
              (e) => TopicModel.fromjson(
                data: e,
              ),
            )
            .toList();
        return LocalExceptionModel(
          isSuccessful: true,
          message: data["message"],
          model: returnedData,
        );
      } else {
        return LocalExceptionModel(
          isSuccessful: false,
          message: data["message"],
        );
      }
    } catch (e) {
      print(e);
      if (e is SocketException) {
        return LocalExceptionModel(
          isSuccessful: false,
          message: apiErrors.getErrorMessageFromException(
            e: RunTimeTypeExceptions.socketException,
          ),
        );
      } else if (e is TimeoutException) {
        return LocalExceptionModel(
          isSuccessful: false,
          message: apiErrors.getErrorMessageFromException(
            e: RunTimeTypeExceptions.timeOutException,
          ),
        );
      } else {
        return LocalExceptionModel(
          isSuccessful: false,
          message: apiErrors.getErrorMessageFromException(
            e: RunTimeTypeExceptions.unKnownException,
          ),
        );
      }
    }
  }
}
