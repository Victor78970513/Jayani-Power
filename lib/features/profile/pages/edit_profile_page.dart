import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jayani_power/core/utils/picker_image.dart';
import 'package:jayani_power/core/utils/show_dialogs.dart';
import 'package:jayani_power/features/profile/widgets/edit_profile_field.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  XFile? localImage;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          foregroundColor: Colors.white,
          backgroundColor: const Color(0xff252935),
          title: const Text(
            "Editar Perfil",
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () async {
                final ImageSource? option = await showPickerOptions(context);
                localImage = await pickImage(option);
                setState(() {});
              },
              child: CircleAvatar(
                backgroundColor: Colors.amber[300],
                radius: 50,
                child: localImage == null
                    ? const Stack(
                        children: [
                          Positioned(
                            left: 0,
                            right: 0,
                            bottom: 0,
                            child: Icon(Icons.person, size: 100),
                          ),
                          Positioned(
                            top: 30,
                            left: 0,
                            right: 0,
                            child: Icon(
                              Icons.camera_alt_outlined,
                              size: 50,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      )
                    : ClipOval(
                        child: Image.file(
                        File(localImage!.path),
                        fit: BoxFit.cover,
                        height: 120,
                        width: 120,
                      )),
              ),
            ),
            EditProfileFields(
              localImage: localImage,
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
