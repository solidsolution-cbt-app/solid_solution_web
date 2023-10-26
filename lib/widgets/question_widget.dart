import 'package:flutter/material.dart';
import 'package:solidsolutionweb/components/app_text_fields/app_text_field.dart';
import 'package:solidsolutionweb/components/custom_buttons/app_button.dart';
import 'package:solidsolutionweb/components/custom_buttons/app_text_button.dart';
import 'package:solidsolutionweb/components/custom_texts/custom_texts.dart';
import 'package:solidsolutionweb/components/dialogs/dialog_service.dart';
import 'package:solidsolutionweb/constants/colors.dart';
// import 'package:file_picker/file_picker.dart';
import 'package:solidsolutionweb/core/locator.dart';
import 'package:solidsolutionweb/features/pdf_viewer_page.dart/pdf_viewer_page.dart';
import 'package:solidsolutionweb/models/exception_model_calss/local_errors.dart.dart';
import 'package:solidsolutionweb/models/question_model.dart';
// import 'package:solidsolutionweb/models/exception_model_calss/local_errors.dart.dart';
// import 'package:solidsolutionweb/network_service/api_service.dart';
import 'package:solidsolutionweb/widgets/image_viewer.dart';

class QuestionWidget extends StatefulWidget {
  const QuestionWidget({
    required this.onSubmitQuestion,
    super.key,
  });
  final Function(QuestionModel question) onSubmitQuestion;

  @override
  State<QuestionWidget> createState() => _QuestionWidgetState();
}

class _QuestionWidgetState extends State<QuestionWidget> {
  final TextEditingController questionController = TextEditingController();
  final TextEditingController option1Controller = TextEditingController();
  final TextEditingController option2Controller = TextEditingController();
  final TextEditingController option3Controller = TextEditingController();
  final TextEditingController option4Controller = TextEditingController();
  clearController() {
    questionController.clear();
    option1Controller.clear();
    option2Controller.clear();
    option3Controller.clear();
    option4Controller.clear();
    option1Image = "";
    option2Image = "";
    option3Image = "";
    option4Image = "";
    questionImage = "";
    solutionpdf = "";
    setState(() {});
  }

  String option1Image = "";
  String option2Image = "";
  String option3Image = "";
  String option4Image = "";
  String questionImage = "";
  String solutionpdf = "";
  String? year;

  QuestionModel getQuestion() {
    QuestionModel question = QuestionModel.tojson(
      text: questionController.text,
      image: questionImage,
      year: year,
      solutionpdf: solutionpdf,
      option1: OptionModel.tojson(
        text: option1Controller.text,
        isCorrect: true,
        image: option1Image,
      ),
      option2: OptionModel.tojson(
        text: option2Controller.text,
        // isCorrect: true
        image: option2Image,
      ),
      option3: OptionModel.tojson(
        text: option3Controller.text,
        // isCorrect: true
        image: option3Image,
      ),
      option4: OptionModel.tojson(
        text: option4Controller.text,
        // isCorrect: true
        image: option4Image,
      ),
    );
    return question;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        QuestionCard(
          isOption: false,
          controller: questionController,
          imagePath: questionImage,
          delete: () {
            questionImage = "";
            setState(() {});
          },
          setImageUrl: (value) {
            questionImage = value;
            setState(() {});
          },
        ),
        const SizedBox(height: 20),
        QuestionCard(
          controller: option1Controller,
          isCorrectOption: true,
          imagePath: option1Image,
          delete: () {
            option1Image = "";
            setState(() {});
          },
          setImageUrl: (value) {
            option1Image = value;
            setState(() {});
          },
        ),
        const SizedBox(height: 20),
        QuestionCard(
          controller: option2Controller,
          imagePath: option2Image,
          delete: () {
            option2Image = "";
            setState(() {});
          },
          setImageUrl: (value) {
            option2Image = value;
            setState(() {});
          },
        ),
        const SizedBox(height: 20),
        QuestionCard(
          controller: option3Controller,
          imagePath: option3Image,
          delete: () {
            option3Image = "";
            setState(() {});
          },
          setImageUrl: (value) {
            option3Image = value;
            setState(() {});
          },
        ),
        const SizedBox(height: 20),
        QuestionCard(
          controller: option4Controller,
          imagePath: option4Image,
          delete: () {
            option4Image = "";
            setState(() {});
          },
          setImageUrl: (value) {
            option4Image = value;
            setState(() {});
          },
        ),
        const SizedBox(height: 50),
        SelectPdfWidget(
          prfLink: solutionpdf,
          setSolutionPdf: (value) {
            solutionpdf = value;
            setState(() {});
          },
        ),
        AppButton(
          onTap: () async {
            QuestionModel question = getQuestion();
            LocalExceptionModel isValidQuestion =
                validateQuestion(question: question);
            if (isValidQuestion.isSuccessful) {
              await widget.onSubmitQuestion(question);
              clearController();
            } else {
              dialogService.showErrorDialog(
                errorMessage: isValidQuestion.message,
              );
            }
          },
          buttonText: "Submit",
        ),
        const SizedBox(height: 100),
      ],
    );
  }
}

