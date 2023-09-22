String dateTimeFormatter(String? date) {
  if (date == null) {
    return "";
  } else {
    if (DateTime.tryParse(date) != null) {
      DateTime myDate = DateTime.parse(date);
      String year = myDate.year.toString();
      String month = getMonthName(myDate.month).toString();
      String day = myDate.day.toString();
      return "$month $day, $year";
    } else {
      return "";
    }
  }
}

String getMonthName(int month) {
  switch (month) {
    case 1:
      return 'January';
    case 2:
      return 'February';
    case 3:
      return 'March';
    case 4:
      return 'April';
    case 5:
      return 'May';
    case 6:
      return 'June';
    case 7:
      return 'July';
    case 8:
      return 'August';
    case 9:
      return 'September';
    case 10:
      return 'October';
    case 11:
      return 'November';
    case 12:
      return 'December';
    default:
      return '';
  }
}
