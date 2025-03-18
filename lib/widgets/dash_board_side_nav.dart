import 'package:flutter/material.dart';
import 'package:solidsolutionweb/constants/colors.dart';

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
      child: const SingleChildScrollView(
        child: Column(),
      ),
    );
  }
}
