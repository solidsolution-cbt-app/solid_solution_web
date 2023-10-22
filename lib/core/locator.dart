import 'package:get_it/get_it.dart';
import 'package:solidsolutionweb/core/navigation_service.dart';
import 'package:solidsolutionweb/features/authentication/view_model/auth_view_model.dart';
import 'package:solidsolutionweb/features/subject_quiz/view_model/subject_quiz_view_model.dart';
import 'package:solidsolutionweb/features/base/view_model/base_screen_view_model.dart';
import 'package:solidsolutionweb/features/exam_quiz/view_model/exam_quiz_view_model.dart';
import 'package:solidsolutionweb/features/topic_quiz/view_model/topic_view_model.dart';

GetIt locatorX = GetIt.instance;
var navigator = locatorX<NavigationService>();

void setUpLocatorX() {
  locatorX.registerLazySingleton<NavigationService>(
    () => NavigationService(),
  );
  locatorX.registerLazySingleton<SubjectQuizViewModel>(
    () => SubjectQuizViewModel(),
  );
  locatorX.registerLazySingleton<BaseScreenViewModel>(
    () => BaseScreenViewModel(),
  );
  locatorX.registerLazySingleton<ExamQuizViewModel>(
    () => ExamQuizViewModel(),
  );
  locatorX.registerLazySingleton<TopicQuizVeiwModel>(
    () => TopicQuizVeiwModel(),
  );
  locatorX.registerLazySingleton<AuthenticationViewModel>(
    () => AuthenticationViewModel(),
  );
}
