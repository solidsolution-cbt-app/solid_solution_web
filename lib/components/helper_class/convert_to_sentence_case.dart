String? convertToSentenceCase(String? input) {
  if (input == null) {
    return null;
  } else {
    if (input.isEmpty) {
      return input; // Return the input as is if it's empty
    }

    String firstChar =
        input.substring(0, 1).toUpperCase(); // Capitalize the first character
    String restOfString = input
        .substring(1)
        .toLowerCase(); // Convert the rest of the string to lowercase

    return firstChar + restOfString;
  }
}
String formatDate(DateTime date) {
  String month = convertTo2Digits(date.month.toString());
  String day = convertTo2Digits(date.day.toString());
  String year = date.year.toString();
  return "$year-$month-$day";
}

convertTo2Digits(String digit) {
  if (digit.length == 1) {
    return "0$digit";
  } else {
    return digit;
  }
}
