import 'package:flutter/material.dart';
import 'package:solidsolutionweb/components/dialogs/dialog_service.dart';
import 'package:solidsolutionweb/core/base_model.dart';
import 'package:solidsolutionweb/models/topic_quiz_model.dart';
import 'package:solidsolutionweb/network_service/api_service.dart';

class TopicQuizVeiwModel extends BaseModel {
  // controllers
  TextEditingController topicController = TextEditingController();
  Map<String, List<TopicModel>> topicData = {};

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
        dialogService.hideLoaderDialog();
        TopicModel newTopic = data.model as TopicModel;
        addTopicLocal(newTopic: newTopic);
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
        updateTopic(getSubject(subject), []);
      }
    } catch (e) {
      dialogService.showErrorDialog(
        errorMessage: e.toString(),
      );
      updateTopic(getSubject(subject), []);
      //
    }
    toggleLoadTopicScreen(false);
  }

  Future<void> fetchMoreTopic({
    required String subject,
  }) async {
    List<TopicModel> topics = topicData[getSubject(subject)]!;
    print(topics.length);
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
          updateTopic(getSubject(subject), []);
        }
      } catch (e) {
        dialogService.showErrorDialog(
          errorMessage: e.toString(),
        );
        updateTopic(getSubject(subject), []);
        //
      }
      toggleLoadTopicScreen(false);
    }
  }
}

int getPageNumber({required int currentLength}) {
  int wholeNumber = currentLength ~/ 20;
  int remainderNumber = currentLength % 20;
  print(remainderNumber);
  print(wholeNumber);
  if (wholeNumber == 0) {
    return 0;
  } else if (remainderNumber != 0) {
    return 0;
  } else {
    return wholeNumber + 1;
  }
}
