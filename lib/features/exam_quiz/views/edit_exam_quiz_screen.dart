import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:solidsolutionweb/components/custom_buttons/app_button.dart';
import 'package:solidsolutionweb/components/custom_texts/custom_texts.dart';
import 'package:solidsolutionweb/core/base_view.dart';
import 'package:solidsolutionweb/core/locator.dart';
import 'package:solidsolutionweb/features/base/view/base_screen.dart';
import 'package:solidsolutionweb/features/base/view_model/base_screen_view_model.dart';
import 'package:solidsolutionweb/features/exam_quiz/view_model/exam_quiz_view_model.dart';
import 'package:solidsolutionweb/models/question_model.dart';
import 'package:solidsolutionweb/widgets/edit_question_widget.dart';

class EditExamQuizScreen extends StatefulWidget {
  const EditExamQuizScreen({
    super.key,
  });
  static const String routeName = "/edit_exam_quiz";

  @override
  State<EditExamQuizScreen> createState() => _EditExamQuizScreenState();
}

class _EditExamQuizScreenState extends State<EditExamQuizScreen> {
  @override
  Widget build(BuildContext context) {
    return BaseView<ExamQuizViewModel>(builder: (
      context,
      model,
      child,
    ) {
      return BaseScreen(
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
              EditQuestionWidget(
                option1Controller: model.option1Controller,
                option2Controller: model.option2Controller,
                option3Controller: model.option3Controller,
                option4Controller: model.option4Controller,
                questionController: model.questionController,
              ),
              const SizedBox(height: 50),
              AppButton(
                onTap: () {
                  model.updateQuestion(
                    subject: locatorX<BaseScreenViewModel>().selectedText,
                    question: QuestionModel(
                      questionId: model.editId,
                      question: model.questionController.text,
                      isQuestionImage: true,
                      isoption1Image: true,
                      isoption2Image: true,
                      isoption3Image: true,
                      isoption4Image: true,
                      option1: model.option1Controller.text,
                      option2: model.option2Controller.text,
                      option3: model.option3Controller.text,
                      option4: model.option4Controller.text,
                    ),
                  );
                  Navigator.pop(context);
                },
                buttonText: "Submit",
              ),
            ],
          ),
        ),
      );
    });
  }
}
