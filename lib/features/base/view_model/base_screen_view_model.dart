import 'package:solidsolutionweb/core/base_model.dart';

class BaseScreenViewModel extends BaseModel {
  String selectedText = "Use of English";
  setSelectedText(String text) {
    selectedText = text;
    notifyListeners();
  }

  List<String> subjects = [
    "Use of English",
    "Physics",
    "Chemistry",
    "Biology",
    "Mathematics",
    "Economics",
    "Government",
    "Literature",
    "Christian Religious knowledge",
    "Islamic Religious knowledge",
    "Account",
    "Commerce",
  ];
}
