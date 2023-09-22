import 'package:flutter/material.dart';
import 'package:solidsolutionweb/features/dashboard/view/dash_board.dart';
import 'package:solidsolutionweb/features/exam_quiz/views/exam_quiz_preview_screen.dart';
import 'package:solidsolutionweb/features/subject_quiz/views/add_subject_question.dart';
import 'package:solidsolutionweb/features/subject_quiz/views/edit_subject_question.dart';
import 'package:solidsolutionweb/features/subject_quiz/views/preview_subject_question.dart';
import 'package:solidsolutionweb/features/subject_quiz/views/subject_preview_screen.dart';
import 'package:solidsolutionweb/features/topic_quiz/views/topic_quiz_preview_screen.dart';
import 'package:solidsolutionweb/features/topic_quiz/views/topic_quiz_view.dart';
import 'package:solidsolutionweb/test_screen.dart';

Route<RouteSettings> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case TestScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const TestScreen(),
      );
    case DashBoard.routeName:
      return MaterialPageRoute(
        builder: (_) => const DashBoard(),
        settings: routeSettings,
      );
    case TopicQuizPreviewScreen.routeName:
      final String? topic = routeSettings.arguments as String?;
      return MaterialPageRoute(
        builder: (_) => TopicQuizPreviewScreen(
          topic: topic ?? "",
        ),
        settings: routeSettings,
      );
    case AddSubjectQuizScreen.routeName:
      return MaterialPageRoute(
        builder: (_) => const AddSubjectQuizScreen(),
        settings: routeSettings,
      );
    case EditQuizPreviewScreen.routeName:
      return MaterialPageRoute(
        builder: (_) => const EditQuizPreviewScreen(),
        settings: routeSettings,
      );
    case ExamQuizPreviewScreen.routeName:
      return MaterialPageRoute(
        builder: (_) => const ExamQuizPreviewScreen(),
        settings: routeSettings,
      );
    case SubjectPreviewScreen.routeName:
      return MaterialPageRoute(
        builder: (_) => const SubjectPreviewScreen(),
        settings: routeSettings,
      );
    case TopicQuizScreen.routeName:
      return MaterialPageRoute(
        builder: (_) => const TopicQuizScreen(),
        settings: routeSettings,
      );
    case SubjectQuizPreviewScreen.routeName:
      return MaterialPageRoute(
        builder: (_) => const SubjectQuizPreviewScreen(),
        settings: routeSettings,
      );
    // case BaseScreen.routeName:
    //   return MaterialPageRoute(
    //     builder: (_) => const BaseScreen(),
    //     settings: routeSettings,
    //   );
    default:
      return MaterialPageRoute(
        builder: (_) => const Scaffold(
          body: Center(child: Text('Unknown route')),
        ),
      );
  }
}


/// route const 
/* case :return MaterialPageRoute(builder: (_)=> );*/