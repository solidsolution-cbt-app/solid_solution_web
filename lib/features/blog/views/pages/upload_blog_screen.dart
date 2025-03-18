import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:solidsolutionweb/components/app_text_fields/app_text_field.dart';
import 'package:solidsolutionweb/components/custom_buttons/app_button.dart';
import 'package:solidsolutionweb/components/custom_drop_down/custom_drop_down.dart';
import 'package:solidsolutionweb/components/custom_texts/custom_texts.dart';
import 'package:solidsolutionweb/constants/colors.dart';
import 'package:solidsolutionweb/core/base_view.dart';
import 'package:solidsolutionweb/core/route_service/route.gr.dart';
import 'package:solidsolutionweb/features/blog/model/blog_model.dart';
import 'package:solidsolutionweb/features/blog/view_models/blog_view_model.dart';
import 'package:solidsolutionweb/features/blog/widget/blog_image_upload_widget.dart';

@RoutePage()
class UploadBlogScreen extends HookWidget {
  const UploadBlogScreen({
    this.blog,
    super.key,
  });
  final BlogModel? blog;

  @override
  Widget build(BuildContext context) {
    final selectedBlogType = useState<String?>(blog?.category);
    final List<String> blogOptions = ["Featured", "Article", "Upcoming"];
    final imagePath = useState<String?>(blog?.imagePath);
    final blogTitle = useTextEditingController(text: blog?.title ?? "");
    final blogBody = useTextEditingController(text: blog?.body ?? "");
    final loadUpload = useState<bool>(false);

    useEffect(
      () {
        WidgetsBinding.instance.addPostFrameCallback(
          (value) async {
            selectedBlogType.value = blog?.category;
            imagePath.value = blog?.imagePath;
            blogBody.text = blog?.body ?? "";
            blogTitle.text = blog?.title ?? "";
          },
        );
        return;
      },
      [],
    );
    return BaseView<BlogViewModel>(builder: (context, model, child) {
      return SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 30),
            const CustomTextHeader1(
              text: "Upload on Blog Page",
              fontSize: 20,
              fontWeight: FontWeight.w600,
              textColor: AppColors.dartArsh,
            ),
            const SizedBox(height: 30),
            BlogImageUpload(
              imagePath: imagePath.value,
              onSelectImage: (value) {
                imagePath.value = value;
              },
            ),
            const SizedBox(height: 30),
            CustomDropdown(
              width: 600,
              title: "Select Blog Category",
              initialValue: selectedBlogType.value,
              dropdownMenuEntries: blogOptions
                  .map(
                    (e) => DropdownMenuEntry(
                      label: e,
                      value: e,
                    ),
                  )
                  .toList(),
              onSelected: (value) {
                String selectedValue = value.toString().toLowerCase();
                selectedBlogType.value = selectedValue;
              },
            ),
            const SizedBox(height: 30),
            AppTextField(
              width: 600,
              hintText: "Enter the title ",
              fieldLabel: "Enter Blog Title",
              controller: blogTitle,
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            ),
            const SizedBox(height: 30),
            AppTextField(
              width: 600,
              maxLines: 5,
              hintText: "Enter sub text ",
              fieldLabel: "Enter Body Text",
              controller: blogBody,
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            ),
            const SizedBox(height: 40),
            AppButton(
              onTap: () {
                context.pushRoute(
                  PreviewBlogRoute(
                    blog: BlogModel(
                      title: blogTitle.text,
                      body: blogBody.text,
                      imagePath: imagePath.value,
                      category: selectedBlogType.value,
                    ),
                  ),
                );
              },
              buttonText: "Preview Blog Post",
            ),
            const SizedBox(height: 20),
            AppButton(
              isOutline: true,
              showLoader: loadUpload.value,
              onTap: () async {
                if (imagePath.value != null &&
                    blogBody.text.isNotEmpty &&
                    blogTitle.text.isNotEmpty &&
                    selectedBlogType.value != null) {
                  loadUpload.value = true;

                  bool isBlogUploaded = blog?.id != null
                      ? await model.updateBlog(
                          blogId: blog?.id ?? "",
                          request: BlogModel(
                            title: blogTitle.text,
                            body: blogBody.text,
                            category: selectedBlogType.value,
                            imagePath: imagePath.value,
                          ),
                        )
                      : await model.uploadBlog(
                          request: BlogModel(
                            title: blogTitle.text,
                            body: blogBody.text,
                            category: selectedBlogType.value,
                            imagePath: imagePath.value,
                          ),
                        );
                  loadUpload.value = false;
                  if (isBlogUploaded) {
                    if (context.mounted) {
                      context.router.navigate(
                        const BlogRoute(),
                      );
                    }
                  }
                }
              },
              buttonText: "Upload Blog Post",
            ),
            const SizedBox(height: 50),
          ],
        ),
      );
    });
  }
}
