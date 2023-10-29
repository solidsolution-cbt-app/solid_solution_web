import 'package:solidsolutionweb/components/dialogs/dialog_service.dart';
import 'package:solidsolutionweb/core/base_model.dart';
import 'package:solidsolutionweb/features/topic_quiz/view_model/topic_view_model.dart';
import 'package:solidsolutionweb/models/question_model.dart';
import 'package:solidsolutionweb/models/topic_quiz_model.dart';
import 'package:solidsolutionweb/network_service/api_service.dart';

class SubjectQuizViewModel extends BaseModel {
  String selectedYear = "all";
  onChangeYear(String year) {
    selectedYear = year;
  }

  //screen loaders

  bool loadAddSubjectQuestion = false;
  toggleLoadAddSubjectQuestion(bool value) {
    loadAddSubjectQuestion = value;
    notifyListeners();
  }

  bool loadSubjectQuestion = true;
  toggleLoadSubjectQuestion(bool value) {
    loadSubjectQuestion = value;
    notifyListeners();
  }

  bool loadEditQuestion = false;
  toggleLoadEditQuestion(bool value) {
    loadEditQuestion = value;
    notifyListeners();
  }

  Map<String, List<QuestionModel>> subjectQuestions = {};
  Map<String, QuestionModel> subjectQuestionsData = {};
  QuestionModel? previewQuestionData;
  removeQuestionData({required String questionId}) {
    if (subjectQuestionsData.containsKey(questionId)) {
      subjectQuestionsData.removeWhere(
        (key, value) => key == questionId,
      );
    }
  }

  resetQuestionData() {
    subjectQuestions = {};
    subjectQuestionsData = {};
    previewQuestionData = null;
  }

  resetPreview() {
    previewQuestionData = null;
    notifyListeners();
  }

  shouldgetQuestions({required String subject, required String selectedYear}) {
    toggleLoadSubjectQuestion(true);
    if (subjectQuestions.containsKey(getSubject(subject))) {
      getSubjectQuestions(subject: getSubject(subject));
    } else {
      if (selectedYear == "all") {
        getSubjectQuestion(
          subject: subject,
          pageNumber: "1",
        );
      } else {
        getSubjectQuestionFilter(
          subject: subject,
          pageNumber: "1",
          year: selectedYear,
        );
      }
    }
  }

  removeQuestion({required String subject}) {
    if (subjectQuestions.containsKey(subject)) {
      subjectQuestions.removeWhere((key, value) => key == subject);
    }
  }

  List<QuestionModel> questionToshow = [];
  getSubjectQuestions({
    required String subject,
  }) {
    if (subjectQuestions.containsKey(subject)) {
      questionToshow = subjectQuestions[subject]!;
    }
    toggleLoadSubjectQuestion(false);
  }

  updateQuestion(String subject, List<QuestionModel> newQuestions) {
    if (subjectQuestions.containsKey(subject)) {
      for (var item in newQuestions) {
        subjectQuestions[subject]!.add(item);
      }
    } else {
      subjectQuestions[subject] = newQuestions;
    }
    getSubjectQuestions(subject: subject);
  }

  Future<void> uploadSubjectQuestion(
      {required String jsonData,
      required String subject,
      required String year}) async {
    toggleLoadAddSubjectQuestion(true);
    try {
      var data = await apiService.addSubjectQuestion(
        dataSent: jsonData,
        subject: getSubject(subject),
        year: year,
      );
      if (data.isSuccessful) {
        removeQuestion(subject: getSubject(subject));
        await getSubjectQuestion(subject: getSubject(subject), pageNumber: "1");
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
    toggleLoadAddSubjectQuestion(false);
  }

  Future<void> getSubjectQuestion({
    required String subject,
    required String pageNumber,
  }) async {
    try {
      var data = await apiService.getSubjectQuestions(
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
    toggleLoadSubjectQuestion(false);
  }

  Future<void> getSubjectQuestionFilter({
    required String subject,
    required String pageNumber,
    required String year,
  }) async {
    try {
      var data = await apiService.getSubjectQuestionsFilter(
        subject: getSubject(subject),
        pageNo: pageNumber,
        year: year,
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
    toggleLoadSubjectQuestion(false);
  }

  Future<void> fetchMoreSubjectQuestions({
    required String subject,
  }) async {
    List<QuestionModel> questions = subjectQuestions[getSubject(subject)]!;
    String pageNumber =
        getPageNumber(currentLength: questions.length).toString();
    if (pageNumber != "0") {
      toggleLoadSubjectQuestion(true);
      try {
        var data = await apiService.getSubjectQuestions(
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
      toggleLoadSubjectQuestion(false);
    }
  }

  Future<void> fetchMoreSubjectQuestionsFilter({
    required String subject,
    required String year,
  }) async {
    List<QuestionModel> questions = subjectQuestions[getSubject(subject)]!;
    String pageNumber =
        getPageNumber(currentLength: questions.length).toString();
    if (pageNumber != "0") {
      toggleLoadSubjectQuestion(true);
      try {
        var data = await apiService.getSubjectQuestionsFilter(
            subject: getSubject(subject), pageNo: pageNumber, year: year);
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
      toggleLoadSubjectQuestion(false);
    }
  }

  Future<void> getSubjectQuestionData({
    required String questionId,
  }) async {
    try {
      var data =
          await apiService.getSubjectQuestionData(questionId: questionId);
      if (data.isSuccessful) {
        QuestionModel newQuestions = data.model as QuestionModel;
        previewQuestionData = newQuestions;
        subjectQuestionsData[questionId] = newQuestions;
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

  Future<void> editSubjectQuestion({
    required String jsonData,
    required String questionId,
    required String subject,
  }) async {
    toggleLoadEditQuestion(true);
    try {
      var data = await apiService.editSubjectQuestion(
        dataSent: jsonData,
        questionId: questionId,
      );
      if (data.isSuccessful) {
        removeQuestion(subject: getSubject(subject));
        await getSubjectQuestion(subject: getSubject(subject), pageNumber: "1");
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
