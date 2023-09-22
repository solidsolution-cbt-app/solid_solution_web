String getFirstNthCharacters(String input, int length) {
  if (input.length <= length) {
    return input;
  } else {
    return input.substring(0, length);
  }
}
