import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:solidsolutionweb/components/custom_texts/custom_texts.dart';
import 'package:solidsolutionweb/constants/colors.dart';
import 'package:solidsolutionweb/core/base_view.dart';
import 'package:solidsolutionweb/core/locator.dart';
import 'package:solidsolutionweb/features/base/view_model/base_screen_view_model.dart';
import 'package:solidsolutionweb/features/dashboard/view/dash_board.dart';

class BaseScreen extends StatelessWidget {
  const BaseScreen({
    required this.child,
    this.onTap,
    this.isDashBoard = false,
    this.allowSubjectChange = true,
    super.key,
  });

  final Widget child;
  final Function()? onTap;
  final bool isDashBoard;
  final bool allowSubjectChange;

  static const String routeName = "/base_ui";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(color: Colors.white, boxShadow: [
              BoxShadow(
                offset: const Offset(0, 5),
                spreadRadius: 1,
                blurRadius: 5,
                color: AppColors.dartArsh.withOpacity(0.2),
              )
            ]),
            child: Row(
              children: [
                SizedBox(
                  width: 280,
                  height: 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Material(
                          child: InkWell(
                              onTap: () {
                                if (!isDashBoard) {
                                  navigator.pushAndRemoveUntil(
                                    routeName: DashBoard.routeName,
                                  );
                                }
                              },
                              child: Image.asset("asset/images/app_logo.png"))),
                      const SizedBox(width: 20),
                      const CustomTextBody1(
                        text: "Solidsolution",
                      )
                    ],
                  ),
                ),
                const Spacer(),
              ],
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppSideNav(
                  isDashBoard: isDashBoard,
                  allowSubjectChange: allowSubjectChange,
                  onTapsubject: onTap ?? () {},
                ),
                Expanded(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: child,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class AppSideNav extends StatelessWidget {
  const AppSideNav({
    required this.onTapsubject,
    required this.isDashBoard,
    required this.allowSubjectChange,
    super.key,
  });
  final Function() onTapsubject;
  final bool isDashBoard;
  final bool allowSubjectChange;

  @override
  Widget build(BuildContext context) {
    return BaseView<BaseScreenViewModel>(builder: (context, model, child) {
      return Container(
        width: 320,
        color: AppColors.primaryColor.withOpacity(0.8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 50,
              child: Visibility(
                visible: !isDashBoard,
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
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
                    text: model.selectedText,
                    fontSize: 14,
                    textColor: AppColors.primaryColor,
                    fontWeight: FontWeight.w600,
                  )
                ],
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  ...model.subjects
                      .map(
                        (e) => SubjectButton(
                          onTap: (value) {
                            if (allowSubjectChange) {
                              model.setSelectedText(value);
                              onTapsubject();
                            }
                          },
                          subject: e,
                          selectedSubject: model.selectedText,
                        ),
                      )
                      .toList(),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}

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
                  : AppColors.violet.withOpacity(0.2),
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
