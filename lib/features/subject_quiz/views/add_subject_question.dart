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
import 'package:solidsolutionweb/widgets/question_widget.dart';
import 'package:solidsolutionweb/widgets/year_filter_widget.dart';

class AddSubjectQuizScreen extends StatefulWidget {
  const AddSubjectQuizScreen({
    super.key,
  });
  static const String routeName = "/add_subject_quiz_screen";

  @override
  State<AddSubjectQuizScreen> createState() => _AddSubjectQuizScreenState();
}

String selectedYear = "select year";
setSelectedYear(String year) {
  selectedYear = year;
}

class _AddSubjectQuizScreenState extends State<AddSubjectQuizScreen> {
  @override
  Widget build(BuildContext context) {
    return BaseView<SubjectQuizViewModel>(
      onModelReady: (model) {
        setSelectedYear(model.selectedYear);
      },
      builder: (context, model, child) {
        return Stack(
          children: [
            BaseScreen(
              allowSubjectChange: false,
              onTap: () {
                setState(() {});
              },
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
                          YearWidget(
                            currentYear: selectedYear,
                          )
                        ],
                      ),
                      const SizedBox(height: 50),
                      QuestionWidget(
                        onSubmitQuestion: (value) {
                          if (selectedYear != "select year") {
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
                            model.uploadSubjectQuestion(
                              year: selectedYear,
                              jsonData: newQuestion.dataSent!,
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
                      ),
                      const SizedBox(height: 300),
                    ],
                  ),
                ),
              ),
            ),
            AppProgressIndicator(
              showLoader: model.loadAddSubjectQuestion,
            )
          ],
        );
      },
    );
  }
}
