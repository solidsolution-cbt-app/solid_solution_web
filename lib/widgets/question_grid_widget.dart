import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:solidsolutionweb/components/custom_buttons/app_button.dart';
import 'package:solidsolutionweb/components/custom_texts/custom_texts.dart';
import 'package:solidsolutionweb/constants/colors.dart';
import 'package:solidsolutionweb/models/question_model.dart';
import 'package:solidsolutionweb/widgets/quill_question_card.dart.dart';

class QuestionGridWidget extends HookWidget {
  const QuestionGridWidget({
    required this.onSubmit,
    this.question,
    this.showLoader,
    this.year,
    this.school,
    this.subject,
    this.showClear,
    this.allowEdit = true,
    super.key,
  });
  final QuestionModel? question;
  final Function(QuestionModel question) onSubmit;

  final String? year, subject, school;
  final bool? showLoader, showClear;
  final bool allowEdit;

  @override
  Widget build(BuildContext context) {
    final questionController =
        useState<QuillController>(QuillController.basic());
    final option1Controller =
        useState<QuillController>(QuillController.basic());
    final option2Controller =
        useState<QuillController>(QuillController.basic());
    final option3Controller =
        useState<QuillController>(QuillController.basic());
    final option4Controller =
        useState<QuillController>(QuillController.basic());
    final solutionController =
        useState<QuillController>(QuillController.basic());
    void loadController() {
      if (question != null) {
        try {
          var queDoc =
              jsonDecode("${question?.text ?? ""} ${question?.image ?? ""}");
          questionController.value = QuillController(
            document: Document.fromJson(queDoc),
            selection: const TextSelection.collapsed(offset: 0),
          );
          var option1Doc = jsonDecode(
              "${question?.option1?.text ?? ""} ${question?.option1?.image ?? ""}");
          questionController.value = QuillController(
            document: Document.fromJson(option1Doc),
            selection: const TextSelection.collapsed(offset: 0),
          );
          var option2Doc = jsonDecode(
              "${question?.option2?.text ?? ""} ${question?.option2?.image ?? ""}");
          questionController.value = QuillController(
            document: Document.fromJson(option2Doc),
            selection: const TextSelection.collapsed(offset: 0),
          );

          var option3Doc = jsonDecode(
              "${question?.option3?.text ?? ""} ${question?.option3?.image ?? ""}");
          questionController.value = QuillController(
            document: Document.fromJson(option3Doc),
            selection: const TextSelection.collapsed(offset: 0),
          );
          var option4Doc = jsonDecode(
              "${question?.option4?.text ?? ""} ${question?.option4?.image ?? ""}");
          questionController.value = QuillController(
            document: Document.fromJson(option4Doc),
            selection: const TextSelection.collapsed(offset: 0),
          );
          var solutionDoc = jsonDecode(
              "${question?.solutionText ?? ""} ${question?.solutionImage ?? ""}");
          solutionController.value = QuillController(
            document: Document.fromJson(solutionDoc),
            selection: const TextSelection.collapsed(offset: 0),
          );
        } catch (e) {
//
        }
      }
    }

    void clear() {
      questionController.value.clear();
      option1Controller.value.clear();
      option2Controller.value.clear();
      option3Controller.value.clear();
      option4Controller.value.clear();
      solutionController.value.clear();
    }

    useEffect(
      () {
        WidgetsBinding.instance.addPostFrameCallback(
          (value) async {
            loadController();
          },
        );
        return;
      },
      [],
    );

    return Expanded(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
        child: Column(
          children: [
            if (showClear == true)
              Align(
                alignment: Alignment.bottomRight,
                child: AppButton(
                  buttonWidth: 200,
                  buttonText: "Clear",
                  onTap: () {
                    clear();
                  },
                ),
              ),
            QuillQuestionCard(
              controller: questionController.value,
              allowEdit: allowEdit,
            ),
            const SizedBox(height: 30),
            const Align(
              alignment: Alignment.bottomLeft,
              child: CustomTextBody1(
                text: "OPTIONS",
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            const Divider(color: AppColors.dartArsh),
            const SizedBox(height: 20),
            QuillQuestionCard(
              isCorrectOption: true,
              controller: option1Controller.value,
              isOption: true,
              allowEdit: allowEdit,
              title: "Answer option (correct)",
            ),
            const SizedBox(height: 20),
            QuillQuestionCard(
              controller: option2Controller.value,
              isOption: true,
              allowEdit: allowEdit,
              title: "Answer option",
            ),
            const SizedBox(height: 20),
            QuillQuestionCard(
              controller: option3Controller.value,
              isOption: true,
              allowEdit: allowEdit,
              title: "Answer option",
            ),
            const SizedBox(height: 20),
            QuillQuestionCard(
              controller: option4Controller.value,
              isOption: true,
              allowEdit: allowEdit,
              title: "Answer option",
            ),
            const SizedBox(height: 30),
            const Divider(color: AppColors.dartArsh),
            const Align(
              alignment: Alignment.bottomLeft,
              child: CustomTextBody1(
                text: "Solution",
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 20),
            QuillQuestionCard(
              controller: solutionController.value,
              allowEdit: allowEdit,
              title: "Solution ",
            ),
            const SizedBox(height: 50),
            if (allowEdit == true) ...[
              AppButton(
                buttonText: "Submit",
                showLoader: showLoader == true,
                onTap: () {
                  String queJsonDocument = jsonEncode(
                      questionController.value.document.toDelta().toJson());
                  String solJsonDocument = jsonEncode(
                      solutionController.value.document.toDelta().toJson());
                  String option1JsonDocument = jsonEncode(
                      option1Controller.value.document.toDelta().toJson());
                  String option2JsonDocument = jsonEncode(
                      option2Controller.value.document.toDelta().toJson());
                  String option3JsonDocument = jsonEncode(
                      option3Controller.value.document.toDelta().toJson());
                  String option4JsonDocument = jsonEncode(
                      option4Controller.value.document.toDelta().toJson());
                  QuestionModel question = QuestionModel.tojson(
                    text: queJsonDocument,
                    year: year,
                    subject: subject,
                    school: school,
                    solutionText: solJsonDocument,
                    option1: OptionModel.tojson(
                      text: option1JsonDocument,
                      isCorrect: true,
                    ),
                    option2: OptionModel.tojson(
                      text: option2JsonDocument,
                    ),
                    option3: OptionModel.tojson(
                      text: option3JsonDocument,
                    ),
                    option4: OptionModel.tojson(
                      text: option4JsonDocument,
                    ),
                  );
                  onSubmit(question);
                },
              ),
              const SizedBox(height: 50),
            ]
          ],
        ),
      ),
    );
  }
}
