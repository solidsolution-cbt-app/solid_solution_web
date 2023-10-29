import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:solidsolutionweb/components/custom_texts/custom_texts.dart';
import 'package:solidsolutionweb/components/dialogs/dialog_service.dart';
import 'package:solidsolutionweb/core/base_view.dart';
import 'package:solidsolutionweb/core/locator.dart';
import 'package:solidsolutionweb/features/base/view/base_screen.dart';
import 'package:solidsolutionweb/features/base/view_model/base_screen_view_model.dart';
import 'package:solidsolutionweb/features/subject_quiz/view_model/subject_quiz_view_model.dart';
import 'package:solidsolutionweb/models/question_model.dart';
import 'package:solidsolutionweb/widgets/app_progress_indicator.dart';
import 'package:solidsolutionweb/widgets/edit_question_widget.dart';

class EditQuizPreviewScreen extends StatefulWidget {
  const EditQuizPreviewScreen({
    required this.questionData,
    super.key,
  });
  final QuestionModel questionData;
  static const String routeName = "/edit_quiz_preview";

  @override
  State<EditQuizPreviewScreen> createState() => _EditQuizPreviewScreenState();
}

class _EditQuizPreviewScreenState extends State<EditQuizPreviewScreen> {
  String selectedYear = "all";
  setSelectedYear(String value) {
    selectedYear = value;
    // setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return BaseView<SubjectQuizViewModel>(
      onModelReady: (model) {
        setSelectedYear(widget.questionData.year ?? "all");
      },
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
                            text: "Subject Quiz",
                            fontWeight: FontWeight.w500,
                          ),
                          const Spacer(),
                          // YearFilter(
                          //   onChangeyear: (year) {
                          //     setSelectedYear(year);
                          //   },
                          //   selectedYear: selectedYear,
                          // )
                        ],
                      ),
                      const SizedBox(height: 50),
                      EditQuestionWidget(
                        onSubmitQuestion: (value) {
                          if (selectedYear != "all") {
                            QuestionModel newQuestion = QuestionModel.tojson(
                              text: value.text,
                              option1: value.option1,
                              option2: value.option2,
                              option3: value.option3,
                              option4: value.option4,
                              image: value.image,
                              solutionpdf: value.solutionpdf,
                              year: model.selectedYear,
                            );
                            model.editSubjectQuestion(
                              jsonData: newQuestion.dataSent!,
                              questionId: widget.questionData.id!,
                              subject:
                                  locatorX<BaseScreenViewModel>().selectedText,
                            );
                          } else {
                            dialogService.showErrorDialog(
                              errorMessage:
                                  "Kindly select a year before you proceed",
                            );
                          }
                        },
                        initialquestion: widget.questionData,
                      ),
                      const SizedBox(height: 50),
                    ],
                  ),
                ),
              ),
            ),
            AppProgressIndicator(
              showLoader: model.loadEditQuestion,
            )
          ],
        );
      },
    );
  }
}
