import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:solidsolutionweb/components/custom_buttons/app_button.dart';
import 'package:solidsolutionweb/components/custom_texts/custom_texts.dart';
import 'package:solidsolutionweb/core/base_view.dart';
import 'package:solidsolutionweb/features/base/view/base_screen.dart';
import 'package:solidsolutionweb/features/exam_quiz/view_model/exam_quiz_view_model.dart';
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
        return BaseScreen(
          allowSubjectChange: false,
          onTap: () {
            setState(() {});
          },
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 30),
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
                  onSubmitQuestion: (value) {},
                ),
                const SizedBox(height: 50),
                const CustomTextBody1(
                  text: "Upload Solution",
                ),
                const SizedBox(height: 10),
                const CustomTextBody1(
                  text: "File format: pdf",
                  fontSize: 14,
                ),
                const SizedBox(height: 20),
                AppButton(
                  buttonWidth: 130,
                  onTap: () {},
                  buttonText: "choose File",
                ),
                const SizedBox(height: 10),
                const CustomTextBody1(
                  text: "Minimum of 5mb",
                  fontSize: 14,
                ),
                const SizedBox(height: 80),
                AppButton(
                  onTap: () {
                    // model.addQuestion(
                    //   subject: locatorX<BaseScreenViewModel>().selectedText,
                    //   question: QuestionModel(),
                    // );
                    // Navigator.pop(context);
                  },
                  buttonText: "Submit",
                ),
                const SizedBox(height: 100),
              ],
            ),
          ),
        );
      },
    );
  }
}
