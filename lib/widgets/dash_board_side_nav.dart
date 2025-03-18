import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:solidsolutionweb/components/custom_texts/custom_texts.dart';
import 'package:solidsolutionweb/constants/colors.dart';
import 'package:solidsolutionweb/widgets/subject_button.dart';

class DashBoardSideNav extends StatelessWidget {
  const DashBoardSideNav({
    required this.subjects,
    required this.onSelectSubject,
    required this.selectedSubject,
    super.key,
  });
  final List<String> subjects;
  final Function(String subject) onSelectSubject;
  final String selectedSubject;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: 290,
      height: size.height,
      color: AppColors.primaryColor.withOpacity(.7),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 10),
            width: 320,
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            child: Row(
              children: [
                SvgPicture.asset("asset/svg/book-square.svg"),
                const SizedBox(width: 10),
                CustomTextBody1(
                  text: selectedSubject,
                  fontSize: 14,
                  textColor: AppColors.primaryColor,
                  fontWeight: FontWeight.w600,
                )
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ...subjects.map(
                    (e) => SubjectButton(
                      onTap: onSelectSubject,
                      selectedSubject: selectedSubject,
                      subject: e,
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
