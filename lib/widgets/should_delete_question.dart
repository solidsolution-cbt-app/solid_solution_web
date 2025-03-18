import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:solidsolutionweb/components/custom_buttons/app_button.dart';
import 'package:solidsolutionweb/components/custom_texts/custom_texts.dart';

class ShouldDeleteQuestion extends HookWidget {
  const ShouldDeleteQuestion({
    required this.onDelete,
    super.key,
  });
  final Function() onDelete;
  @override
  Widget build(BuildContext context) {
    final loadDelete = useState(false);
    return Container(
      width: 600,
      height: 400,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CustomTextHeader1(
            text: "Delete Question?",
          ),
          const SizedBox(height: 10),
          const CustomTextBody1(
            text:
                "Are you sure you want to delete this question ?. This action is irreversible.",
          ),
          const SizedBox(height: 30),
          AppButton(
            buttonWidth: 300,
            showLoader: loadDelete.value,
            onTap: () async {
              loadDelete.value = true;
              await onDelete();
              loadDelete.value = false;
              if (context.mounted) {
                Navigator.pop(context);
              }
            },
            buttonText: "Delete",
          ),
          const SizedBox(height: 20),
          AppButton(
            buttonWidth: 300,
            isOutline: true,
            onTap: () {
              Navigator.pop(context);
            },
            buttonText: "Cancel",
          )
        ],
      ),
    );
  }
}
