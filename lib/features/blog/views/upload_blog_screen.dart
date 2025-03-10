import 'dart:typed_data';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:solidsolutionweb/components/app_text_fields/app_text_field.dart';
import 'package:solidsolutionweb/components/custom_buttons/app_button.dart';
import 'package:solidsolutionweb/components/custom_drop_down/custom_drop_down.dart';
import 'package:solidsolutionweb/components/custom_texts/custom_texts.dart';
import 'package:solidsolutionweb/constants/colors.dart';
import 'package:solidsolutionweb/features/blog/widget/blog_image_upload_widget.dart';

@RoutePage()
class UploadBlogScreen extends HookWidget {
  const UploadBlogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final selectedBlogType = useState<String?>(null);
    final List<String> blogOptions = ["Featured", "Articles", "Upcoming"];
    final imagePath = useState<Uint8List?>(null);
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
            dropdownMenuEntries: blogOptions
                .map(
                  (e) => DropdownMenuEntry(
                    label: e,
                    value: e,
                  ),
                )
                .toList(),
            onSelected: (value) {
              selectedBlogType.value = value;
            },
          ),
          const SizedBox(height: 30),
          const AppTextField(
            width: 600,
            hintText: "Enter the title ",
            fieldLabel: "Enter Blog Title",
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          ),
          const SizedBox(height: 30),
          const AppTextField(
            width: 600,
            maxLines: 5,
            hintText: "Enter sub text ",
            fieldLabel: "Enter Body Text",
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          ),
          const SizedBox(height: 40),
          AppButton(
            onTap: () {},
            buttonText: "Preview Blog Post",
          ),
          const SizedBox(height: 20),
          AppButton(
            isOutline: true,
            onTap: () {},
            buttonText: "Upload Blog Post",
          ),
          const SizedBox(height: 50),
        ],
      ),
    );
  }
}
