import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jayani_power/features/auth/bloc/auth_bloc.dart';
import 'package:jayani_power/features/profile/bloc/profile_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class EditProfileFields extends StatefulWidget {
  final XFile? localImage;
  const EditProfileFields({super.key, required this.localImage});

  @override
  State<EditProfileFields> createState() => _EditProfileFieldsState();
}

class _EditProfileFieldsState extends State<EditProfileFields> {
  final TextEditingController nameCtrl = TextEditingController();
  final TextEditingController weightCtrl = TextEditingController();
  final TextEditingController heightCtrl = TextEditingController();
  final TextEditingController physicalCtrl = TextEditingController();
  final TextEditingController foodResCtrl = TextEditingController();
  final TextEditingController goalCtrl = TextEditingController();

  @override
  void initState() {
    final profileBloc =
        context.read<ProfileBloc>().state as ProfileSuccessState;
    nameCtrl.text = profileBloc.user.username;
    weightCtrl.text = profileBloc.user.weight.toString();
    heightCtrl.text = profileBloc.user.height.toString();
    physicalCtrl.text = profileBloc.user.physicalLimitations;
    foodResCtrl.text = profileBloc.user.foodRestrictions;
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
              title: "Restricciones Fisicas",
              controller: physicalCtrl,
            ),
            EditTextField(
              title: "Restricciones Alimenticias",
              controller: foodResCtrl,
            ),
            EditTextField(
              title: "Objetivo",
              controller: goalCtrl,
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(300, 50),
                backgroundColor: const Color(0xffFF004D),
              ),
              onPressed: () {
                if (state is ProfileSuccessState) {
                  context.read<ProfileBloc>().add(OnEditProfileEvent(
                        username: nameCtrl.text,
                        weight: double.parse(weightCtrl.text),
                        height: double.parse(heightCtrl.text),
                        physicalLimitations: '',
                        foodRestrictions: '',
                        profilePictureUrl: state.user.profilePictureUrl,
                        goal: '',
                        uid: state.user.uid,
                      ));
                } else {
                  final authBloc = AuthBloc().state as AuthSuccessState;
                  context
                      .read<ProfileBloc>()
                      .add(OnGetProfileEvent(authBloc.uid));
                }
              },
              child: state is ProfileLoadingState
                  ? LoadingAnimationWidget.inkDrop(
                      color: Colors.white, size: 50)
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
