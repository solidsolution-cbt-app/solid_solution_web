import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:solidsolutionweb/components/custom_texts/custom_texts.dart';
import 'package:solidsolutionweb/constants/colors.dart';
import 'package:solidsolutionweb/constants/subjects.dart';
import 'package:solidsolutionweb/core/base_view.dart';
import 'package:solidsolutionweb/core/route_service/route.gr.dart';
import 'package:solidsolutionweb/features/utme/pages/exam/view_model/exam_view_model.dart';
import 'package:solidsolutionweb/widgets/dash_board_side_nav.dart';

@RoutePage()
class ExamDashBoard extends HookWidget {
  const ExamDashBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<ExamViewModel>(
      onModelReady: (model) {
        model.getExamQuestionFromApi(
          subject: model.selectedSubject,
          pageNumber: "0",
        );
      },
      builder: (context, model, child) {
        return AutoTabsRouter(
          routes: const [
            ExamQuestionRoute(),
            AddExamQuestionRoute(),
            EditExamQuestionRoute(),
            DisplayExamQuestionRoute()
          ],
          builder: (context, child) {
            return Scaffold(
              backgroundColor: Colors.white,
              body: Column(
                children: [
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      const SizedBox(width: 50),
                      Image.asset(
                        width: 47,
                        height: 53,
                        "asset/images/app_logo.png",
                      ),
                      const SizedBox(width: 20),
                      const CustomTextHeader1(
                        text: "Solid Solutions",
                        fontSize: 25,
                        textColor: AppColors.greyColor,
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Divider(
                    color: AppColors.grey400Color.withOpacity(.1),
                    thickness: 5,
                  ),
                  Expanded(
                      child: Row(
                    children: [
                      DashBoardSideNav(
                        selectedSubject: model.selectedSubject,
                        onSelectSubject: (value) {
                          model.setSelectedSubject(value);
                          model.getExamQuestionFromApi(
                            subject: value,
                            pageNumber: "0",
                          );
                        },
                        subjects: subjects,
                      ),
                      Expanded(
                        child: child,
                      ),
                    ],
                  )),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
