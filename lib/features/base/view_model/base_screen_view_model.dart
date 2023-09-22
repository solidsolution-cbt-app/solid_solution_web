import 'package:solidsolutionweb/core/base_model.dart';

class BaseScreenViewModel extends BaseModel {
  String selectedText = "English";
  setSelectedText(String text) {
    selectedText = text;
    notifyListeners();
  }

  List<String> subjects = [
    "English",
    "Chemistry",
    "Mathematics",
    "Physics",
    "Biology",
    "Economics",
    "Government",
    "Literature",
    "Islamic Religious Knowledge",
  ];
}
