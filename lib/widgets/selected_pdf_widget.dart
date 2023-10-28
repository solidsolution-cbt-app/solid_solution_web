import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:solidsolutionweb/components/custom_buttons/app_button.dart';
import 'package:solidsolutionweb/components/custom_buttons/app_text_button.dart';
import 'package:solidsolutionweb/components/custom_texts/custom_texts.dart';
import 'package:solidsolutionweb/constants/colors.dart';
import 'package:solidsolutionweb/core/locator.dart';
import 'package:solidsolutionweb/features/pdf_viewer_page.dart/pdf_viewer_page.dart';
import 'package:solidsolutionweb/models/exception_model_calss/local_errors.dart.dart';
import 'package:solidsolutionweb/network_service/api_service.dart';

class SelectPdfWidget extends StatefulWidget {
  const SelectPdfWidget({
    required this.setSolutionPdf,
    required this.prfLink,
    this.showRemove = true,
    super.key,
  });

  final Function(String value) setSolutionPdf;
  final String prfLink;
  final bool showRemove;

  @override
  State<SelectPdfWidget> createState() => _SelectPdfWidgetState();
}

class _SelectPdfWidgetState extends State<SelectPdfWidget> {
  bool showLoader = false;
  toggleshowLoader(bool value) {
    showLoader = value;
    setState(() {});
  }

  void uploadFile() async {
    // final result = await FilePicker.platform.pickFiles(
    //   type: FileType.custom,
    //   allowMultiple: false,
    //   allowedExtensions: ['pdf'],
    // );

    // if (result != null && result.files.isNotEmpty) {
    //   toggleshowLoader(true);
    try {
      // final fileBytes = result.files.first.bytes;
      // final fileName = result.files.first.name;
      // LocalExceptionModel filePath = await apiService.uploadPdf(
      //   imagePath: fileBytes!,
      //   filename: fileName,
      // );

      String pdflink =
          "https://res.cloudinary.com/dn4d52sd1/image/upload/v1698532197/relocation_Letter.pdf1698532190292.pdf"; //filePath.model as String;

      widget.setSolutionPdf(pdflink);
    } catch (e) {
      //
      // }

      toggleshowLoader(false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: widget.prfLink == "",
      replacement: Column(
        children: [
          CustomTextBody1(
            text: extractPdfFilename(widget.prfLink),
            fontSize: 14,
          ),
          const SizedBox(height: 20),
          AppButton(
            buttonWidth: 130,
            onTap: () {
              navigator.push(
                routeName: PdfViewerPage.routeName,
                argument: widget.prfLink,
              );
            },
            buttonText: "Open pdf",
          ),
          const SizedBox(height: 10),
          Visibility(
            visible: widget.showRemove,
            child: AppTextButton(
              onTap: () {
                widget.setSolutionPdf("");
              },
              buttontext: "remove",
            ),
          ),
          const SizedBox(height: 80),
        ],
      ),
      child: Visibility(
        visible: !showLoader,
        replacement: const SizedBox(
          width: 70,
          height: 70,
          child: Center(
            child: CircularProgressIndicator(
              backgroundColor: AppColors.violet,
            ),
          ),
        ),
        child: Column(
          children: [
            const CustomTextBody1(
              text: "Upload Solution File (format: pdf)",
              fontSize: 14,
            ),
            const SizedBox(height: 20),
            AppButton(
              buttonWidth: 130,
              onTap: () {
                uploadFile();
              },
              buttonText: "choose File",
            ),
            const SizedBox(height: 80),
          ],
        ),
      ),
    );
  }
}

String extractPdfFilename(String pdfUrl) {
  Uri uri = Uri.parse(pdfUrl);
  String path = uri.path;
  List<String> segments = path.split('/');
  String filename = segments.last;

  if (filename.contains('?')) {
    filename = filename.split('?').first;
  }

  return filename;
}
