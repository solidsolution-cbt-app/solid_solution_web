import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:solidsolutionweb/components/custom_texts/custom_texts.dart';
import 'package:solidsolutionweb/constants/colors.dart';
import 'package:solidsolutionweb/core/route_service/route.gr.dart';
import 'package:solidsolutionweb/features/blog/model/blog_model.dart';
import 'package:solidsolutionweb/widgets/custom_back_button.dart';
import 'package:solidsolutionweb/widgets/image_viewer.dart';

@RoutePage()
class PreviewBlogScreen extends StatelessWidget {
  const PreviewBlogScreen({
    this.blog,
    super.key,
  });
  final BlogModel? blog;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CustomBackButton(
                onTap: () {
                  context.replaceRoute(
                    UploadBlogRoute(
                      blog: blog,
                    ),
                  );
                },
              ),
              const Spacer(),
              const CustomTextHeader1(
                text: "Upload on Blog Page",
                fontSize: 20,
                fontWeight: FontWeight.w600,
                textColor: AppColors.dartArsh,
              ),
              const Spacer(),
            ],
          ),
          const SizedBox(height: 30),
          ImageViewer(
            urlImagePath: blog?.imagePath ?? "",
            width: size.width,
            boxFit: BoxFit.cover,
            borderRadius: BorderRadius.circular(15),
            height: 600,
          ),
          const SizedBox(height: 10),
          CustomTextHeader1(
            text: blog?.category ?? "",
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
          const SizedBox(height: 10),
          CustomTextHeader1(
            text: blog?.title ?? "",
          ),
          const SizedBox(height: 10),
          CustomTextBody1(
            text: blog?.body ?? "",
            textAlign: TextAlign.justify,
          )
        ],
      ),
    );
  }
}
