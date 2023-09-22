import 'package:flutter/material.dart';
import 'package:solidsolutionweb/core/base_model.dart';
import 'package:solidsolutionweb/models/question_model.dart';

//The symbol of the first element is H and it is Hydrogen
//What is chemisty and what is the symbol of the first element
class SubjectQuizViewModel extends BaseModel {
  // controllers
  TextEditingController questionController =
      TextEditingController(text: "Question");
  TextEditingController option1Controller =
      TextEditingController(text: "Option");
  TextEditingController option2Controller =
      TextEditingController(text: "Option");
  TextEditingController option3Controller =
      TextEditingController(text: "Option");
  TextEditingController option4Controller = TextEditingController(
    text: "Option",
  );

  Map<String, List<QuestionModel>> subjectQuestions = {};

  List<QuestionModel> getQuestions({required String subject}) {
    if (subjectQuestions.containsKey(subject)) {
      return subjectQuestions[subject]!;
    } else {
      return [];
    }
  }

  late QuestionModel previewQuestion;

  addQuestion({required String subject, required QuestionModel question}) {
    if (subjectQuestions.containsKey(subject)) {
      subjectQuestions[subject]!.add(question);
    } else {
      subjectQuestions[subject] = [question];
    }
    notifyListeners();
  }

  setPreviewQuestion({required QuestionModel question}) {
    previewQuestion = question;
    notifyListeners();
  }

  updateQuestion({required String subject, required QuestionModel question}) {
    List<QuestionModel> questions = subjectQuestions[subject]!;
    for (int i = 0; i < questions.length; i++) {
      if (questions[i].toString() == question.toString()) {
        questions[i] = question;
        return;
      }
    }
    subjectQuestions[subject] = questions;
    previewQuestion = question;
    notifyListeners();
  }
}
