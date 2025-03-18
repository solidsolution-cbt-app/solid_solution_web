import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:solidsolutionweb/components/custom_texts/custom_texts.dart';
import 'package:solidsolutionweb/constants/colors.dart';
import 'package:solidsolutionweb/core/base_view.dart';
import 'package:solidsolutionweb/core/route_service/route.gr.dart';
import 'package:solidsolutionweb/features/post_utme/view_model/post_utme_view_model.dart';
import 'package:solidsolutionweb/widgets/dash_board_side_nav.dart';

@RoutePage()
class PostUtmeDashBoard extends HookWidget {
  const PostUtmeDashBoard(
      {@PathParam('school') required this.school, super.key});
  final String school;
  @override
  Widget build(BuildContext context) {
    return BaseView<PostUtmeViewModel>(onModelReady: (model) {
      model.getSchoolSubjects(school: school);
    }, builder: (context, model, child) {
      return model.loadGetSubjects
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : AutoTabsRouter(
              routes: const [
                PostUtmeQuestionList(),
                PostUtmeAddQuestionRoute(),
                PostUtmeEditQuestionRoute(),
                PostUtmeQuestionViewRoute()
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
                              model.getPostUtmeSchoolSubjectQuestion(
                                school: school,
                                subject: value,
                              );
                            },
                            subjects: model.getSubjects(school),
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
    });
  }
}
