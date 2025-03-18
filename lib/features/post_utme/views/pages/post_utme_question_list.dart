import 'package:auto_route/auto_route.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:solidsolutionweb/constants/app_strings.dart';
import 'package:solidsolutionweb/core/base_view.dart';
import 'package:solidsolutionweb/core/route_service/route.gr.dart';
import 'package:solidsolutionweb/features/post_utme/view_model/post_utme_view_model.dart';
import 'package:solidsolutionweb/widgets/add_question_card.dart';
import 'package:solidsolutionweb/widgets/question_diaplay_card.dart';

@RoutePage()
class PostUtmeQuestionList extends StatelessWidget {
  const PostUtmeQuestionList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BaseView<PostUtmeViewModel>(onModelReady: (model) async {
      await Future.delayed(const Duration(seconds: 1)).then((value) {
        // model.getPostUtmeSchoolSubjectQuestion();
      });
    }, builder: (context, model, child) {
      return model.loadGetSchoolSubjectQuestion
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
              child: Wrap(
                spacing: 50,
                runSpacing: 50,
                alignment: WrapAlignment.start,
                runAlignment: WrapAlignment.center,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  AddQuestionCard(
                    onTap: () {
                      context.router.navigate(
                        const PostUtmeAddQuestionRoute(),
                      );
                    },
                  ),
                  ...model
                      .getSchoolSubjectQuestions(
                          model.selectedschool, model.selectedSubject)
                      .mapIndexed(
                        (index, e) => QuestionDiaplaySummaryCard(
                          questionNumber: index + 1,
                          question: e,
                          onSelect: (value) {
                            if (value == AppString.editQuestion) {
                              model.setQuestionToView(e);
                              context.router.navigate(
                                const PostUtmeEditQuestionRoute(),
                              );
                            }
                          },
                        ),
                      ),
                ],
              ),
            );
    });
  }
}
