import 'package:flutter/material.dart';
import 'package:solidsolutionweb/features/authentication/views/login_screen.dart';
import 'package:solidsolutionweb/features/dashboard/view/dash_board.dart';
import 'package:solidsolutionweb/features/exam_quiz/views/add_exam_quiz_screen.dart';
import 'package:solidsolutionweb/features/exam_quiz/views/edit_exam_quiz_screen.dart';
import 'package:solidsolutionweb/features/exam_quiz/views/exam_quiz_preview_screen.dart';
import 'package:solidsolutionweb/features/exam_quiz/views/exam_quiz_screen.dart';
import 'package:solidsolutionweb/features/pdf_viewer_page.dart/pdf_viewer_page.dart';
import 'package:solidsolutionweb/features/subject_quiz/views/add_subject_question.dart';
import 'package:solidsolutionweb/features/subject_quiz/views/edit_subject_question.dart';
import 'package:solidsolutionweb/features/subject_quiz/views/preview_subject_question.dart';
import 'package:solidsolutionweb/features/subject_quiz/views/subject_preview_screen.dart';
import 'package:solidsolutionweb/features/topic_quiz/views/add_topic_quiz_sereen.dart';
import 'package:solidsolutionweb/features/topic_quiz/views/edit_topic_question.dart';
import 'package:solidsolutionweb/features/topic_quiz/views/topic_question_preview_screen.dart';
import 'package:solidsolutionweb/features/topic_quiz/views/topic_quiz_preview_screen.dart';
import 'package:solidsolutionweb/features/topic_quiz/views/topic_quiz_view.dart';
import 'package:solidsolutionweb/models/question_model.dart';
import 'package:solidsolutionweb/models/topic_quiz_model.dart';
import 'package:solidsolutionweb/test_screen.dart';
import 'package:solidsolutionweb/widgets/preview_question_card.dart';

Route<RouteSettings> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case TestScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const TestScreen(),
      );
    case LoginScreen.routeName:
      return MaterialPageRoute(
        builder: (_) => const LoginScreen(),
        settings: routeSettings,
      );
    case DashBoard.routeName:
      return MaterialPageRoute(
        builder: (_) => const DashBoard(),
        settings: routeSettings,
      );
    case TopicQuizPreviewScreen.routeName:
      final TopicModel? topic = routeSettings.arguments as TopicModel?;
      return MaterialPageRoute(
        builder: (_) => TopicQuizPreviewScreen(
          topic: topic,
        ),
        settings: routeSettings,
      );
    case AddTopicQuizScreen.routeName:
      final TopicModel? topic = routeSettings.arguments as TopicModel?;
      return MaterialPageRoute(
        builder: (_) => AddTopicQuizScreen(
          topic: topic,
        ),
      );
    case TopicQuestionPreviewScreen.routeName:
      final TopicPreviewQuestionModel topicQuestionData =
          routeSettings.arguments as TopicPreviewQuestionModel;
      return MaterialPageRoute(
        builder: (_) => TopicQuestionPreviewScreen(
          topicQuestionData: topicQuestionData,
        ),
        settings: routeSettings,
      );
    case EditTopicQuestionPreviewScreen.routeName:
      final TopicPreviewQuestionModel topicQuestionData =
          routeSettings.arguments as TopicPreviewQuestionModel;
      return MaterialPageRoute(
        builder: (_) => EditTopicQuestionPreviewScreen(
          topicQuestionData: topicQuestionData,
        ),
        settings: routeSettings,
      );
    case AddSubjectQuizScreen.routeName:
      return MaterialPageRoute(
        builder: (_) => const AddSubjectQuizScreen(),
        settings: routeSettings,
      );
    case EditQuizPreviewScreen.routeName:
      final QuestionModel questionData =
          routeSettings.arguments as QuestionModel;
      return MaterialPageRoute(
        builder: (_) => EditQuizPreviewScreen(
          questionData: questionData,
        ),
        settings: routeSettings,
      );
    case ExamQuizScreen.routeName:
      return MaterialPageRoute(
        builder: (_) => const ExamQuizScreen(),
        settings: routeSettings,
      );
    case ExamQuizPreviewScreen.routeName:
      final QuestionModel questionData =
          routeSettings.arguments as QuestionModel;
      return MaterialPageRoute(
        builder: (_) => ExamQuizPreviewScreen(
          questionData: questionData,
        ),
        settings: routeSettings,
      );
    case EditExamQuizScreen.routeName:
      final QuestionModel questionData =
          routeSettings.arguments as QuestionModel;
      return MaterialPageRoute(
        builder: (_) => EditExamQuizScreen(
          questionData: questionData,
        ),
        settings: routeSettings,
      );
    case AddExamQuizScreen.routeName:
      return MaterialPageRoute(
        builder: (_) => const AddExamQuizScreen(),
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
      final QuestionModel questionData =
          routeSettings.arguments as QuestionModel;
      return MaterialPageRoute(
        builder: (_) => SubjectQuizPreviewScreen(
          questionData: questionData,
        ),
        settings: routeSettings,
      );
    case PdfViewerPage.routeName:
      final String pdfLink = routeSettings.arguments as String;
      return MaterialPageRoute(
        builder: (_) => PdfViewerPage(
          pdfLink: pdfLink,
        ),
      );
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