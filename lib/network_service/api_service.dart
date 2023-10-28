// import 'dart:async';
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:solidsolutionweb/core/local_data_base.dart';
import 'package:solidsolutionweb/models/authentication_model/login_model.dart';
import 'package:solidsolutionweb/models/exception_model_calss/api_errors.dart';
import 'package:solidsolutionweb/models/exception_model_calss/local_errors.dart.dart';
import 'package:solidsolutionweb/models/question_model.dart';
import 'package:solidsolutionweb/models/topic_quiz_model.dart';
import 'package:solidsolutionweb/network_service/end_point.dart';
import 'package:cloudinary/cloudinary.dart';

ApiService apiService = ApiService();

final cloudinary = Cloudinary.signedConfig(
  apiKey: ClodinaryConstants.apiKey,
  apiSecret: ClodinaryConstants.apiSecret,
  cloudName: ClodinaryConstants.cloudName,
);

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
      // print(e);
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
      // print(data);
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
      // print(e);
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

  Future<LocalExceptionModel> uploadImage(
      {required Uint8List imagePath, required String filename}) async {
    try {
      final response = await cloudinary.upload(
        fileBytes: imagePath,
        resourceType: CloudinaryResourceType.image,
        fileName: "$filename${DateTime.now().millisecondsSinceEpoch}",
        progressCallback: (count, total) {
          // print('Uploading image from file with progress: $count/$total');
        },
      );
      if (response.isSuccessful) {
        // print('Get your image from with ${response.secureUrl}');
        return LocalExceptionModel(
          isSuccessful: true,
          message: "successful",
          model: response.secureUrl ?? "",
        );
      } else {
        return LocalExceptionModel(
          isSuccessful: false,
          message: "error",
        );
      }
    } catch (e) {
      // print(e);
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

  Future<LocalExceptionModel> uploadPdf(
      {required Uint8List imagePath, required String filename}) async {
    try {
      final response = await cloudinary.upload(
        fileBytes: imagePath,
        fileName: "$filename${DateTime.now().millisecondsSinceEpoch}",
        progressCallback: (count, total) {
          // print('Uploading image from file with progress: $count/$total');
        },
      );
      if (response.isSuccessful) {
        // print('Get your image from with ${response.secureUrl}');
        return LocalExceptionModel(
          isSuccessful: true,
          message: "successful",
          model: response.secureUrl ?? "",
        );
      } else {
        return LocalExceptionModel(
          isSuccessful: false,
          message: "error",
        );
      }
    } catch (e) {
      // print(e);
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

  Future<LocalExceptionModel> addTopicQuestion(
      {required String dataSent, required String topicId}) async {
    String token = StorageUtil.getString(
      key: LocalDBStrings.token,
    );
    try {
      http.Response? response;
      response = await http.post(
        Uri.parse("${EndPoints.baseUrl}${EndPoints.addTopicQuestion}$topicId"),
        body: dataSent,
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
          HttpHeaders.authorizationHeader: "Bearer $token",
        },
      );
      var data = jsonDecode(response.body);

      if (response.statusCode == 200) {
        QuestionModel question = QuestionModel.fromjson(data: data["data"]);
        return LocalExceptionModel(
          isSuccessful: true,
          message: data["message"],
          model: question,
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

  Future<LocalExceptionModel> editTopicQuestion(
      {required String dataSent, required String questionId}) async {
    String token = StorageUtil.getString(
      key: LocalDBStrings.token,
    );
    try {
      http.Response? response;
      response = await http.put(
        Uri.parse(
            "${EndPoints.baseUrl}${EndPoints.editTopicQuestionData}$questionId"),
        body: dataSent,
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
          HttpHeaders.authorizationHeader: "Bearer $token",
        },
      );
      var data = jsonDecode(response.body);

      if (response.statusCode == 200) {
        return LocalExceptionModel(
          isSuccessful: true,
          message: data["message"],
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

  Future<LocalExceptionModel> getQuestions(
      {required String topicId, required String pageNo}) async {
    String token = StorageUtil.getString(
      key: LocalDBStrings.token,
    );

    try {
      http.Response? response;
      response = await http.get(
        Uri.parse(
          "${EndPoints.baseUrl}${EndPoints.fetchTopicQuestion}$topicId&page=$pageNo",
        ),
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
          HttpHeaders.authorizationHeader: "Bearer $token",
        },
      );
      var data = jsonDecode(response.body);

      if (response.statusCode == 200) {
        List<dynamic> datas = data["data"];
        List<QuestionModel> question = datas
            .map(
              (e) => QuestionModel.fromjson(data: e),
            )
            .toList();
        return LocalExceptionModel(
          isSuccessful: true,
          message: data["message"],
          model: question,
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

  Future<LocalExceptionModel> getQuestionData(
      {required String questionId}) async {
    String token = StorageUtil.getString(
      key: LocalDBStrings.token,
    );

    try {
      http.Response? response;
      response = await http.get(
        Uri.parse(
          "${EndPoints.baseUrl}${EndPoints.fetchTopicQuestionData}$questionId",
        ),
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
          HttpHeaders.authorizationHeader: "Bearer $token",
        },
      );
      var data = jsonDecode(response.body);

      if (response.statusCode == 200) {
        QuestionModel question = QuestionModel.fromjson(data: data["data"]);
        return LocalExceptionModel(
          isSuccessful: true,
          message: data["message"],
          model: question,
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

  Future<LocalExceptionModel> addExamQuestion(
      {required String dataSent, required String subject}) async {
    String token = StorageUtil.getString(
      key: LocalDBStrings.token,
    );
    try {
      http.Response? response;
      response = await http.post(
        Uri.parse("${EndPoints.baseUrl}${EndPoints.addExam}$subject"),
        body: dataSent,
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
          HttpHeaders.authorizationHeader: "Bearer $token",
        },
      );
      var data = jsonDecode(response.body);

      if (response.statusCode == 200) {
        QuestionModel question = QuestionModel.fromjson(data: data["data"]);
        return LocalExceptionModel(
          isSuccessful: true,
          message: data["message"],
          model: question,
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

  Future<LocalExceptionModel> getExamQuestions(
      {required String subject, required String pageNo}) async {
    String token = StorageUtil.getString(
      key: LocalDBStrings.token,
    );

    try {
      http.Response? response;
      response = await http.get(
        Uri.parse(
          "${EndPoints.baseUrl}${EndPoints.fetchExamQuestion}$subject&page=$pageNo",
        ),
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
          HttpHeaders.authorizationHeader: "Bearer $token",
        },
      );
      var data = jsonDecode(response.body);

      if (response.statusCode == 200) {
        List<dynamic> datas = data["data"];
        List<QuestionModel> question = datas
            .map(
              (e) => QuestionModel.fromjson(data: e),
            )
            .toList();
        return LocalExceptionModel(
          isSuccessful: true,
          message: data["message"],
          model: question,
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

  Future<LocalExceptionModel> getExamQuestionData(
      {required String questionId}) async {
    String token = StorageUtil.getString(
      key: LocalDBStrings.token,
    );

    try {
      http.Response? response;
      response = await http.get(
        Uri.parse(
          "${EndPoints.baseUrl}${EndPoints.fetchExamQuestionData}$questionId",
        ),
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
          HttpHeaders.authorizationHeader: "Bearer $token",
        },
      );
      var data = jsonDecode(response.body);

      if (response.statusCode == 200) {
        QuestionModel question = QuestionModel.fromjson(data: data["data"]);
        return LocalExceptionModel(
          isSuccessful: true,
          message: data["message"],
          model: question,
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

  Future<LocalExceptionModel> editExamQuestion(
      {required String dataSent, required String questionId}) async {
    String token = StorageUtil.getString(
      key: LocalDBStrings.token,
    );
    try {
      http.Response? response;
      response = await http.put(
        Uri.parse(
            "${EndPoints.baseUrl}${EndPoints.editExamQuestionData}$questionId"),
        body: dataSent,
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
          HttpHeaders.authorizationHeader: "Bearer $token",
        },
      );
      var data = jsonDecode(response.body);

      if (response.statusCode == 200) {
        return LocalExceptionModel(
          isSuccessful: true,
          message: data["message"],
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
}
