import 'package:solidsolutionweb/core/base_model.dart';
import 'package:solidsolutionweb/models/question_model.dart';

//The symbol of the first element is H and it is Hydrogen
//What is chemisty and what is the symbol of the first element
class ExamQuizViewModel extends BaseModel {
  // controllers
  

 


  Map<String, List<QuestionModel>> examQuestions = {};

  List<QuestionModel> getQuestions({required String subject}) {
    if (examQuestions.containsKey(subject)) {
      return examQuestions[subject]!;
    } else {
      return [];
    }
  }

  late QuestionModel previewQuestion;

  int questionId = 0;
  int editId = -1;

  addQuestion({required String subject, required QuestionModel question}) {
    if (examQuestions.containsKey(subject)) {
      examQuestions[subject]!.add(question);
    } else {
      examQuestions[subject] = [question];
    }
    questionId++;
    notifyListeners();
  }

  setPreviewQuestion({required QuestionModel question}) {
    previewQuestion = question;
    notifyListeners();
  }

  // updateQuestion({required String subject, required QuestionModel question}) {
  //   List<QuestionModel> questions = examQuestions[subject]!;
  //   for (int i = 0; i < questions.length; i++) {
  //     if (questions[i].questionId == question.questionId) {
  //       questions[i] = question;
  //       break;
  //     } else {}
  //   }
  //   examQuestions[subject] = questions;
  //   previewQuestion = question;
  //   notifyListeners();
  // }
}
