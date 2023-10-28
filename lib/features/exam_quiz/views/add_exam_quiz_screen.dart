import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:solidsolutionweb/components/custom_texts/custom_texts.dart';
import 'package:solidsolutionweb/core/base_view.dart';
import 'package:solidsolutionweb/core/locator.dart';
import 'package:solidsolutionweb/features/base/view/base_screen.dart';
import 'package:solidsolutionweb/features/base/view_model/base_screen_view_model.dart';
import 'package:solidsolutionweb/features/exam_quiz/view_model/exam_quiz_view_model.dart';
import 'package:solidsolutionweb/widgets/app_progress_indicator.dart';
import 'package:solidsolutionweb/widgets/question_widget.dart';

class AddExamQuizScreen extends StatefulWidget {
  const AddExamQuizScreen({
    super.key,
  });
  static const String routeName = "/add_exam_quiz_screen";

  @override
  State<AddExamQuizScreen> createState() => _AddExamQuizScreenState();
}

class _AddExamQuizScreenState extends State<AddExamQuizScreen> {
  @override
  Widget build(BuildContext context) {
    return BaseView<ExamQuizViewModel>(
      builder: (context, model, child) {
        return Stack(
          children: [
            BaseScreen(
              allowSubjectChange: false,
              onTap: () {},
              child: Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 30),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset("asset/svg/book-square outline.svg"),
                          const SizedBox(width: 15),
                          const CustomTextHeader1(
                            text: "Exam Quiz",
                            fontWeight: FontWeight.w500,
                          ),
                          const Spacer(),
                        ],
                      ),
                      const SizedBox(height: 50),
                      QuestionWidget(
                        onSubmitQuestion: (value) {
                          model.uploadExamQuestion(
                            jsonData: value.dataSent!,
                            subject:
                                locatorX<BaseScreenViewModel>().selectedText,
                          );
                        },
                      ),
                      const SizedBox(height: 100),
                    ],
                  ),
                ),
              ),
            ),
            AppProgressIndicator(
              showLoader: model.loadAddExamQuestion,
            )
          ],
        );
      },
    );
  }
}
