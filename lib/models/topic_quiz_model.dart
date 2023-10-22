class TopicModel {
  String? topic;
  String? id;
  String? subject;
  Map<String, String>? dataSent;
  TopicModel({
    required this.topic,
    required this.id,
    required this.subject,
  });

  TopicModel.tojson({required TopicModel topic}) {
    dataSent = {
      "topic": topic.topic!.toLowerCase(),
      "subject": topic.subject!.toLowerCase(),
    };
  }

  TopicModel.fromjson({required Map<String, dynamic> data}) {
    id = data["id"];
    topic = data["topic"];
    subject = data["subject"];
  }
  @override
  String toString() {
    Map<String, dynamic> data = {
      "topic": topic,
      "id": id,
      "subject": subject,
    };
    return data.toString();
  }
}
