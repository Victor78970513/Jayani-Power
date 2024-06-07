import 'package:image_picker/image_picker.dart';

Future<XFile?> pickImage(ImageSource? source) async {
  try {
    if (source == null) {
      return null;
    }
    final retunedImage =
        await ImagePicker().pickImage(source: source, imageQuality: 100);
    if (retunedImage == null) return null;
    return retunedImage;
  } catch (e) {
    return null;
  }
}
