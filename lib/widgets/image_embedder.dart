import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:solidsolutionweb/widgets/image_viewer.dart';

class CustomImageEmbedBuilder implements EmbedBuilder {
  @override
  String get key => 'image'; // Define the embed key for image embeds

  @override
  Widget build(BuildContext context, QuillController controller, Embed embed,
      bool readOnly, bool isInEditor, TextStyle textStyle) {
// Parse the embed data (source, width, and height)
    final String embedData = embed.value.data;
    final List<String> parts = embedData.split('|');
    final String imageUrl = parts[0];
    final double imageWidth =
        parts.length > 1 ? double.tryParse(parts[1]) ?? 200.0 : 200.0;
    final double imageHeight =
        parts.length > 2 ? double.tryParse(parts[2]) ?? 200.0 : 200.0;

    return ImageViewer(
      width: imageWidth,
      height: imageHeight,
      urlImagePath: imageUrl,
    );
  }

  // Corrected method that directly takes a Widget and returns a WidgetSpan
  @override
  WidgetSpan buildWidgetSpan(Widget widget) {
    return WidgetSpan(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: widget, // Widget passed from the `build` method
      ),
    );
  }

  // Return the plain text version of the embed (optional)
  @override
  String toPlainText(Embed embed) {
    return '[Image]'; // You can define what plain text represents the image
  }

  // The expanded getter defines whether the embed should take up extra space
  @override
  bool get expanded =>
      false; // Set to true if the embed should take up extra space
}
