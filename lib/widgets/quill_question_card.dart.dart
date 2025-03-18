import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:solidsolutionweb/components/custom_texts/custom_texts.dart';
import 'package:solidsolutionweb/constants/colors.dart';
import 'package:solidsolutionweb/network_service/api_service.dart';
import 'package:solidsolutionweb/widgets/image_embedder.dart';
import 'package:solidsolutionweb/widgets/temp/preview_question_card.dart';

class QuillQuestionCard extends HookWidget {
  const QuillQuestionCard({
    this.title,
    this.initialValue,
    this.isCorrectOption,
    this.isOption,
    required this.controller,
    this.allowEdit = true,
    super.key,
  });
  final String? initialValue, title;
  final bool? isOption, isCorrectOption;
  final bool allowEdit;
  final QuillController controller;

  @override
  Widget build(BuildContext context) {
    final loadUploadImage = useState(false);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (isOption == true) ...[
          OptionIndicator(
            isCorrect: isCorrectOption == true,
          ),
        ],
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextBody1(
                text: title ?? "Enter Question",
              ),
              const SizedBox(height: 10),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: AppColors.dartArsh),
                ),
                child: Column(
                  children: [
                    QuillSimpleToolbar(
                      controller: controller,
                      configurations: QuillSimpleToolbarConfigurations(
                        color: Colors.white,
                        showSearchButton: false,
                        showFontFamily: false,
                        showClearFormat: false,
                        showClipboardCut: false,
                        showClipboardPaste: false,
                        showListBullets: false,
                        showCenterAlignment: false,
                        showColorButton: false,
                        showCodeBlock: false,
                        showLink: false,
                        showQuote: false,
                        multiRowsDisplay: false,
                        showClipboardCopy: false,
                        customButtons: [
                          QuillToolbarCustomButtonOptions(
                            icon: loadUploadImage.value
                                ? const SizedBox(
                                    width: 20,
                                    height: 20,
                                    child: Center(
                                      child: CircularProgressIndicator(),
                                    ),
                                  )
                                : const Icon(Icons.image),
                            onPressed: () async {
                              if (loadUploadImage.value == false) {
                                final result = await FilePicker.platform
                                    .pickFiles(
                                        type: FileType.image,
                                        allowMultiple: false);
                                if (result != null && result.files.isNotEmpty) {
                                  final fileBytes = result.files.first.bytes;
                                  final fileName = result.files.first.name;
                                  loadUploadImage.value = true;
                                  var imageUpload =
                                      await apiService.uploadImage(
                                    imagePath: fileBytes!,
                                    filename: fileName,
                                  );
                                  if (imageUpload.isSuccessful) {
                                    ClaodinaryClassModel data = imageUpload
                                        .model as ClaodinaryClassModel;
                                    final image =
                                        BlockEmbed.image(data.fileLink);
                                    final index =
                                        controller.selection.baseOffset;
                                    final length =
                                        controller.selection.extentOffset -
                                            index;
                                    controller.replaceText(
                                      index,
                                      length,
                                      image,
                                      null,
                                    );
                                  }
                                  loadUploadImage.value = false;
                                }
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Divider(
                      color: AppColors.dartArsh,
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      height: 200,
                      child: QuillEditor(
                        controller: controller,
                        focusNode: FocusNode(),
                        scrollController: ScrollController(),
                        configurations: QuillEditorConfigurations(
                          autoFocus: true,
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          scrollable: true,
                          expands: false,
                          enableInteractiveSelection: allowEdit,
                          placeholder: "Type Here",
                          embedBuilders: [
                            CustomImageEmbedBuilder(),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
