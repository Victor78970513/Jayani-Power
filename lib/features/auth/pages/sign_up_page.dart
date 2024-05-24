import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jayani_power/features/auth/bloc/auth_bloc.dart';
import 'package:jayani_power/features/auth/widgets/input_field.dart';
import 'package:jayani_power/features/auth/widgets/login_button.dart';
import 'package:jayani_power/features/auth/widgets/social_media_auth_buttons.dart';
import 'package:jayani_power/features/auth/widgets/rich_texts.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController emailCtrl = TextEditingController();
  final TextEditingController userNameCtrl = TextEditingController();
  final TextEditingController passCtrl = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailCtrl.dispose();
    userNameCtrl.dispose();
    passCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    formKey.currentState?.validate();
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xff0E1021),
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthSuccessState) {
            Navigator.pop(context);
          }
          if (state is AuthFailureState) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Parece que la cuenta ya existe")),
            );
          }
        },
        builder: (context, state) {
          return SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
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
                            ? const CircularProgressIndicator(
                                color: Colors.black)
                            : const Text(
                                "Sign Up",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                        onTap: () {
                          if (formKey.currentState!.validate()) {
                            context.read<AuthBloc>().add(OnUserSignUpEvent(
                                email: emailCtrl.text.trim(),
                                password: passCtrl.text.trim(),
                                username: userNameCtrl.text.trim()));
                          }
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
            ),
          );
        },
      ),
    );
  }
}