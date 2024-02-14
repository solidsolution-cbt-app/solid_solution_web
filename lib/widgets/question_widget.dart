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
  clearController() {
    question = "";
    option1 = "";
    option2 = "";
    option3 = "";
    option4 = "";
    option1Image = "";
    option2Image = "";
    option3Image = "";
    option4Image = "";
    questionImage = "";
    solutionpdf = "";
    solutionImage = "";
    solutionText = "";
    setState(() {});
  }

  String option1Image = "";
  String option2Image = "";
  String option3Image = "";
  String option4Image = "";
  String questionImage = "";
  String solutionpdf = "";
  String solutionText = "";
  String solutionImage = "";
  String question = "";
  String option1 = "";
  String option2 = "";
  String option3 = "";
  String option4 = "";

  setQuestion(String text) {
    question = text;
  }

  setOption1(String text) {
    option1 = text;
  }

  setOption2(String text) {
    option2 = text;
  }

  setOption3(String text) {
    option3 = text;
  }

  setOption4(String text) {
    option4 = text;
  }

  setSolutionText(String text) {
    solutionText = text;
  }

  String? year;

  QuestionModel getQuestion() {
    QuestionModel newQuestion = QuestionModel.tojson(
      text: question,
      image: questionImage,
      year: year,
      solutionpdf: solutionpdf,
      solutionImage: solutionImage,
      solutionText: solutionText,
      option1: OptionModel.tojson(
        text: option1,
        isCorrect: true,
        image: option1Image,
      ),
      option2: OptionModel.tojson(
        text: option2,
        image: option2Image,
      ),
      option3: OptionModel.tojson(
        text: option3,
        image: option3Image,
      ),
      option4: OptionModel.tojson(
        text: option4,
        image: option4Image,
      ),
    );
    return newQuestion;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        QuestionCard(
          setQuestion: (text) {
            question = text;
            setState(() {});
          },
          isOption: false,
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
          setQuestion: (text) {
            option1 = text;
            setState(() {});
          },
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
          setQuestion: (text) {
            option2 = text;
            setState(() {});
          },
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
          setQuestion: (text) {
            option3 = text;
            setState(() {});
          },
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
          setQuestion: (text) {
            option4 = text;
            setState(() {});
          },
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
        const SizedBox(height: 30),
        QuestionCard(
          setQuestion: (text) {
            solutionText = text;
            setState(() {});
          },
          title: "Solution",
          isOption: false,
          imagePath: solutionImage,
          delete: () {
            solutionImage = "";
            setState(() {});
          },
          setImageUrl: (value) {
            questionImage = value;
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
        const SizedBox(height: 500),
      ],
    );
  }
}

class QuestionCard extends StatefulWidget {
  const QuestionCard({
    this.title = "Enter Question",
    required this.imagePath,
    this.isOption = true,
    required this.setImageUrl,
    required this.delete,
    this.isCorrectOption = false,
    required this.setQuestion,
    super.key,
  });

  final Function(String text) setQuestion;
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
              child: MathInputField(
                hintText: "Type...",
                onChange: widget.setQuestion,
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
                  width: 250,
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
