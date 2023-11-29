import 'package:flutter/material.dart';
import 'package:solidsolutionweb/components/app_text_fields/app_text_field.dart';
import 'package:solidsolutionweb/components/custom_buttons/app_button.dart';
import 'package:solidsolutionweb/components/custom_texts/custom_texts.dart';
import 'package:solidsolutionweb/components/dialogs/dialog_service.dart';
import 'package:solidsolutionweb/constants/colors.dart';
import 'package:file_picker/file_picker.dart';
import 'package:solidsolutionweb/models/exception_model_calss/local_errors.dart.dart';
import 'package:solidsolutionweb/models/question_model.dart';
import 'package:solidsolutionweb/network_service/api_service.dart';
import 'package:solidsolutionweb/widgets/image_viewer.dart';
import 'package:solidsolutionweb/widgets/selected_pdf_widget.dart';

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
              // clearController();
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

  toggleshowLoader(bool value) {
    showLoader = value;
    setState(() {});
  }

  uploadQuestionImage() async {
    try {
      final result = await FilePicker.platform
          .pickFiles(type: FileType.image, allowMultiple: false);

      if (result != null && result.files.isNotEmpty) {
        toggleshowLoader(true);
        final fileBytes = result.files.first.bytes;
        final fileName = result.files.first.name;
        LocalExceptionModel newImagePath = await apiService.uploadImage(
          imagePath: fileBytes!,
          filename: fileName,
        );
        ClaodinaryClassModel imagePath =
            newImagePath.model as ClaodinaryClassModel;
        widget.setImageUrl(imagePath.fileId);
        setInitialImage(imagePath.fileLink);
      }
    } catch (e) {
      //
    }

    toggleshowLoader(false);
  }

  String initialImage = "";
  setInitialImage(String value) {
    initialImage = value;
  }

  @override
  void initState() {
    if (initialImage == "") {
      setInitialImage(widget.imagePath);
      setState(() {});
    }
    super.initState();
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
          visible: initialImage == "",
          replacement: Center(
            child: ImageBox(
              imagePath: initialImage,
              onTapdelete: () {
                widget.delete();
                setInitialImage("");
              },
            ),
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
          width: 400,
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
