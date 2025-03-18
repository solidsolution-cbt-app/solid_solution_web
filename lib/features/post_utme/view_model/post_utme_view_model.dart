import 'package:solidsolutionweb/core/base_model.dart';
import 'package:solidsolutionweb/network_service/api_service.dart';

class PostUtmeViewModel extends BaseModel {
  List<String> schools = [];
  String selectedSubject = "";
  setSelectedSubject(String subject) {
    selectedSubject = subject;
    notifyListeners();
  }

  bool loadGetUniversities = false;
  bool loadGetSubjects = false;

  Map<String, List<String>> subjects = {};

  List<String> getSubjects(String school) {
    if (subjects.containsKey(school)) {
      return subjects[school]!;
    } else {
      return [];
    }
  }

  toggleLoadGetUniversities(bool value) {
    loadGetUniversities = value;
    notifyListeners();
  }

  toggleLoadGetSubjects(bool value) {
    loadGetSubjects = value;
    notifyListeners();
  }

  Future<void> getUniversities() async {
    toggleLoadGetUniversities(true);
    try {
      var data = await apiService.getUniversity();
      if (data.isSuccessful) {
        List<dynamic> schoolData = data.model as List<dynamic>;
        schools = schoolData.map((e) => e.toString()).toList();
      } else {}
    } catch (e) {
      //
    }
    toggleLoadGetUniversities(false);
  }

  Future<void> getSchoolSubjects({required String school}) async {
    toggleLoadGetSubjects(true);
    try {
      var data = await apiService.getSchoolSubjects(school: school);
      if (data.isSuccessful) {
        List<dynamic> schoolData = data.model["subjects"] as List<dynamic>;
        subjects[school] = schoolData.map((e) => e.toString()).toList();
      } else {}
    } catch (e) {
      //
    }
    toggleLoadGetSubjects(false);
  }
}
