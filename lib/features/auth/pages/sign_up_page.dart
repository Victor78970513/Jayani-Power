import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jayani_power/core/utils/check_email.dart';
import 'package:jayani_power/core/utils/snack_bars.dart';
import 'package:jayani_power/features/auth/bloc/auth_bloc.dart';
import 'package:jayani_power/features/auth/widgets/input_field.dart';
import 'package:jayani_power/features/auth/widgets/login_button.dart';
import 'package:jayani_power/features/auth/widgets/social_media_auth_buttons.dart';
import 'package:jayani_power/features/auth/widgets/rich_texts.dart';
import 'package:jayani_power/features/tabs/cubit/navbar_cubit.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

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
  String? _emailErrorText;
  String? _passwordErrorText;

  @override
  void initState() {
    context.read<NavbarCubit>().changeTab(0);
    super.initState();
  }

  @override
  void dispose() {
    emailCtrl.dispose();
    userNameCtrl.dispose();
    passCtrl.dispose();
    super.dispose();
  }

  void validateEmail(String value) {
    if (value.isEmpty) {
      setState(() {
        _emailErrorText = 'El correo es requerido';
      });
    } else if (!isEmailValid(value)) {
      setState(() {
        _emailErrorText = 'Enter a valid email address';
      });
    } else {
      setState(() {
        _emailErrorText = null;
      });
    }
  }

  void validatePassword(String value) {
    if (value.isEmpty) {
      setState(() {
        _passwordErrorText = "La contrasenia es requerida";
      });
    } else if (value.length < 6) {
      setState(() {
        _passwordErrorText =
            "La contrasenia debe tener por lo menos 6 caracteres";
      });
    } else {
      setState(() {
        _passwordErrorText = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    formKey.currentState?.validate();
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthSuccessState) {
            Navigator.pop(context);
          }
          if (state is AuthSignUpFailureState) {
            credentialError(context, state.message);
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
                      SvgPicture.asset(
                        "assets/icons/jayani_logo.svg",
                        height: 70,
                        width: 50,
                      ),
                      const SizedBox(height: 20),
                      Text(
                        "Crea una cuenta para empezar a usar Jayani Power",
                        style: TextStyle(color: Colors.grey[400], fontSize: 14),
                      ),
                      const SizedBox(height: 20),
                      InputFieldWidget(
                        title: "Email",
                        hintText: "Ingresa tu correo",
                        controller: emailCtrl,
                        validator: (value) => _emailErrorText,
                        onChange: validateEmail,
                      ),
                      const SizedBox(height: 20),
                      InputFieldWidget(
                        title: "Username",
                        hintText: "Ingresa tu nombre de usuario",
                        controller: userNameCtrl,
                      ),
                      const SizedBox(height: 20),
                      InputFieldWidget(
                        title: "Password",
                        hintText: "Ingresa tu contraseña",
                        controller: passCtrl,
                        validator: (value) => _passwordErrorText,
                        onChange: validatePassword,
                        obscureText: true,
                      ),
                      const SizedBox(height: 5),
                      const TermsAndPrivacy(),
                      const SizedBox(height: 10),
                      LoginButton(
                        child: state is AuthLoadingState
                            ? LoadingAnimationWidget.inkDrop(
                                color: Colors.white, size: 35)
                            : const Text(
                                "Crear Cuenta",
                                style: TextStyle(
                                    color: Colors.white,
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
                      const SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            height: 1,
                            width: size.width * 0.25,
                            color: Colors.grey[600],
                          ),
                          Text(
                            "O crear una cuenta con",
                            style: TextStyle(color: Colors.grey[600]),
                          ),
                          Container(
                            height: 1,
                            width: size.width * 0.25,
                            color: Colors.grey[600],
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      const SocialMediaAuthButtons(),
                      const SizedBox(height: 10),
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
