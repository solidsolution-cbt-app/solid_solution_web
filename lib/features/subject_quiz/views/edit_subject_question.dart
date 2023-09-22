import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:solidsolutionweb/components/custom_texts/custom_texts.dart';
import 'package:solidsolutionweb/core/base_view.dart';
import 'package:solidsolutionweb/features/base/view/base_screen.dart';
import 'package:solidsolutionweb/features/subject_quiz/view_model/subject_quiz_view_model.dart';

class EditQuizPreviewScreen extends StatefulWidget {
  const EditQuizPreviewScreen({
    super.key,
  });
  static const String routeName = "/edit_quiz_preview";

  @override
  State<EditQuizPreviewScreen> createState() => _EditQuizPreviewScreenState();
}

class _EditQuizPreviewScreenState extends State<EditQuizPreviewScreen> {
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
            ],
          ),
        ),
      );
    });
  }
}
