import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jayani_power/features/social_media/bloc/create_post/create_post_bloc.dart';
import 'package:jayani_power/models/user_model.dart';

void createPost({required BuildContext context, UserModel? user}) {
  final TextEditingController controller = TextEditingController();
  XFile? postLocalImage;
  showModalBottomSheet(
      isDismissible: false,
      isScrollControlled: true,
      backgroundColor: const Color(0xff252935),
      context: context,
      builder: (context) {
        return BlocConsumer<CreatePostBloc, CreatePostState>(
          listener: (context, state) {
            if (state is CreatePostSuccessState) {
              Navigator.pop(context);
            }
          },
          builder: (context, state) {
            return SizedBox(
                height: MediaQuery.of(context).size.height * 0.8,
                child: Column(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 20, top: 20, bottom: 20),
                      child: ListTile(
                        trailing: IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: const Icon(FontAwesomeIcons.xmark,
                                color: Colors.white)),
                        leading: CircleAvatar(
                          radius: 20,
                          backgroundColor: Colors.transparent,
                          child: ClipOval(
                            child: FadeInImage(
                              placeholder: const AssetImage(
                                  "assets/loaders/gym_loading.gif"),
                              image:
                                  NetworkImage(user?.profilePictureUrl ?? ""),
                              imageErrorBuilder: (context, error, stackTrace) {
                                return Image.asset(
                                  "assets/loaders/gym_loading.gif",
                                  fit: BoxFit.cover,
                                  width: 40.0,
                                  height: 40.0,
                                );
                              },
                              fit: BoxFit.cover,
                              width: 40.0,
                              height: 40.0,
                            ),
                          ),
                        ),
                        title: Text(
                          user?.username ?? "SIN NOMBRE DE USUARIO",
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 3.0,
                          ),
                        ),
                        subtitle: const Text(
                          "Esta publicacion sera totalmente publica",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: TextField(
                        controller: controller,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "TITULO DE LA PUBLICACION",
                          hintStyle: TextStyle(
                              color: Colors.grey[400],
                              fontWeight: FontWeight.bold),
                          labelStyle: const TextStyle(color: Colors.white),
                        ),
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: TextField(
                        controller: controller,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "¿ Sobre que quieres hablar ?",
                          hintStyle: TextStyle(
                              color: Colors.grey[400],
                              fontWeight: FontWeight.bold),
                          labelStyle: const TextStyle(color: Colors.white),
                        ),
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                    const Spacer(),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: IconButton(
                        onPressed: () async {
                          postLocalImage = await ImagePicker().pickImage(
                              source: ImageSource.gallery, imageQuality: 100);
                        },
                        icon: const Icon(
                          Icons.image_search,
                          color: Colors.white,
                          size: 35,
                        ),
                      ),
                    ),
                    const Divider(),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 25,
                        vertical: 10,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const Icon(FontAwesomeIcons.clock,
                              color: Colors.white),
                          const SizedBox(width: 30),
                          ElevatedButton(
                            onPressed: state is CreatePostLoadingState
                                ? () {}
                                : () {
                                    context.read<CreatePostBloc>().add(
                                          OnCreatePostEvent(
                                            content: controller.text,
                                            createdAt: DateTime.now(),
                                            profilePictureUrl:
                                                user?.profilePictureUrl ?? "",
                                            title: "pruebita",
                                            postLocalImage: postLocalImage,
                                            userName: user?.username ??
                                                "usuario desconocido",
                                          ),
                                        );
                                  },
                            child: state is CreatePostLoadingState
                                ? const Padding(
                                    padding: EdgeInsets.all(12.0),
                                    child: CircularProgressIndicator(
                                      color: Color(0xffFF004D),
                                    ),
                                  )
                                : const Text("Publcar"),
                          ),
                        ],
                      ),
                    )
                  ],
                ));
          },
        );
      });
}
