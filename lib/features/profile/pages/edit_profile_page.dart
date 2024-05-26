import 'package:flutter/material.dart';
import 'package:jayani_power/core/utils/picker_image.dart';
import 'package:jayani_power/features/profile/widgets/edit_profile_field.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Editar Perfil"), centerTitle: true),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                pickImageFromCamera();
              },
              child: CircleAvatar(
                backgroundColor: Colors.amber[300],
                radius: 60,
                child: const Stack(
                  children: [
                    Positioned(
                      left: 0,
                      right: 0,
                      bottom: 0,
                      child: Icon(Icons.person, size: 120),
                    ),
                    Positioned(
                      top: 30,
                      left: 0,
                      right: 0,
                      child: Icon(
                        Icons.camera_alt_outlined,
                        size: 60,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const EditProfileFields(),
          ],
        ),
      ),
    );
  }
}
