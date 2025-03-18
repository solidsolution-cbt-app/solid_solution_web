import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:solidsolutionweb/components/custom_texts/custom_texts.dart';
import 'package:solidsolutionweb/core/base_view.dart';
import 'package:solidsolutionweb/core/route_service/route.gr.dart';
import 'package:solidsolutionweb/features/post_utme/view_model/post_utme_view_model.dart';

import 'package:solidsolutionweb/widgets/custom_back_button.dart';
import 'package:solidsolutionweb/widgets/question_grid_widget.dart';

@RoutePage()
class PostUtmeAddQuestionScreen extends HookWidget {
  const PostUtmeAddQuestionScreen({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return BaseView<PostUtmeViewModel>(
      builder: (context, model, child) {
        return Column(
          children: [
            Row(
              children: [
                const SizedBox(width: 20),
                CustomBackButton(
                  onTap: () {
                    context.pushRoute(
                      const PostUtmeQuestionsRoute(),
                    );
                  },
                ),
                const Spacer(),
                CustomTextHeader1(
                  text: model.selectedSubject,
                ),
                const SizedBox(width: 20),
                SvgPicture.asset("asset/svg/book-square outline.svg"),
                const SizedBox(width: 50),
              ],
            ),
            QuestionGridWidget(
              showLoader: model.loadUploadQuestion,
              school: model.selectedschool,
              subject: model.selectedSubject,
              showClear: true,
              shouldClear: true,
              onSubmit: (value) async {
                await model.uploadQuestion(
                  context: context,
                  value: value,
                );
              },
            ),
          ],
        );
      },
    );
  }
}
