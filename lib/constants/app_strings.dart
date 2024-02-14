class AppString {
  static const String companyName = "solidsolutions";
  static const String companyTagLine = "Company's Tag line";

  static getExpression(String value) {
    String latexExpression = r'$$' + value + r'$$';
    return latexExpression;
  }
}
