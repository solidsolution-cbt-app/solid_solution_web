import 'package:easy_pdf_viewer/easy_pdf_viewer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class PdfViewerPage extends HookWidget {
  const PdfViewerPage({
    super.key,
    required this.pdfLink,
  });

  final String pdfLink;
  static const String routeName = "/pdfviewerpage";

  @override
  Widget build(BuildContext context) {
    final pdfDoc = useState<PDFDocument?>(null);
    useEffect(() {
      WidgetsFlutterBinding().addPostFrameCallback(
        (valur) async {
          pdfDoc.value = await PDFDocument.fromURL(pdfLink);
        },
      );
      return;
    });
    return Scaffold(
      appBar: AppBar(),
      body: pdfDoc.value == null
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : PDFViewer(
              document: pdfDoc.value!,
            ),
    );
  }
}
