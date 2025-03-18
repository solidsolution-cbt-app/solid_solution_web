class EndPoints {
  static const String baseUrl = "https://cbt-api.onrender.com";
  static const String login = "/admin/login";
  static const String addTopic = "/admin/add-topic";
  static const String getTopic = "/admin/fetch-topics?subject";
  static const String addTopicQuestion = "/admin/add-topic-question?topicId=";
  static const String deleteTopic = "/admin/delete-topic?topicId=";
  static const String deleteTopicQuestion =
      "/admin/delete-topic-question?questionId=";
  static const String fetchTopicQuestion =
      "/admin/fetch-topic-questions?topicId=";
  static const String fetchTopicQuestionData =
      "/admin/fetch-topic-question?questionId=";
  static const String editTopicQuestionData =
      "/admin/edit-topic-question?questionId=";
  static const String addExam = "/admin/add-exam-question?subject=";
  static const String fetchExamQuestion =
      "/admin/fetch-exam-questions?subject=";
  static const String fetchExamQuestionData =
      "/admin/fetch-exam-question?questionId=";
  static const String editExamQuestionData =
      "/admin/edit-exam-question?questionId=";
  static const String addSubject = "/admin/add-subject-question?subject=";
  static const String fetchSubjectQuestion =
      "/admin/fetch-subject-questions?subject=";
  static const String fetchSubjectQuestionData =
      "/admin/fetch-subject-question?questionId=";

  static const String deleteSubjectQuestion =
      "/admin/delete-subject-question?questionId=";
  static const String editSubjectQuestionData =
      "/admin/edit-subject-question?questionId=";
  static const String deleteExamQuestion =
      "/admin/delete-exam-question?questionId=";

  //
  static const String postBlog = "/blog";
  static const String getBlogs = "/blogs";

  //post utme
  static const String getUniversity = "/admin/post-utme/schools";
  static String getSubjects(String school) =>
      "/admin/post-utme/subjects/$school";
  static const String uploadPostUtmeQuestion = "/admin/post-utme/question";
  static String deletePostUtmeQuestion(String questionId) =>
      "/admin/post-utme/question/$questionId";
  static String getPostUtmeQuestionById(String questionId) =>
      "/admin/post-utme/question/$questionId";
  static String getPostUtmeSchoolSubjectQuestions({
    required String school,
    required String subject,
  }) =>
      "/admin/post-utme/questions?subject=$subject&school=$school";

  static String updatePostUtmeQuestion({required String id}) =>
      "/admin/post-utme/question/$id";
}

class ClodinaryConstants {
  static const String apiKey = "847118627532426";
  static const String apiSecret = "ncbpIP9aMDzhgEDmTek9A2Da70A";
  static const String cloudName = "dn4d52sd1";
  static const String cloudUrl =
      "cloudinary://847118627532426:ncbpIP9aMDzhgEDmTek9A2Da70A@dn4d52sd1";
}
