class AppString {
  static const String companyName = "solidsolutions";
  static const String companyTagLine = "Company's Tag line";
  static const String editBlogPost = "Edit Blog Post";
  static const String deleteBlogPost = "Delete Blog Post";

  static getExpression(String value) {
    String latexExpression = r'$$' + value + r'$$';
    return latexExpression;
  }
}
