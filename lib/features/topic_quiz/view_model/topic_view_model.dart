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
      topicData[newTopic.subject]!.add(newTopic);
    } else {
      topicData[newTopic.subject!] = [newTopic];
    }
    notifyListeners();
  }

  updateTopic(String subject, List<TopicModel> newTopics) {
    if (topicData.containsKey(subject)) {
      for (var item in newTopics) {
        topicData[subject]!.add(item);
      }
    } else {
      topicData[subject] = newTopics;
    }
  }

  List<TopicModel> getTopics({
    required String subject,
  }) {
    if (topicData.containsKey(subject.toLowerCase())) {
      return topicData[subject.toLowerCase()]!;
    } else {
      getTopic(subject: subject, pageNumber: "1");
      return [];
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
        subject: subject,
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
    // toggleLoadTopicScreen(true);

    try {
      var data = await apiService.getTopicQuiz(
        subject: subject.toLowerCase(),
        pageNumber: pageNumber,
      );
      if (data.isSuccessful) {
        List<TopicModel> newTopic = data.model as List<TopicModel>;
        updateTopic(subject.toLowerCase(), newTopic);
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
    // toggleLoadTopicScreen(false);
  }
}
