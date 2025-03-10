import 'package:flutter/material.dart';
import 'package:solidsolutionweb/features/pdf_viewer_page.dart/pdf_viewer_page.dart';

class PreviewPdfDialog extends StatelessWidget {
  const PreviewPdfDialog({
    required this.pdfLink,
    super.key,
  });
  final String pdfLink;
  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    return Dialog(
      insetPadding: const EdgeInsets.only(left: 300),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: PdfViewerPage(pdfLink: pdfLink),
    );
  }
}
