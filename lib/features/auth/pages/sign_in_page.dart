import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jayani_power/core/cubit/terms_policy_cubit.dart';
import 'package:jayani_power/core/utils/check_email.dart';
import 'package:jayani_power/features/auth/bloc/auth_bloc.dart';
import 'package:jayani_power/features/auth/widgets/input_field.dart';
import 'package:jayani_power/features/auth/widgets/login_button.dart';
import 'package:jayani_power/features/auth/widgets/social_media_auth_buttons.dart';
import 'package:jayani_power/features/auth/widgets/rich_texts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final TextEditingController emailCtrl = TextEditingController();
  final TextEditingController passCtrl = TextEditingController();
  final formKey = GlobalKey<FormState>();
  String? _emailErrorText;
  String? _passwordErrorText;

  @override
  void dispose() {
    emailCtrl.dispose();
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
    final termsAndPolicyCubit = context.watch<TermsPolicyCubit>().state;
    return SafeArea(
      child: Scaffold(
        // backgroundColor: const Color(0xff252935),
        body: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is AuthSignInFailureState) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.message)),
              );
            }
          },
          builder: (context, state) {
            return Padding(
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
                        "Inicia Sesion para empezar a usar Jayani Power",
                        style: TextStyle(color: Colors.grey[400], fontSize: 14),
                      ),
                      const SizedBox(height: 20),
                      InputFieldWidget(
                        title: "Email",
                        hintText: "Ingresa tu correoo",
                        controller: emailCtrl,
                        validator: (value) => _emailErrorText,
                        onChange: validateEmail,
                      ),
                      const SizedBox(height: 20),
                      InputFieldWidget(
                        title: "Password",
                        hintText: "Ingresa tu contraseña",
                        controller: passCtrl,
                        validator: (value) => _passwordErrorText,
                        onChange: validatePassword,
                      ),
                      const SizedBox(height: 5),
                      const TermsAndPrivacy(),
                      const SizedBox(height: 10),
                      LoginButton(
                        onTap: termsAndPolicyCubit
                            ? () {
                                if (formKey.currentState!.validate()) {
                                  context
                                      .read<AuthBloc>()
                                      .add(OnUserSignInEvent(
                                        email: emailCtrl.text.trim(),
                                        password: passCtrl.text.trim(),
                                      ));
                                }
                              }
                            : () {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text(
                                          "DEBES ACEPTAR LOS TERMINOS DE PRIVACIDAD Y POLITICAS")),
                                );
                              },
                        child: state is AuthLoadingState
                            ? LoadingAnimationWidget.inkDrop(
                                color: Colors.white, size: 35)
                            : const Text(
                                "Iniciar Sesion",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                      ),
                      const SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            height: 1,
                            width: size.width * 0.3,
                            color: Colors.grey[400],
                          ),
                          Text(
                            "O iniciar sesion con",
                            style: TextStyle(color: Colors.grey[400]),
                          ),
                          Container(
                            height: 1,
                            width: size.width * 0.3,
                            color: Colors.grey[400],
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      const SocialMediaAuthButtons(),
                      const SizedBox(height: 20),
                      const SignInRIchText(),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
