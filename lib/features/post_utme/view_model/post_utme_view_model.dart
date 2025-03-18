import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:solidsolutionweb/components/dialogs/dialog_service.dart';
import 'package:solidsolutionweb/core/base_model.dart';
import 'package:solidsolutionweb/core/route_service/route.gr.dart';
import 'package:solidsolutionweb/models/question_model.dart';
import 'package:solidsolutionweb/network_service/api_service.dart';

class PostUtmeViewModel extends BaseModel {
  List<String> schools = [];
  String selectedSubject = "";
  String selectedschool = "";

  setSelectedSubject(String subject) {
    selectedSubject = subject;
    notifyListeners();
  }

//loaders
  bool loadGetUniversities = false;
  bool loadGetSubjects = false;
  bool loadUploadQuestion = false;
  bool loadGetSchoolSubjectQuestion = false;
  bool loadGetQuestionById = false;

  toggleLoadGetUniversities(bool value) {
    loadGetUniversities = value;
    notifyListeners();
  }

  toggleLoadGetSubjects(bool value) {
    loadGetSubjects = value;
    notifyListeners();
  }

  toggleloadUploadQuestion(bool value) {
    loadUploadQuestion = value;
    notifyListeners();
  }

  toggleloadGetSchoolSubjectQuestion(bool value) {
    loadGetSchoolSubjectQuestion = value;
    notifyListeners();
  }

  toggleloadGetQuestionById(bool value) {
    loadGetQuestionById = value;
    notifyListeners();
  }
///////

  /// Ui return datas and calls
  Map<String, List<String>> subjects = {};
  Map<String, Map<String, List<QuestionModel>>> schoolSubjectQuestions = {};
  QuestionModel? questionToView;

  List<String> getSubjects(String school) {
    if (subjects.containsKey(school)) {
      return subjects[school]!;
    } else {
      return [];
    }
  }

  List<QuestionModel> getSchoolSubjectQuestions(String school, String subject) {
    if (schoolSubjectQuestions.containsKey(school)) {
      Map<String, List<QuestionModel>> subjectquestions =
          schoolSubjectQuestions[school]!;
      if (subjectquestions.containsKey(subject)) {
        return subjectquestions[subject]!;
      }

      return [];
    } else {
      return [];
    }
  }

  void setQuestionToView(QuestionModel question) {
    questionToView = question;
    notifyListeners();
  }

  /// Api Calls

  Future<void> getUniversities() async {
    toggleLoadGetUniversities(true);
    try {
      var data = await apiService.getUniversity();
      if (data.isSuccessful) {
        List<dynamic> schoolData = data.model as List<dynamic>;
        schools = schoolData.map((e) => e.toString()).toList();
      } else {}
    } catch (e) {
      //
    }
    toggleLoadGetUniversities(false);
  }

  Future<void> getSchoolSubjects({required String school}) async {
    selectedschool = school;
    toggleLoadGetSubjects(true);
    try {
      var data = await apiService.getSchoolSubjects(school: school);
      if (data.isSuccessful) {
        List<dynamic> schoolData = data.model["subjects"] as List<dynamic>;
        subjects[school] = schoolData.map((e) => e.toString()).toList();
        selectedSubject = schoolData.first.toString();
        getPostUtmeSchoolSubjectQuestion(
          school: school,
          subject: selectedSubject,
        );
      } else {}
    } catch (e) {
      //
    }
    toggleLoadGetSubjects(false);
  }

  Future<void> getPostUtmeSchoolSubjectQuestion(
      {required String school, required String subject}) async {
    try {
      toggleloadGetSchoolSubjectQuestion(true);
      var data = await apiService.getPostUtmeSchoolSubjectQuestions(
        subject: subject,
        school: school,
      );
      if (data.isSuccessful) {
        List<QuestionModel> newQuestions = data.model as List<QuestionModel>;
        schoolSubjectQuestions[selectedschool] = {
          selectedSubject: newQuestions
        };
      } else {
        dialogService.showErrorDialog(
          errorMessage: data.message,
        );
      }
    } catch (e) {
      // dialogService.showErrorDialog(
      //   errorMessage: e.toString(),
      // );
      //
    }
    toggleloadGetSchoolSubjectQuestion(false);
  }

  Future<void> uploadQuestion({
    required BuildContext context,
    required QuestionModel value,
  }) async {
    toggleloadUploadQuestion(true);
    try {
      var data = await apiService.uploadPostUtmeQuestionBySubject(
        dataSent: value.dataSent!,
      );
      if (data.isSuccessful) {
        // removeQuestion(subject: getSubject(subject));
        await getPostUtmeSchoolSubjectQuestion(
          school: value.school!,
          subject: value.subject!,
        );

        if (context.mounted) {
          dialogService.shouldAddNewQuestion(context,
              successMessage: data.message, onrejectAddNewQuestion: () {
            context.pushRoute(
              const PostUtmeQuestionsRoute(),
            );
          });
        }
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
    toggleloadUploadQuestion(false);
  }

  Future<void> deleteQuestion({
    required QuestionModel value,
  }) async {
    try {
      var data = await apiService.deletePostUtmeQuestion(
        questionId: value.id ?? "",
      );
      if (data.isSuccessful) {
        // removeQuestion(subject: getSubject(subject));
        await getPostUtmeSchoolSubjectQuestion(
          school: selectedschool,
          subject: selectedSubject,
        );
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
    }
  }

  Future<QuestionModel?> getQuestionById({
    required QuestionModel value,
  }) async {
    toggleloadGetQuestionById(true);
    try {
      var data = await apiService.getPostUtmeQuestionById(
        questionId: value.id ?? "",
      );
      if (data.isSuccessful) {
        QuestionModel question = data.model as QuestionModel;
        toggleloadGetQuestionById(false);
        return question;
      } else {
        toggleloadGetQuestionById(false);
        return null;
      }
    } catch (e) {
      toggleloadGetQuestionById(false);
      return null;
    }
  }

  Future<void> updateQuestion({
    required String questionId,
    required QuestionModel value,
  }) async {
    toggleloadUploadQuestion(true);
    try {
      var data = await apiService.updatePostUtmeQuestionBySubject(
        dataSent: value.dataSent!,
        questionId: questionId,
      );
      if (data.isSuccessful) {
        // removeQuestion(subject: getSubject(subject));
        await getPostUtmeSchoolSubjectQuestion(
          school: value.school!,
          subject: value.subject!,
        );
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
    }
    toggleloadUploadQuestion(false);
  }
}
