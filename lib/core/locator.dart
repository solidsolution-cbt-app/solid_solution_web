import 'package:get_it/get_it.dart';
import 'package:solidsolutionweb/core/navigation_service.dart';
import 'package:solidsolutionweb/features/authentication/view_model/auth_view_model.dart';
import 'package:solidsolutionweb/features/blog/view_models/blog_view_model.dart';
import 'package:solidsolutionweb/features/post_utme/view_model/post_utme_view_model.dart';
import 'package:solidsolutionweb/features/utme/pages/subject_quiz/view_model/subject_quiz_view_model.dart';
import 'package:solidsolutionweb/features/utme/pages/base/view_model/base_screen_view_model.dart';
import 'package:solidsolutionweb/features/utme/pages/exam_quiz/view_model/exam_quiz_view_model.dart';
import 'package:solidsolutionweb/features/utme/pages/topic_quiz/view_model/topic_view_model.dart';

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
  locatorX.registerLazySingleton<BlogViewModel>(
    () => BlogViewModel(),
  );
   locatorX.registerLazySingleton<PostUtmeViewModel>(
    () => PostUtmeViewModel(),
  );
}
