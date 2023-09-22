import 'package:flutter/material.dart';
import 'package:solidsolutionweb/components/app_text_fields/app_text_field.dart';
import 'package:solidsolutionweb/components/custom_buttons/app_button.dart';
import 'package:solidsolutionweb/components/custom_texts/custom_texts.dart';
import 'package:solidsolutionweb/components/dialogs/dialog_service.dart';
import 'package:solidsolutionweb/constants/colors.dart';
import 'package:solidsolutionweb/core/base_view.dart';
import 'package:solidsolutionweb/features/topic_quiz/view_model/topic_view_model.dart';

class AddTopicDialog extends StatelessWidget {
  const AddTopicDialog({
    required this.subject,
    super.key,
  });
  final String subject;
  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.only(left: 300),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: BaseView<TopicQuizVeiwModel>(builder: (context, model, child) {
        return Container(
          height: 500,
          width: 600,
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
          ),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.close,
                      size: 30,
                    ),
                  )
                ],
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 40,
                  vertical: 30,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CustomTextHeader1(
                      text: "Enter Topic Name",
                      textColor: AppColors.dartArsh,
                      fontSize: 28,
                      fontWeight: FontWeight.w500,
                    ),
                    const SizedBox(height: 20),
                    AppTextField2(
                      controller: model.topicController,
                      hintText: "Enter the topic",
                      maxLines: 3,
                    ),
                    const SizedBox(height: 40),
                    AppButton(
                      buttonWidth: 600,
                      onTap: () {
                        if (model.topicController.text.isNotEmpty) {
                          model.addTopic(
                              subject: subject,
                              topic: model.topicController.text);
                          DialogService().hideLoaderDialog();
                          model.topicController.clear();
                        }
                      },
                      buttonText: "Add Topic",
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      }),
    );
  }
}
