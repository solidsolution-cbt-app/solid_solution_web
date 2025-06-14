import 'package:get_it/get_it.dart';
import 'package:solidsolutionweb/core/navigation_service.dart';
import 'package:solidsolutionweb/features/authentication/view_model/auth_view_model.dart';
import 'package:solidsolutionweb/features/blog/view_models/blog_view_model.dart';
import 'package:solidsolutionweb/features/post_utme/view_model/post_utme_view_model.dart';
import 'package:solidsolutionweb/features/utme/pages/exam/view_model/exam_view_model.dart';
import 'package:solidsolutionweb/features/utme/pages/temp/subject_quiz/view_model/subject_quiz_view_model.dart';
import 'package:solidsolutionweb/features/utme/pages/temp/base/view_model/base_screen_view_model.dart';
import 'package:solidsolutionweb/features/utme/pages/temp/topic_quiz/view_model/topic_view_model.dart';

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
  locatorX.registerLazySingleton<ExamViewModel>(
    () => ExamViewModel(),
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
