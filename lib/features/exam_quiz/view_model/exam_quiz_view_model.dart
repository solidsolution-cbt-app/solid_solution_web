import 'package:solidsolutionweb/components/dialogs/dialog_service.dart';
import 'package:solidsolutionweb/core/base_model.dart';
import 'package:solidsolutionweb/features/topic_quiz/view_model/topic_view_model.dart';
import 'package:solidsolutionweb/models/question_model.dart';
import 'package:solidsolutionweb/models/topic_quiz_model.dart';
import 'package:solidsolutionweb/network_service/api_service.dart';

class ExamQuizViewModel extends BaseModel {
  //screen loaders

  bool loadAddExamQuestion = false;
  toggleLoadAddExamQuestion(bool value) {
    loadAddExamQuestion = value;
    notifyListeners();
  }

  bool loadExamQuestion = true;
  toggleLoadExamQuestion(bool value) {
    loadExamQuestion = value;
    notifyListeners();
  }

  bool loadEditQuestion = false;
  toggleLoadEditQuestion(bool value) {
    loadEditQuestion = value;
    notifyListeners();
  }

  Map<String, List<QuestionModel>> examQuestions = {};
  Map<String, QuestionModel> examQuestionsData = {};
  QuestionModel? previewQuestionData;
  removeQuestionData({required String questionId}) {
    if (examQuestionsData.containsKey(questionId)) {
      examQuestionsData.removeWhere(
        (key, value) => key == questionId,
      );
    }
  }

  resetPreview() {
    previewQuestionData = null;
    notifyListeners();
  }

  shouldgetQuestions({required String subject}) {
    toggleLoadExamQuestion(true);
    if (examQuestions.containsKey(getSubject(subject))) {
      getExamQuestions(subject: getSubject(subject));
    } else {
      getExamQuestion(
        subject: subject,
        pageNumber: "1",
      );
    }
  }

  removeQuestion({required String subject}) {
    if (examQuestions.containsKey(subject)) {
      examQuestions.removeWhere((key, value) => key == subject);
    }
  }

  List<QuestionModel> questionToshow = [];
  getExamQuestions({
    required String subject,
  }) {
    if (examQuestions.containsKey(subject)) {
      questionToshow = examQuestions[subject]!;
    }
    toggleLoadExamQuestion(false);
  }

  updateQuestion(String subject, List<QuestionModel> newQuestions) {
    if (examQuestions.containsKey(subject)) {
      for (var item in newQuestions) {
        examQuestions[subject]!.add(item);
      }
    } else {
      examQuestions[subject] = newQuestions;
    }
    getExamQuestions(subject: subject);
  }

  Future<void> uploadExamQuestion(
      {required String jsonData, required String subject}) async {
    toggleLoadAddExamQuestion(true);
    try {
      var data = await apiService.addExamQuestion(
        dataSent: jsonData,
        subject: getSubject(subject),
      );
      if (data.isSuccessful) {
        removeQuestion(subject: getSubject(subject));
        await getExamQuestion(subject: getSubject(subject), pageNumber: "1");
        dialogService.shouldAddNewQuestion(
          successMessage: data.message,
        );
      } else {
        dialogService.showErrorDialog(
          errorMessage: data.message,
        );
      }
    } catch (e) {
      dialogService.showErrorDialog(
        errorMessage: e.toString(),
      );
    }
    toggleLoadAddExamQuestion(false);
  }

  Future<void> deleteExamQuestion({
    required QuestionModel questionModel,
    required String subject,
  }) async {
    dialogService.hideLoaderDialog();
    toggleLoadExamQuestion(true);
    try {
      var data =
          await apiService.deleteExamQuestion(questionId: questionModel.id!);
      if (data.isSuccessful) {
        removeQuestion(subject: getSubject(subject));
        await getExamQuestion(subject: getSubject(subject), pageNumber: "1");
        dialogService.showSuccessDialog(
          successMessage: data.message,
        );
      } else {
        dialogService.showErrorDialog(
          errorMessage: data.message,
        );
      }
    } catch (e) {
      dialogService.showErrorDialog(
        errorMessage: e.toString(),
      );
      //
    }
    toggleLoadExamQuestion(false);
  }

  Future<void> getExamQuestion({
    required String subject,
    required String pageNumber,
  }) async {
    try {
      var data = await apiService.getExamQuestions(
        subject: getSubject(subject),
        pageNo: pageNumber,
      );

      if (data.isSuccessful) {
        List<QuestionModel> newQuestions = data.model as List<QuestionModel>;
        updateQuestion(getSubject(subject), newQuestions);
      } else {
        dialogService.showErrorDialog(
          errorMessage: data.message,
        );
      }
    } catch (e) {
      dialogService.showErrorDialog(
        errorMessage: e.toString(),
      );
    }
    toggleLoadExamQuestion(false);
  }

  Future<void> fetchMoreExamQuestions({
    required String subject,
  }) async {
    List<QuestionModel> questions = examQuestions[getSubject(subject)]!;
    String pageNumber =
        getPageNumber(currentLength: questions.length).toString();
    if (pageNumber != "0") {
      toggleLoadExamQuestion(true);
      try {
        var data = await apiService.getExamQuestions(
          subject: getSubject(subject),
          pageNo: pageNumber,
        );
        if (data.isSuccessful) {
          List<QuestionModel> newQuestion = data.model as List<QuestionModel>;
          updateQuestion(getSubject(subject), newQuestion);
        } else {
          dialogService.showErrorDialog(
            errorMessage: data.message,
          );
        }
      } catch (e) {
        dialogService.showErrorDialog(
          errorMessage: e.toString(),
        );

        //
      }
      toggleLoadExamQuestion(false);
    }
  }

  Future<void> getExamQuestionData({
    required String questionId,
  }) async {
    try {
      var data = await apiService.getExamQuestionData(questionId: questionId);
      if (data.isSuccessful) {
        QuestionModel newQuestions = data.model as QuestionModel;
        previewQuestionData = newQuestions;
        examQuestionsData[questionId] = newQuestions;
      } else {
        previewQuestionData = null;
        dialogService.showErrorDialog(
          errorMessage: data.message,
        );
      }
    } catch (e) {
      previewQuestionData = null;
      dialogService.showErrorDialog(
        errorMessage: e.toString(),
      );
    }
  }

  Future<void> editExamQuestion({
    required String jsonData,
    required String questionId,
    required String subject,
  }) async {
    toggleLoadEditQuestion(true);
    try {
      var data = await apiService.editExamQuestion(
        dataSent: jsonData,
        questionId: questionId,
      );
      if (data.isSuccessful) {
        removeQuestion(subject: getSubject(subject));
        await getExamQuestion(subject: getSubject(subject), pageNumber: "1");
        removeQuestionData(questionId: questionId);
        resetPreview();
        dialogService.hideLoaderDialog();
      } else {
        dialogService.showErrorDialog(
          errorMessage: data.message,
        );
      }
    } catch (e) {
      dialogService.showErrorDialog(
        errorMessage: e.toString(),
      );
    }
    toggleLoadEditQuestion(false);
  }
}
