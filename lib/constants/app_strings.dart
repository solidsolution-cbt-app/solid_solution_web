class AppString {
  static const String companyName = "solidsolutions";
  static const String companyTagLine = "Company's Tag line";
  static const String editBlogPost = "Edit Blog Post";
  static const String deleteBlogPost = "Delete Blog Post";
  static const String delete = "Delete";
  static const String viewQuestion = "View Question";
  static const String editQuestion = "Edit Question";

  static getExpression(String value) {
    String latexExpression = r'$$' + value + r'$$';
    return latexExpression;
  }
}
