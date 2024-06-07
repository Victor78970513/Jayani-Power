import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jayani_power/features/auth/bloc/auth_bloc.dart';
import 'package:jayani_power/features/profile/bloc/profile_bloc.dart';

class EditProfileFields extends StatefulWidget {
  final XFile? localImage;
  const EditProfileFields({super.key, required this.localImage});

  @override
  State<EditProfileFields> createState() => _EditProfileFieldsState();
}

class _EditProfileFieldsState extends State<EditProfileFields> {
  final TextEditingController nameCtrl = TextEditingController();
  final TextEditingController emailCtrl = TextEditingController();
  final TextEditingController weightCtrl = TextEditingController();
  final TextEditingController heightCtrl = TextEditingController();
  final TextEditingController ageCtrl = TextEditingController();
  @override
  void initState() {
    final profileBloc =
        context.read<ProfileBloc>().state as ProfileSuccessState;
    nameCtrl.text = profileBloc.user.username;
    emailCtrl.text = profileBloc.user.email;
    weightCtrl.text = profileBloc.user.weight;
    heightCtrl.text = profileBloc.user.height;
    ageCtrl.text = profileBloc.user.age;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileBloc, ProfileState>(
      listener: (context, state) {
        if (state is ProfileErrorState) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Error al actualizar datos")),
          );
        }
        if (state is ProfileSuccessState) {
          Navigator.pop(context);
        }
      },
      builder: (context, state) {
        return Column(
          children: [
            EditTextField(title: "Nombre Completo", controller: nameCtrl),
            EditTextField(title: "Correo electronico", controller: emailCtrl),
            EditTextField(
              title: "Peso",
              controller: weightCtrl,
              keyboardType: TextInputType.number,
            ),
            EditTextField(
              title: "Altura",
              controller: heightCtrl,
              keyboardType: TextInputType.number,
            ),
            EditTextField(
              title: "Edad",
              controller: ageCtrl,
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 15),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(300, 50),
                backgroundColor: const Color(0xffFF004D),
              ),
              onPressed: () {
                if (state is ProfileSuccessState) {
                  context.read<ProfileBloc>().add(OnEditProfileEvent(
                        uid: state.user.uid,
                        email: emailCtrl.text,
                        username: nameCtrl.text,
                        localImage: widget.localImage,
                        profilePictureUrl: state.user.profilePictureUrl,
                        publicProfile: state.user.publicProfile,
                        weight: double.parse(weightCtrl.text),
                        height: double.parse(heightCtrl.text),
                        age: int.parse(ageCtrl.text),
                      ));
                } else {
                  final authBloc = AuthBloc().state as AuthSuccessState;
                  context
                      .read<ProfileBloc>()
                      .add(OnGetProfileEvent(authBloc.uid));
                }
              },
              child: state is ProfileLoadingState
                  ? const CircularProgressIndicator(color: Colors.white)
                  : const Text(
                      "Guardar informacion",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
            ),
          ],
        );
      },
    );
  }
}

class EditTextField extends StatelessWidget {
  final String title;
  final TextEditingController controller;
  final TextInputType? keyboardType;
  const EditTextField({
    super.key,
    required this.title,
    required this.controller,
    this.keyboardType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
                fontSize: 16, fontWeight: FontWeight.w500, color: Colors.white),
          ),
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.only(left: 15),
            width: MediaQuery.of(context).size.width,
            height: 60,
            decoration: BoxDecoration(
              color: Colors.grey[350],
              borderRadius: BorderRadius.circular(30),
            ),
            child: Center(
              child: TextField(
                controller: controller,
                keyboardType: keyboardType,
                decoration: const InputDecoration(border: InputBorder.none),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
