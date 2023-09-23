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

  initializeControllerValue({required QuestionModel questionModel}) {
    questionController = TextEditingController(text: questionModel.question);
    option1Controller = TextEditingController(text: questionModel.option1);
    option2Controller = TextEditingController(text: questionModel.option2);
    option3Controller = TextEditingController(text: questionModel.option3);
    option4Controller = TextEditingController(text: questionModel.option4);
    editId = questionModel.questionId!;
  }

  clearControllers() {
    questionController.clear();
    option1Controller.clear();
    option2Controller.clear();
    option3Controller.clear();
    option4Controller.clear();
  }

  Map<String, List<QuestionModel>> subjectQuestions = {};

  List<QuestionModel> getQuestions({required String subject}) {
    if (subjectQuestions.containsKey(subject)) {
      return subjectQuestions[subject]!;
    } else {
      return [];
    }
  }

  late QuestionModel previewQuestion;

  int questionId = 0;
  int editId = -1;

  addQuestion({required String subject, required QuestionModel question}) {
    if (subjectQuestions.containsKey(subject)) {
      subjectQuestions[subject]!.add(question);
    } else {
      subjectQuestions[subject] = [question];
    }
    questionId++;
    notifyListeners();
  }

  setPreviewQuestion({required QuestionModel question}) {
    previewQuestion = question;
    notifyListeners();
  }

  updateQuestion({required String subject, required QuestionModel question}) {
    List<QuestionModel> questions = subjectQuestions[subject]!;
    for (int i = 0; i < questions.length; i++) {
      if (questions[i].questionId == question.questionId) {
        questions[i] = question;
        break;
      } else {
      }
    }
    subjectQuestions[subject] = questions;
    previewQuestion = question;
    notifyListeners();
  }
}
