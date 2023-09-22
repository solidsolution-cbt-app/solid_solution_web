String getFirstNCharacters(String? inputString, int n) {
  if (inputString == null || inputString.isEmpty || n <= 0) {
    return ""; // Return an empty string for invalid input.
  }

  if (inputString.length <= n) {
    return inputString; // Return the entire string if it's shorter than or equal to n.
  }

  return inputString.substring(
    0,
    n,
  ); // Use substring to get the first n characters.
}
