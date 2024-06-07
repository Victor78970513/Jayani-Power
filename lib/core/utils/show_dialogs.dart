import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';

Future<ImageSource?> showPickerOptions(BuildContext context) async {
  ImageSource? source;
  await showModalBottomSheet<ImageSource>(
      backgroundColor: const Color(0xff252935),
      context: context,
      builder: (context) {
        return SizedBox(
          height: 150,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: () {
                  source = ImageSource.camera;
                  Navigator.of(context).pop();
                },
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.camera_alt_outlined,
                        size: 40, color: Colors.white),
                    Text("Camara",
                        style: TextStyle(fontSize: 18, color: Colors.white)),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  source = ImageSource.gallery;
                  Navigator.of(context).pop();
                },
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(FontAwesomeIcons.image, size: 40, color: Colors.white),
                    Text("Galeria",
                        style: TextStyle(fontSize: 18, color: Colors.white)),
                  ],
                ),
              ),
            ],
          ),
        );
      });
  return source;
}
