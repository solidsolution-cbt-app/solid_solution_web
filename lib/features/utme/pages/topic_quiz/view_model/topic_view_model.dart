import 'package:flutter/material.dart';
import 'package:solidsolutionweb/components/dialogs/dialog_service.dart';
import 'package:solidsolutionweb/core/base_model.dart';
import 'package:solidsolutionweb/models/question_model.dart';
import 'package:solidsolutionweb/models/topic_quiz_model.dart';
import 'package:solidsolutionweb/network_service/api_service.dart';

class TopicQuizVeiwModel extends BaseModel {
  // controllers
  TextEditingController topicController = TextEditingController();
  Map<String, List<TopicModel>> topicData = {};
  Map<String, List<QuestionModel>> topicQuestions = {};
  Map<String, QuestionModel> topicQuestionData = {};

  // add topic dialog loader
  bool loadAddTopic = false;
  toggleLoadAddTopic(bool value) {
    loadAddTopic = value;
    notifyListeners();
  }

  // topic screen loader
  bool loadTopicScreen = false;
  toggleLoadTopicScreen(bool value) {
    loadTopicScreen = value;
    notifyListeners();
  }

  // topic question preview screen loader

  bool loadTopicQuestionScreen = true;
  toggleLoadTopicQuestionScreen(bool value) {
    loadTopicQuestionScreen = value;
    notifyListeners();
  }

  // add question screen loader

  bool loadAddQuestion = false;
  toggleLoadAddQuestion(bool value) {
    loadAddQuestion = value;
    notifyListeners();
  }

  // add question screen loader

  bool loadEditQuestion = false;
  toggleLoadEditQuestion(bool value) {
    loadEditQuestion = value;
    notifyListeners();
  }

  removeTopic({required TopicModel topic}) {
    if (topicData.containsKey(topic.subject)) {
      topicData.removeWhere((key, value) => key == topic.subject);
    }
  }

  addTopicLocal({required TopicModel newTopic}) {
    if (topicData.containsKey(newTopic.subject)) {
      topicData[newTopic.subject]!.insert(0, newTopic);
    } else {
      topicData[newTopic.subject!] = [newTopic];
    }
    getTopics(subject: newTopic.subject!);
  }

  updateTopic(String subject, List<TopicModel> newTopics) {
    if (topicData.containsKey(subject)) {
      for (var item in newTopics) {
        topicData[subject]!.add(item);
      }
    } else {
      topicData[subject] = newTopics;
    }
    getTopics(subject: getSubject(subject));
  }

  List<TopicModel> topicToshow = [];
  getTopics({
    required String subject,
  }) {
    if (topicData.containsKey(subject.toLowerCase())) {
      topicToshow = topicData[subject.toLowerCase()]!;
    }
    notifyListeners();
  }

  void shouldGetTopic({
    required String subject,
    required String pageNumber,
  }) {
    if (topicData.containsKey(getSubject(subject))) {
      getTopics(subject: getSubject(subject));
    } else {
      getTopic(subject: getSubject(subject), pageNumber: pageNumber);
    }
  }

  List<QuestionModel> questionToshow = [];
  getQuestions({
    required TopicModel topic,
  }) {
    if (topicQuestions.containsKey(topic.id)) {
      questionToshow = topicQuestions[topic.id]!;
    }
    notifyListeners();
  }

  updateQuestion(TopicModel topic, List<QuestionModel> newQuestions) {
    if (topicQuestions.containsKey(topic.id)) {
      for (var item in newQuestions) {
        topicQuestions[topic.id]!.add(item);
      }
    } else {
      topicQuestions[topic.id!] = newQuestions;
    }
    getQuestions(topic: topic);
  }

  void shouldGetTopicQuestions({
    required TopicModel topic,
    required String pageNumber,
  }) {
    if (topicQuestions.containsKey(topic.id)) {
      getQuestions(topic: topic);
    } else {
      getQuestion(topic: topic, pageNumber: pageNumber);
    }
  }

  removeQuestion({required TopicModel topic}) {
    if (topicQuestions.containsKey(topic.id)) {
      topicQuestions.removeWhere((key, value) => key == topic.id);
    }
  }

  QuestionModel? previewQuestionData;

  resetPreview() {
    previewQuestionData = null;
    notifyListeners();
  }

  getQuestionData({required String questionId}) async {
    if (topicQuestionData.containsKey(questionId)) {
      previewQuestionData = topicQuestionData[questionId];
    } else {
      await getTopicQuestionData(questionId: questionId);
    }
  }

  removeQuestionData({required String questionId}) {
    if (topicQuestionData.containsKey(questionId)) {
      topicQuestionData.removeWhere(
        (key, value) => key == questionId,
      );
    }
  }

