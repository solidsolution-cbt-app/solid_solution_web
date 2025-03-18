import 'package:flutter/material.dart';
import 'package:solidsolutionweb/components/custom_texts/custom_texts.dart';
import 'package:solidsolutionweb/constants/colors.dart';

class SubjectButton extends StatelessWidget {
  const SubjectButton({
    required this.onTap,
    required this.selectedSubject,
    required this.subject,
    super.key,
  });
  final Function(String subject) onTap;
  final String selectedSubject;
  final String subject;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: Material(
        child: InkWell(
          onTap: () {
            onTap(subject);
          },
          child: Container(
            width: 320,
            decoration: BoxDecoration(
              color: selectedSubject != subject
                  ? Colors.transparent
                  : AppColors.violet.withOpacity(0.5),
              borderRadius: BorderRadius.circular(10),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Container(
              padding: const EdgeInsets.only(left: 50),
              child: Row(
                children: [
                  CustomTextBody1(
                    text: subject,
                    textColor: Colors.white,
                    fontSize: 15,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
