import 'dart:io';

import 'package:image_picker/image_picker.dart';

class UploadFiles {
  final ImagePicker _picker = ImagePicker();

  Future<File> getImage() async {
    File image;
    final pickedImage = await _picker.pickImage(source: ImageSource.gallery);
    image = File(pickedImage!.path);
    return image;
  }

  // get image from camera
  Future<File> getImageFromCamera() async {
    File pickedImage;
    final image = await _picker.pickImage(source: ImageSource.camera);
    pickedImage = File(image!.path);
    return pickedImage;
  }
}
