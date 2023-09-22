String cardNumberformattter(String digits) {
  const int groupSize = 4;
  const String separator = "";

  StringBuffer formattedBuffer = StringBuffer();

  for (int i = 0; i < digits.length; i += groupSize) {
    int endIndex = i + groupSize;
    if (endIndex > digits.length) {
      endIndex = digits.length;
    }

    String group = digits.substring(i, endIndex);
    formattedBuffer.write(group);

    if (endIndex < digits.length) {
      formattedBuffer.write(separator);
    }
  }

  return formattedBuffer.toString();
}
