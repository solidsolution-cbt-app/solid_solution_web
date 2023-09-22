class TopicQuizModel {
  String subject;
  List<TopicModel> topics;
  TopicQuizModel({required this.subject, required this.topics});

  @override
  String toString() {
    Map<String, dynamic> data = {"subject": subject, "topics": topics};
    return data.toString();
  }
}

class TopicModel {
  String topic;
  TopicModel({required this.topic});
  @override
  String toString() {
    Map<String, dynamic> data = {
      "topic": topic,
    };
    return data.toString();
  }
}

