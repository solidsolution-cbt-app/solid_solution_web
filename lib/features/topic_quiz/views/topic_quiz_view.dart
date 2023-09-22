import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:solidsolutionweb/components/custom_buttons/app_button.dart';
import 'package:solidsolutionweb/components/custom_texts/custom_texts.dart';
import 'package:solidsolutionweb/components/dialogs/dialog_service.dart';
import 'package:solidsolutionweb/constants/colors.dart';
import 'package:solidsolutionweb/core/base_view.dart';
import 'package:solidsolutionweb/core/locator.dart';
import 'package:solidsolutionweb/features/base/view/base_screen.dart';
import 'package:solidsolutionweb/features/base/view_model/base_screen_view_model.dart';
import 'package:solidsolutionweb/features/topic_quiz/view_model/topic_view_model.dart';
import 'package:solidsolutionweb/features/topic_quiz/views/topic_quiz_preview_screen.dart';

class TopicQuizScreen extends StatefulWidget {
  const TopicQuizScreen({super.key});

  static const String routeName = "/topic_quiz";

  @override
  State<TopicQuizScreen> createState() => _TopicQuizScreenState();
}

class _TopicQuizScreenState extends State<TopicQuizScreen> {
  @override
  Widget build(BuildContext context) {
    return BaseView<TopicQuizVeiwModel>(builder: (context, model, child) {
      return BaseScreen(
        onTap: () {
          setState(() {});
        },
        child: Visibility(
          visible: model
              .getTopics(subject: locatorX<BaseScreenViewModel>().selectedText)
              .isNotEmpty,
          replacement: const TopicScreenEmptyWidget(),
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 80, vertical: 30),
            child: Column(
              children: [
                Row(
                  children: [
                    SvgPicture.asset("asset/svg/book-square outline.svg"),
                    const SizedBox(width: 15),
                    const CustomTextHeader1(
                      text: "Topic Quiz",
                      fontWeight: FontWeight.w500,
                    ),
                    const Spacer(),
                    AppButton(
                      buttonText: "Add Topic",
                      buttonWidth: 200,
                      onTap: () {
                        DialogService().addTopicDialog(
                          subject: locatorX<BaseScreenViewModel>().selectedText,
                        );
                      },
                    )
                  ],
                ),
                const SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CustomTextBody1(
                      text:
                          "${model.getTopics(subject: locatorX<BaseScreenViewModel>().selectedText).length} Quiz",
                    ),
                  ],
                ),
                ...model
                    .getTopics(
                        subject: locatorX<BaseScreenViewModel>().selectedText)
                    .map(
                      (e) => QuizTopicCard(topic: e.topic),
                    )
              ],
            ),
          ),
        ),
      );
    });
  }
}

class QuizTopicCard extends StatelessWidget {
  const QuizTopicCard({
    required this.topic,
    super.key,
  });
  final String topic;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: () {
          navigator.push(
            routeName: TopicQuizPreviewScreen.routeName,
            argument: topic,
          );
        },
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 10),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: AppColors.primaryColor,
                width: 2,
              )),
          child: Row(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.5,
                child: CustomTextBody1(
                  text: topic,
                  textAlign: TextAlign.left,
                ),
              ),
              const Spacer(),
              const Icon(
                Icons.chevron_right,
                size: 30,
                color: AppColors.primaryColor,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class TopicScreenEmptyWidget extends StatelessWidget {
  const TopicScreenEmptyWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(height: 30),
        SizedBox(
          child: Image.asset("asset/images/empty_widget.png"),
        ),
        const SizedBox(height: 30),
        const CustomTextBody1(
          text: "No Topic Created Yet",
          fontSize: 32,
        ),
        const SizedBox(height: 15),
        const CustomTextBody1(
          text: "Click the button below to add a Topic.",
          fontSize: 24,
        ),
        const SizedBox(height: 30),
        AppButton(
          onTap: () {
            DialogService().addTopicDialog(
              subject: locatorX<BaseScreenViewModel>().selectedText,
            );
          },
          buttonText: "Add Topic",
        ),
        const SizedBox(height: 30),
      ],
    );
  }
}
