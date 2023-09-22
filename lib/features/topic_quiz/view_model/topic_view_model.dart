import 'package:flutter/material.dart';
import 'package:solidsolutionweb/core/base_model.dart';
import 'package:solidsolutionweb/models/topic_quiz_model.dart';

class TopicQuizVeiwModel extends BaseModel {
  // controllers

  TextEditingController topicController = TextEditingController();
  List<TopicQuizModel> topics = [
    TopicQuizModel(
      subject: "English",
      topics: [
        TopicModel(topic: "Lexis and structure"),
      ],
    )
  ];

  addTopic({required String subject, required String topic}) {
    TopicQuizModel newtopic = topics.firstWhere(
      (element) => element.subject == subject,
      orElse: () => TopicQuizModel(subject: subject, topics: []),
    );
    newtopic.topics.add(TopicModel(topic: topic));
    topics.removeWhere((element) => element.subject == subject);
    topics.add(newtopic);
    notifyListeners();
  }

  List<TopicModel> getTopics({required String subject}) {
    TopicQuizModel newTopicQuiz = topics.firstWhere(
      (element) => element.subject == subject,
      orElse: () => TopicQuizModel(subject: subject, topics: []),
    );
    // print(newTopicQuiz.topics);
    return newTopicQuiz.topics;
  }
}
