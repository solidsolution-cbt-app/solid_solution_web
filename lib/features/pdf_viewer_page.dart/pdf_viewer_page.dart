import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PdfViewerPage extends StatelessWidget {
  const PdfViewerPage({
    super.key,
    required this.pdfLink,
  });

  final String pdfLink;
  static const String routeName = "/pdfviewerpage";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SfPdfViewer.network(
        pdfLink,
        initialZoomLevel: 2,
      ),
    );
  }
}
