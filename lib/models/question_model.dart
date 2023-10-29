import 'dart:convert';

import 'package:solidsolutionweb/models/exception_model_calss/local_errors.dart.dart';

class QuestionModel {
  String? text;
  String? image;
  String? year;
  String? id;
  String? createdAt;
  String? updatedAt;
  String? topicId;
  String? solutionpdf;
  OptionModel? option1;
  OptionModel? option2;
  OptionModel? option3;
  OptionModel? option4;
  String? dataSent;

  QuestionModel.tojson({
    required this.text,
    this.image = "",
    this.year = "",
    this.solutionpdf = "",
    required this.option1,
    required this.option2,
    required this.option3,
    required this.option4,
  }) {
    Map<String, dynamic> questiondata = {};
    if (year != "") {
      questiondata = {
        "text": text,
        "image": image,
        "solution": solutionpdf,
        "options": [
          option1!.optionjson,
          option2!.optionjson,
          option3!.optionjson,
          option4!.optionjson
        ]
      };
    } else {
      questiondata = {
        "text": text,
        "image": image,
        "year": year,
        "solution": solutionpdf,
        "options": [
          option1!.optionjson,
          option2!.optionjson,
          option3!.optionjson,
          option4!.optionjson
        ]
      };
    }
    dataSent = jsonEncode(questiondata);
  }
  QuestionModel.fromjson({required Map<String, dynamic> data}) {
    if (data.containsKey("options")) {
      List<dynamic> options = data["options"];
      option1 = OptionModel.fromjson(data: options[0]);
      option2 = OptionModel.fromjson(data: options[1]);
      option3 = OptionModel.fromjson(data: options[2]);
      option4 = OptionModel.fromjson(data: options[3]);
    }

    text = data["text"];
    id = data["id"];
    createdAt = data["createdAt"] ?? "";
    updatedAt = data["updatedAt"] ?? "";
    image = data["image"];
    solutionpdf = data["solution"] ?? "";
    topicId = data["topicId"] ?? "";
    year = data["year"] ?? "";
  }
  @override
  String toString() {
    Map<String, dynamic> data = {
      "text": text,
      "image": image,
      "year": year,
      "solutionpdf": solutionpdf,
      "id": id,
      "createdAt": createdAt,
      "updatedAt": updatedAt,
      "topicId": topicId,
      "option1": option1,
      "option2": option2,
      "option3": option3,
      "option4": option4,
    };
    return data.toString();
  }
}

extension QuestionValidator on QuestionModel {}

validateQuestion({required QuestionModel question}) {
  if (question.text!.isEmpty ||
      question.option1!.text!.isEmpty ||
      question.option2!.text!.isEmpty ||
      question.option3!.text!.isEmpty ||
      question.option4!.text!.isEmpty) {
    return LocalExceptionModel(
      isSuccessful: false,
      message:
          "Ensure all questions and options fields are filled before you proceed",
    );
  } else if (question.solutionpdf!.isEmpty) {
    return LocalExceptionModel(
      isSuccessful: false,
      message: "Kindly upload a solution pdf before you proceed",
    );
  } else {
    return LocalExceptionModel(
      isSuccessful: true,
      message: "Success",
    );
  }
}

class OptionModel {
  String? text;
  String? image;
  String? id;
  String? questionId;
  String? createdAt;
  String? updatedAt;
  bool isCorrect = false;
  Map<String, dynamic>? optionjson;

  OptionModel.tojson(
      {required this.text, this.image = "", this.isCorrect = false}) {
    optionjson = {"text": text, "image": image, "isCorrect": isCorrect};
  }

  OptionModel.fromjson({required Map<String, dynamic> data}) {
    id = data["id"];
    createdAt = data["createdAt"];
    updatedAt = data["updatedAt"];
    text = data["text"];
    image = data["image"];
    isCorrect = data["isCorrect"];
    questionId = data["questionId"];
  }

  @override
  String toString() {
    Map<String, dynamic> data = {
      "text": text,
      "image": image,
      "isCorrect": isCorrect,
      "id": id,
      "questionId": questionId,
      "createdAt": createdAt,
      "updatedAt": updatedAt,
    };
    return data.toString();
  }
}
