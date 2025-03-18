import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:solidsolutionweb/components/custom_buttons/more_action_button.dart';
import 'package:solidsolutionweb/components/custom_texts/custom_texts.dart';
import 'package:solidsolutionweb/constants/app_strings.dart';
import 'package:solidsolutionweb/constants/colors.dart';
import 'package:solidsolutionweb/models/question_model.dart';
import 'package:solidsolutionweb/widgets/image_embedder.dart';

class QuestionDiaplaySummaryCard extends HookWidget {
  const QuestionDiaplaySummaryCard({
    required this.question,
    required this.questionNumber,
    required this.onSelect,
    super.key,
  });
  final int questionNumber;
  final QuestionModel question;
  final Function(String value) onSelect;
  @override
  Widget build(BuildContext context) {
    final questionController =
        useState<QuillController>(QuillController.basic());
    void loadController() {
      var queDoc = jsonDecode("${question.text ?? ""} ${question.image ?? ""}");
      questionController.value = QuillController(
        document: Document.fromJson(queDoc),
        selection: const TextSelection.collapsed(offset: 0),
      );
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

    return Container(
        width: 400,
        height: 200,
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 10,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            width: 1,
            color: AppColors.primaryColor,
          ),
        ),
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomTextBody1(
                  text: "Question $questionNumber",
                  textColor: AppColors.primaryColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                ),
                const SizedBox(height: 10),
                Expanded(
                    child: Center(
                  child: QuillEditor(
                    controller: questionController.value,
                    focusNode: FocusNode(),
                    scrollController: ScrollController(),
                    configurations: QuillEditorConfigurations(
                      enableInteractiveSelection: false,
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      scrollable: true,
                      expands: false,
                      placeholder: "",
                      embedBuilders: [
                        CustomImageEmbedBuilder(),
                      ],
                    ),
                  ),
                )),
                const Row()
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                MoreActionButton(
                  actions: [
                    MoreActionItem(
                      value: AppString.viewQuestion,
                      icon: const Icon(
                        Icons.view_agenda,
                        size: 15,
                        color: AppColors.violet,
                      ),
                      label: AppString.viewQuestion,
                      fontSize: 12,
                    ),
                    MoreActionItem(
                      value: AppString.editQuestion,
                      icon: const Icon(
                        Icons.edit,
                        size: 15,
                        color: AppColors.violet,
                      ),
                      label: AppString.editQuestion,
                      fontSize: 12,
                    ),
                    MoreActionItem(
                      value: AppString.delete,
                      icon: const Icon(
                        Icons.delete,
                        color: AppColors.redColor,
                        size: 15,
                      ),
                      label: AppString.delete,
                      fontSize: 12,
                    ),
                  ],
                  onSelectAction: (value) {
                    onSelect(value.toString());
                  },
                ),
              ],
            )
          ],
        ));
  }
}
