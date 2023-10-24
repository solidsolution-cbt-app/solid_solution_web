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
      "subject": getSubject(topic.subject!)
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

Map<String, String> someKnownSubjects = {
  "Christian Religious knowledge": "crk",
  "Islamic Religious knowledge": "irs",
  "Government": "goverment",
};

String getSubject(String subject) {
  if (someKnownSubjects.containsKey(subject)) {
    return someKnownSubjects[subject]!;
  } else {
    return subject.toLowerCase();
  }
}
