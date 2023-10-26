import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:solidsolutionweb/components/custom_texts/custom_texts.dart';
import 'package:solidsolutionweb/core/base_view.dart';
import 'package:solidsolutionweb/features/base/view/base_screen.dart';
import 'package:solidsolutionweb/features/topic_quiz/view_model/topic_view_model.dart';
import 'package:solidsolutionweb/models/topic_quiz_model.dart';
import 'package:solidsolutionweb/widgets/app_progress_indicator.dart';
import 'package:solidsolutionweb/widgets/question_widget.dart';

class AddTopicQuizScreen extends StatefulWidget {
  const AddTopicQuizScreen({
    this.topic,
    super.key,
  });
  static const String routeName = "/add_topic_quiz_screen";
  final TopicModel? topic;

  @override
  State<AddTopicQuizScreen> createState() => _AddTopicQuizScreenState();
}

class _AddTopicQuizScreenState extends State<AddTopicQuizScreen> {
  @override
  Widget build(BuildContext context) {
    return BaseView<TopicQuizVeiwModel>(
      builder: (context, model, child) {
        return Stack(
          children: [
            BaseScreen(
              allowSubjectChange: false,
              onTap: () {
                setState(() {});
              },
              child: Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 30),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset("asset/svg/book-square outline.svg"),
                          const SizedBox(width: 15),
                          CustomTextHeader1(
                            text: widget.topic?.topic ?? "",
                            fontWeight: FontWeight.w500,
                          ),
                          const Spacer(),
                        ],
                      ),
                      const SizedBox(height: 50),
                      QuestionWidget(
                        onSubmitQuestion: (value) async {
                          await model.uploadQuestion(
                            jsonData: value.dataSent!,
                            topic: widget.topic!,
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
            AppProgressIndicator(
              showLoader: model.loadAddQuestion,
            )
          ],
        );
      },
    );
  }
}
