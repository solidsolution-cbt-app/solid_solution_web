class QuestionModel {
  int? questionId;
  String? question;
  bool? isQuestionImage;
  String? option1;
  bool? isoption1Image;
  String? option2;
  bool? isoption2Image;
  String? option3;
  bool? isoption3Image;
  String? option4;
  bool? isoption4Image;
  QuestionModel({
    required this.questionId,
    required this.question,
    required this.isQuestionImage,
    required this.isoption1Image,
    required this.isoption2Image,
    required this.isoption3Image,
    required this.isoption4Image,
    required this.option1,
    required this.option2,
    required this.option3,
    required this.option4,
  });

  @override
  String toString() {
    Map<String, dynamic> data = {
      "question": question,
      "isQuestionImage": isQuestionImage,
      "option1": option1,
      "isoption1Image": isoption1Image,
      "option2": option2,
      "isoption2Image": isoption2Image,
      "option3": option3,
      "isoption3Image": isoption3Image,
      "option4": option4,
      "isoption4Image": isoption4Image,
      "questionId": questionId,
    };
    return data.toString();
  }
}
