import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:solidsolutionweb/components/custom_texts/custom_texts.dart';
import 'package:solidsolutionweb/constants/colors.dart';
import 'package:solidsolutionweb/network_service/api_service.dart';
import 'package:solidsolutionweb/widgets/image_viewer.dart';

class BlogImageUpload extends HookWidget {
  const BlogImageUpload({
    required this.onSelectImage,
    required this.imagePath,
    super.key,
  });
  final String? imagePath;
  final Function(String? imagePath) onSelectImage;

  @override
  Widget build(BuildContext context) {
    final loadUploadImage = useState<bool>(false);
    return SizedBox(
      width: 600,
      height: 300,
      child: Stack(
        children: [
          if (!loadUploadImage.value)
            InkWell(
              onTap: () async {
                final result = await FilePicker.platform
                    .pickFiles(type: FileType.image, allowMultiple: false);
                if (result != null && result.files.isNotEmpty) {
                  final fileBytes = result.files.first.bytes;
                  final fileName = result.files.first.name;
                  loadUploadImage.value = true;
                  var imageUpload = await apiService.uploadImage(
                    imagePath: fileBytes!,
                    filename: fileName,
                  );
                  if (imageUpload.isSuccessful) {
                    ClaodinaryClassModel data =
                        imageUpload.model as ClaodinaryClassModel;
                    onSelectImage(data.fileLink);
                  }
                  loadUploadImage.value = false;
                }
              },
              child: Container(
                width: 600,
                height: 300,
                decoration: BoxDecoration(
                  color: AppColors.greyColor.withOpacity(.05),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: AppColors.violet.withOpacity(.3),
                  ),
                ),
                child: imagePath != null
                    ? ImageViewer(
                        urlImagePath: imagePath!,
                        width: 600,
                        height: 300,
                        boxFit: BoxFit.fitWidth,
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
          ],
          if (loadUploadImage.value) ...[
            const Center(
              child: CircularProgressIndicator(),
            ),
          ]
        ],
      ),
    );
  }
}
