import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:solidsolutionweb/components/custom_buttons/app_button.dart';
import 'package:solidsolutionweb/components/custom_texts/custom_texts.dart';
import 'package:solidsolutionweb/core/base_view.dart';
import 'package:solidsolutionweb/features/blog/view_models/blog_view_model.dart';

class ShouldDeleteBlogPost extends HookWidget {
  const ShouldDeleteBlogPost({
    required this.blogId,
    super.key,
  });
  final String blogId;
  @override
  Widget build(BuildContext context) {
    final loadDelete = useState(false);
    return BaseView<BlogViewModel>(
      builder: (context, model, child) {
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
                text: "Delete Blog Post?",
              ),
              const SizedBox(height: 10),
              const CustomTextBody1(
                text:
                    "Are you sure you want to delete this blog post ?. This action is irreversible.",
              ),
              const SizedBox(height: 30),
              AppButton(
                buttonWidth: 300,
                showLoader: loadDelete.value,
                onTap: () async {
                  loadDelete.value = true;
                  bool isBlogPostDeleted =
                      await model.deleteBlogPost(blogId: blogId);
                  if (isBlogPostDeleted && context.mounted) {
                    Navigator.pop(context);
                  }
                  loadDelete.value = false;
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
      },
    );
  }
}
