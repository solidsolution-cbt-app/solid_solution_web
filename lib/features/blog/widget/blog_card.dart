import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:solidsolutionweb/components/custom_buttons/more_action_button.dart';
import 'package:solidsolutionweb/components/custom_texts/custom_texts.dart';
import 'package:solidsolutionweb/components/dialogs/dialog_service.dart';
import 'package:solidsolutionweb/constants/app_strings.dart';
import 'package:solidsolutionweb/core/route_service/route.gr.dart';
import 'package:solidsolutionweb/features/blog/model/blog_model.dart';
import 'package:solidsolutionweb/features/blog/widget/should_delete_blog_post_widget.dart';
import 'package:solidsolutionweb/widgets/image_viewer.dart';

class BlogCard extends StatelessWidget {
  const BlogCard({
    required this.blog,
    super.key,
  });
  final BlogModel blog;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      height: 300,
      decoration: BoxDecoration(
        color: const Color(0xff1F1F1F),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ImageViewer(
                width: 400,
                height: 150,
                urlImagePath: blog.imagePath ?? "",
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
                boxFit: BoxFit.cover,
              ),
              Positioned(
                right: 10,
                top: 10,
                child: MoreActionButton(
                  actions: [
                    MoreActionItem(
                      value: AppString.editBlogPost,
                      icon: SvgPicture.asset(
                        "asset/svg/edit_pencil.svg",
                      ),
                      label: AppString.editBlogPost,
                    ),
                    MoreActionItem(
                      value: AppString.deleteBlogPost,
                      icon: SvgPicture.asset(
                        "asset/svg/basket.svg",
                      ),
                      label: AppString.deleteBlogPost,
                    ),
                  ],
                  onSelectAction: (value) {
                    if (value == AppString.editBlogPost) {
                      
                      context.router.navigate(
                        UploadBlogRoute(
                          blog: blog,
                        ),
                      );
                    }
                    if (value == AppString.deleteBlogPost) {
                      dialogService.showCustomDialog(
                        context,
                        dialogWidget: ShouldDeleteBlogPost(
                          blogId: blog.id ?? "",
                        ),
                      );
                    }
                  },
                ),
              )
            ],
          ),
          Container(
            height: 150,
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTextBody1(
                  text: blog.title ?? "",
                  textColor: Colors.white,
                  maxLines: 2,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  textAlign: TextAlign.start,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 10),
                CustomTextBody1(
                  text: blog.body ?? "",
                  textColor: Colors.white,
                  maxLines: 3,
                  fontSize: 14,
                  textAlign: TextAlign.start,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
