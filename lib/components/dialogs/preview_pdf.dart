import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

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
      child: Scaffold(
        body: SfPdfViewer.network(
          pdfLink,
          canShowPaginationDialog: true,
          canShowScrollHead: true,
          canShowScrollStatus: true,
        ),
      ),
    );
  }
}
