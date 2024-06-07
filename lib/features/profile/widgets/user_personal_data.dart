import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jayani_power/features/profile/bloc/profile_bloc.dart';

class UserPersonalData extends StatelessWidget {
  const UserPersonalData({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        if (state is ProfileSuccessState) {
          return Column(
            children: [
              CircleAvatar(
                radius: 60,
                backgroundColor: Colors.transparent,
                child: ClipOval(
                  child: FadeInImage(
                    placeholder:
                        const AssetImage("assets/loaders/gym_loading.gif"),
                    image: NetworkImage(state.user.profilePictureUrl),
                    imageErrorBuilder: (context, error, stackTrace) {
                      return Image.asset(
                        "assets/loaders/gym_loading.gif",
                        fit: BoxFit.cover,
                        width: 120.0,
                        height: 120.0,
                      );
                    },
                    fit: BoxFit.cover,
                    width: 120.0,
                    height: 120.0,
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Text(
                state.user.username,
                style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.white),
              ),
              Text(
                state.user.memberType,
                style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: Colors.white),
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  UserPersonalDataItem("${state.user.weight}kg", "Peso"),
                  Container(height: 25, width: 3, color: Colors.grey),
                  UserPersonalDataItem("${state.user.height}cm", "Altura"),
                  Container(height: 25, width: 3, color: Colors.grey),
                  UserPersonalDataItem("${state.user.age} años", "Edad"),
                ],
              ),
            ],
          );
        }
        if (state is ProfileErrorState) {
          return const Center(child: Text("error"));
        }
        return const CircularProgressIndicator();
      },
    );
  }
}

class UserPersonalDataItem extends StatelessWidget {
  final String text1;
  final String text2;
  const UserPersonalDataItem(this.text1, this.text2, {super.key});

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(
        fontSize: 16, fontWeight: FontWeight.w500, color: Colors.white);
    return Column(
      children: [
        Text(text1, style: textStyle),
        Text(text2, style: textStyle),
      ],
    );
  }
}