class QuestionCard extends StatefulWidget {
  const QuestionCard({
    required this.controller,
    this.title = "Enter Question",
    required this.imagePath,
    this.isOption = true,
    required this.setImageUrl,
    required this.delete,
    this.isCorrectOption = false,
    super.key,
  });

  final TextEditingController controller;
  final String title;
  final bool isOption;
  final bool isCorrectOption;
  final Function(String value) setImageUrl;
  final Function() delete;
  final String imagePath;

  @override
  State<QuestionCard> createState() => _QuestionCardState();
}

class _QuestionCardState extends State<QuestionCard> {
  bool showLoader = false;

  // onTapDelete() {
  //   imagePath = "";
  //   widget.setImageUrl(imagePath);
  //   setState(() {});
  // }

  toggleshowLoader(bool value) {
    showLoader = value;
    setState(() {});
  }

  uploadQuestionImage() async {
    String newimagePath = "";
    // final result = await FilePicker.platform
    //     .pickFiles(type: FileType.image, allowMultiple: false);

    // if (result != null && result.files.isNotEmpty) {
    //   toggleshowLoader(true);
    //   final fileBytes = result.files.first.bytes;
    //   final fileName = result.files.first.name;
    //   LocalExceptionModel newImagePath = await apiService.uploadImage(
    //     imagePath: fileBytes!,
    //     filename: fileName,
    //   );
    //   imagePath = newImagePath.model as String;
    //   widget.setImageUrl(imagePath);
    // }

    newimagePath =
        "https://res.cloudinary.com/dn4d52sd1/image/upload/v1698246176/Screenshot%20from%202022-05-01%2010-23-32.png1698246168930.png";
    widget.setImageUrl(newimagePath);
    toggleshowLoader(false);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(left: widget.isOption ? 60 : 0),
          child: CustomTextBody1(
            text: widget.isOption
                ? (widget.isCorrectOption ? "Option (Correct)" : "Option")
                : widget.title,
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Visibility(
              visible: widget.isOption,
              child: OptionIndicator(
                isCorrect: widget.isCorrectOption,
              ),
            ),
            Expanded(
              child: AppTextField2(
                controller: widget.controller,
                maxLines: 4,
                hintText: "Type...",
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        Visibility(
          visible: widget.imagePath == "",
          replacement: ImageBox(
            imagePath: widget.imagePath,
            onTapdelete: () {
              widget.delete();
            },
          ),
          child: Container(
            margin: EdgeInsets.only(left: widget.isOption ? 60 : 0),
            child: Material(
              child: InkWell(
                onTap: () {
                  uploadQuestionImage();
                },
                child: SizedBox(
                  width: 230,
                  child: Visibility(
                    visible: !showLoader,
                    replacement: const SizedBox(
                      width: 70,
                      height: 70,
                      child: Center(
                        child: CircularProgressIndicator(
                          backgroundColor: AppColors.violet,
                        ),
                      ),
                    ),
                    child: const Row(
                      children: [
                        Icon(
                          Icons.image_outlined,
                          color: AppColors.primaryColor,
                        ),
                        SizedBox(width: 10),
                        CustomTextBody1(
                          text: "click to upload diagram",
                          textColor: AppColors.primaryColor,
                          fontSize: 16,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        const Row()
      ],
    );
  }
}

class OptionIndicator extends StatelessWidget {
  const OptionIndicator({
    this.isCorrect = false,
    super.key,
  });

  final bool isCorrect;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 20),
      child: Column(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: isCorrect ? AppColors.greenColor : AppColors.redColor,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(5),
                topRight: Radius.circular(5),
              ),
            ),
          ),
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              border: Border.all(
                width: 2,
                color: AppColors.dartArsh,
              ),
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(5),
                bottomRight: Radius.circular(5),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class ImageBox extends StatelessWidget {
  const ImageBox({
    this.onTapdelete,
    this.imagePath = "",
    super.key,
  });
  final Function()? onTapdelete;
  final String imagePath;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        if (imagePath != "")
          ImageViewer(
            urlImagePath: imagePath,
          ),
        SizedBox(
          width: 350,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                backgroundColor: AppColors.primaryColor,
                child: Center(
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    color: AppColors.violet,
                    onPressed: onTapdelete,
                    icon: const Icon(
                      Icons.delete,
                      size: 35,
                      color: Colors.white,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}

class SelectPdfWidget extends StatefulWidget {
  const SelectPdfWidget({
    required this.setSolutionPdf,
    required this.prfLink,
    super.key,
  });

  final Function(String value) setSolutionPdf;
  final String prfLink;

  @override
  State<SelectPdfWidget> createState() => _SelectPdfWidgetState();
}

class _SelectPdfWidgetState extends State<SelectPdfWidget> {
  bool showLoader = false;
  toggleshowLoader(bool value) {
    showLoader = value;
  }

  void uploadFile() async {
    // final result = await FilePicker.platform.pickFiles(
    //   type: FileType.custom,
    //   allowMultiple: false,
    //   allowedExtensions: ['pdf'],
    // );

    // if (result != null && result.files.isNotEmpty) {
    //   toggleshowLoader(true);
    //   final fileBytes = result.files.first.bytes;
    //   final fileName = result.files.first.name;
    //   LocalExceptionModel filePath = await apiService.uploadPdf(
    //     imagePath: fileBytes!,
    //     filename: fileName,
    //   );
    //   widget.setSolutionPdf(pdflink);
    //   pdflink = filePath.model as String;
    // }
    String pdflink = "";
    pdflink =
        "https://res.cloudinary.com/dn4d52sd1/image/upload/v1698243712/My_CV.pdf1698243709181.pdf";
    widget.setSolutionPdf(pdflink);
    toggleshowLoader(false);
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: widget.prfLink == "",
      replacement: Column(
        children: [
          CustomTextBody1(
            text: extractPdfFilename(widget.prfLink),
            fontSize: 14,
          ),
          const SizedBox(height: 5),
          AppButton(
            buttonWidth: 130,
            onTap: () {
              navigator.push(
                routeName: PdfViewerPage.routeName,
                argument: widget.prfLink,
              );
            },
            buttonText: "Open pdf",
          ),
          const SizedBox(height: 5),
          AppTextButton(
            onTap: () {
              widget.setSolutionPdf("");
            },
            buttontext: "remove",
          ),
          const SizedBox(height: 80),
        ],
      ),
      child: Visibility(
        visible: !showLoader,
        replacement: const SizedBox(
          width: 70,
          height: 70,
          child: Center(
            child: CircularProgressIndicator(
              backgroundColor: AppColors.violet,
            ),
          ),
        ),
        child: Column(
          children: [
            const CustomTextBody1(
              text: "Upload Solution File (format: pdf)",
              fontSize: 14,
            ),
            const SizedBox(height: 20),
            AppButton(
              buttonWidth: 130,
              onTap: () {
                uploadFile();
              },
              buttonText: "choose File",
            ),
            const SizedBox(height: 80),
          ],
        ),
      ),
    );
  }
}

String extractPdfFilename(String pdfUrl) {
  Uri uri = Uri.parse(pdfUrl);
  String path = uri.path;
  List<String> segments = path.split('/');
  String filename = segments.last;

  if (filename.contains('?')) {
    filename = filename.split('?').first;
  }

  return filename;
}
