import 'package:image_picker/image_picker.dart';

Future<XFile?> pickImageFromCamera() async {
  try {
    final retunedImage = await ImagePicker()
        .pickImage(source: ImageSource.camera, imageQuality: 100);
    if (retunedImage == null) return null;
    return retunedImage;
  } catch (e) {
    return null;
  }
}
