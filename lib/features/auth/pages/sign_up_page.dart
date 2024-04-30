import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jayani_power/features/auth/bloc/auth_bloc.dart';
import 'package:jayani_power/features/auth/widgets/input_field.dart';
import 'package:jayani_power/features/auth/widgets/login_button.dart';
import 'package:jayani_power/features/auth/widgets/social_media_auth_buttons.dart';
import 'package:jayani_power/features/auth/widgets/rich_texts.dart';
import 'package:jayani_power/features/home/pages/home_page.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController emailCtrl = TextEditingController();
  final TextEditingController userNameCtrl = TextEditingController();
  final TextEditingController passCtrl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xff0E1021),
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {},
        builder: (context, state) {
          return SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const Text("GETTING STARTED!",
                        style: TextStyle(color: Colors.white, fontSize: 20)),
                    const SizedBox(height: 10),
                    Text(
                      "create account to start using Jayani Power",
                      style: TextStyle(color: Colors.grey[700], fontSize: 14),
                    ),
                    const SizedBox(height: 20),
                    InputFieldWidget(
                      title: "Email",
                      hintText: "Enter Email",
                      controller: emailCtrl,
                    ),
                    const SizedBox(height: 20),
                    InputFieldWidget(
                      title: "Username",
                      hintText: "Enter Username",
                      controller: userNameCtrl,
                    ),
                    const SizedBox(height: 20),
                    InputFieldWidget(
                      title: "Password",
                      hintText: "Enter Password",
                      controller: passCtrl,
                    ),
                    const SizedBox(height: 5),
                    const TermsAndPrivacy(),
                    const SizedBox(height: 10),
                    LoginButton(
                      child: state is AuthLoadingState
                          ? const CircularProgressIndicator(color: Colors.black)
                          : const Text(
                              "Sign Up",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                      onTap: () {
                        context.read<AuthBloc>().add(OnUserSignInEvent(
                              email: emailCtrl.text,
                              password: passCtrl.text,
                            ));
                        state is AuthSuccessState
                            ? Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const HomePage(),
                                ))
                            : null;
                      },
                    ),
                    const SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          height: 1,
                          width: size.width * 0.3,
                          color: Colors.grey[600],
                        ),
                        Text(
                          "Or sign in with",
                          style: TextStyle(color: Colors.grey[600]),
                        ),
                        Container(
                          height: 1,
                          width: size.width * 0.3,
                          color: Colors.grey[600],
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    const SocialMediaAuthButtons(),
                    const SizedBox(height: 20),
                    const SignUpRIchText(),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
