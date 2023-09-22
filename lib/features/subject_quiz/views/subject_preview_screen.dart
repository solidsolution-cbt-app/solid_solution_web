import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:solidsolutionweb/components/custom_texts/custom_texts.dart';
import 'package:solidsolutionweb/core/base_view.dart';
import 'package:solidsolutionweb/core/locator.dart';
import 'package:solidsolutionweb/enums/question_type_enum.dart';
import 'package:solidsolutionweb/features/base/view/base_screen.dart';
import 'package:solidsolutionweb/features/base/view_model/base_screen_view_model.dart';
import 'package:solidsolutionweb/features/subject_quiz/view_model/subject_quiz_view_model.dart';
import 'package:solidsolutionweb/features/subject_quiz/views/preview_subject_question.dart';
import 'package:solidsolutionweb/widgets/add_question_card.dart';
import 'package:solidsolutionweb/widgets/question_card.dart';

class SubjectPreviewScreen extends StatefulWidget {
  const SubjectPreviewScreen({
    super.key,
  });
  static const String routeName = "/subject_preview";

  @override
  State<SubjectPreviewScreen> createState() => _SubjectPreviewScreenState();
}

class _SubjectPreviewScreenState extends State<SubjectPreviewScreen> {
  @override
  Widget build(BuildContext context) {
    return BaseView<SubjectQuizViewModel>(builder: (
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
                    text: "Subject Quiz",
                    fontWeight: FontWeight.w500,
                  ),
                  const Spacer(),
                ],
              ),
              const SizedBox(height: 50),
              Wrap(
                spacing: 50,
                runSpacing: 20,
                children: [
                  const AddNewQuestionCard(
                    questiontype: Questiontype.subjectQuestion,
                  ),
                  ...model
                      .getQuestions(
                          subject: locatorX<BaseScreenViewModel>().selectedText)
                      .mapIndexed(
                        (index, element) => QuestionCard(
                          onTap: () {
                            model.setPreviewQuestion(question: element);
                            navigator.push(
                              routeName: SubjectQuizPreviewScreen.routeName,
                            );
                          },
                          question: element,
                          questionNumber: index + 1,
                        ),
                      )
                      .toList(),
                ],
              )
            ],
          ),
        ),
      );
    });
  }
}
