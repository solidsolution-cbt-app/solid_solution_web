import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:solidsolutionweb/components/custom_texts/custom_texts.dart';
import 'package:solidsolutionweb/constants/colors.dart';

class BlogImageUpload extends StatelessWidget {
  const BlogImageUpload({
    required this.onSelectImage,
    required this.imagePath,
    super.key,
  });
  final Uint8List? imagePath;
  final Function(Uint8List? imagePath) onSelectImage;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 500,
      height: 300,
      child: Stack(
        children: [
          InkWell(
            onTap: () async {
              final result = await FilePicker.platform
                  .pickFiles(type: FileType.image, allowMultiple: false);
              if (result != null && result.files.isNotEmpty) {
                final fileBytes = result.files.first.bytes;
                // final fileName = result.files.first.name;
                onSelectImage(fileBytes);
              }
            },
            child: Container(
              width: 500,
              height: 300,
              decoration: BoxDecoration(
                color: AppColors.greyColor.withOpacity(.05),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: AppColors.violet.withOpacity(.3),
                ),
              ),
              child: imagePath != null
                  ? Image.memory(
                      width: 500,
                      height: 300,
                      imagePath!,
                      fit: BoxFit.fitWidth,
                    )
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          "asset/svg/camera.svg",
                        ),
                        const SizedBox(height: 20),
                        const CustomTextBody1(
                          text: "Click to upload image here",
                          fontWeight: FontWeight.w600,
                          textColor: AppColors.greyColor,
                        ),
                        const SizedBox(height: 20),
                        const CustomTextBody1(
                          text: "Maximum size: 5MB",
                          fontWeight: FontWeight.w400,
                        ),
                      ],
                    ),
            ),
          ),
          if (imagePath != null) ...[
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                onPressed: () {
                  onSelectImage(null);
                },
                icon: const Icon(Icons.delete),
                color: Colors.red,
              ),
            ),
          ]
        ],
      ),
    );
  }
}