  Future<void> addTopic({
    required String subject,
    required String topic,
  }) async {
    toggleLoadAddTopic(true);
    Map<String, String> dataSent = TopicModel.tojson(
      topic: TopicModel(
        topic: topic,
        id: "id",
        subject: getSubject(subject),
      ),
    ).dataSent!;
    try {
      var data = await apiService.addTopicQuiz(
        dataSent: dataSent,
      );
      if (data.isSuccessful) {
        TopicModel newTopic = data.model as TopicModel;
        removeTopic(topic: newTopic);
        getTopic(subject: getSubject(subject), pageNumber: "1");
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
      //
    }
    toggleLoadAddTopic(false);
  }

  Future<void> deleteTopic({
    required TopicModel topic,
    required String subject,
  }) async {
    dialogService.hideLoaderDialog();
    toggleLoadTopicScreen(true);
    try {
      var data = await apiService.deleteTopicQuiz(topicId: topic.id!);
      if (data.isSuccessful) {
        removeTopic(topic: topic);
        getTopic(subject: getSubject(subject), pageNumber: "1");
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
    toggleLoadTopicScreen(false);
  }

  Future<void> getTopic({
    required String subject,
    required String pageNumber,
  }) async {
    toggleLoadTopicScreen(true);
    try {
      var data = await apiService.getTopicQuiz(
        subject: getSubject(subject),
        pageNumber: pageNumber,
      );
      if (data.isSuccessful) {
        List<TopicModel> newTopic = data.model as List<TopicModel>;
        updateTopic(getSubject(subject), newTopic);
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
    toggleLoadTopicScreen(false);
  }

  Future<void> getQuestion({
    required TopicModel topic,
    required String pageNumber,
  }) async {
    try {
      var data = await apiService.getQuestions(
        topicId: topic.id!,
        pageNo: pageNumber,
      );

      if (data.isSuccessful) {
        List<QuestionModel> newQuestions = data.model as List<QuestionModel>;
        updateQuestion(topic, newQuestions);
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
    toggleLoadTopicQuestionScreen(false);
  }

  Future<void> fetchMoreQuestions({
    required TopicModel topic,
  }) async {
    List<QuestionModel> questions = topicQuestions[topic.id]!;
    String pageNumber =
        getPageNumber(currentLength: questions.length).toString();
    if (pageNumber != "0") {
      toggleLoadTopicQuestionScreen(true);
      try {
        var data = await apiService.getQuestions(
          topicId: topic.id!,
          pageNo: pageNumber,
        );
        if (data.isSuccessful) {
          List<QuestionModel> newQuestion = data.model as List<QuestionModel>;
          updateQuestion(topic, newQuestion);
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
      toggleLoadTopicQuestionScreen(false);
    }
  }

  Future<void> fetchMoreTopic({
    required String subject,
  }) async {
    List<TopicModel> topics = topicData[getSubject(subject)]!;
    String pageNumber = getPageNumber(currentLength: topics.length).toString();
    if (pageNumber != "0") {
      toggleLoadTopicScreen(true);
      try {
        var data = await apiService.getTopicQuiz(
          subject: getSubject(subject),
          pageNumber: pageNumber,
        );
        if (data.isSuccessful) {
          List<TopicModel> newTopic = data.model as List<TopicModel>;
          updateTopic(getSubject(subject), newTopic);
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
      toggleLoadTopicScreen(false);
    }
  }

  Future<void> uploadQuestion(
      {required String jsonData, required TopicModel topic}) async {
    toggleLoadAddQuestion(true);
    try {
      var data = await apiService.addTopicQuestion(
        dataSent: jsonData,
        topicId: topic.id!,
      );
      if (data.isSuccessful) {
        removeQuestion(topic: topic);
        await getQuestion(topic: topic, pageNumber: "1");
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
    toggleLoadAddQuestion(false);
  }

  Future<void> deleteTopicQuestion(
      {required QuestionModel questionModel,
      required String subject,
      required TopicModel topic}) async {
    dialogService.hideLoaderDialog();
    toggleLoadTopicQuestionScreen(true);
    try {
      var data =
          await apiService.deleteTopicQuestion(questionId: questionModel.id!);
      if (data.isSuccessful) {
        removeQuestion(topic: topic);
        await getQuestion(topic: topic, pageNumber: "1");
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
    toggleLoadTopicScreen(false);
  }

  Future<void> getTopicQuestionData({
    required String questionId,
  }) async {
    try {
      var data = await apiService.getQuestionData(questionId: questionId);
      if (data.isSuccessful) {
        QuestionModel newQuestions = data.model as QuestionModel;
        previewQuestionData = newQuestions;
        topicQuestionData[questionId] = newQuestions;
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

  Future<void> editQuestion({
    required String jsonData,
    required String questionId,
    required TopicModel topic,
  }) async {
    toggleLoadEditQuestion(true);
    try {
      var data = await apiService.editTopicQuestion(
        dataSent: jsonData,
        questionId: questionId,
      );
      if (data.isSuccessful) {
        removeQuestion(topic: topic);
        await getQuestion(topic: topic, pageNumber: "1");
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

int getPageNumber({required int currentLength}) {
  int wholeNumber = currentLength ~/ 20;
  int remainderNumber = currentLength % 20;
  if (wholeNumber == 0) {
    return 0;
  } else if (remainderNumber != 0) {
    return 0;
  } else {
    return wholeNumber + 1;
  }
}
