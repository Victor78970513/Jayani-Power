import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:jayani_power/features/auth/pages/sign_up_page.dart';

class TermsAndPrivacy extends StatelessWidget {
  const TermsAndPrivacy({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(value: false, onChanged: (value) {}),
        const Text.rich(
          TextSpan(
              text: "I Agree with ",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              children: [
                TextSpan(
                  text: "Terms of Service ",
                  style: TextStyle(
                      color: Color(0xffFDA3B5), fontWeight: FontWeight.bold),
                ),
                TextSpan(
                  text: "and ",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                TextSpan(
                  text: "Privacy Policy",
                  style: TextStyle(
                      color: Color(0xffFDA3B5), fontWeight: FontWeight.bold),
                ),
              ]),
        ),
      ],
    );
  }
}

class SignInRIchText extends StatelessWidget {
  const SignInRIchText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: "Not a member? ",
        style:
            const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        children: [
          TextSpan(
            text: "Register Now",
            style: const TextStyle(color: Color(0xffFDA3B5)),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                Navigator.push(
                    context,
                    CupertinoPageRoute(
                        builder: (context) => const SignUpPage()));
              },
          )
        ],
      ),
    );
  }
}

class SignUpRIchText extends StatelessWidget {
  const SignUpRIchText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: "Already a member? ",
        style:
            const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        children: [
          TextSpan(
            text: "Sign In",
            style: const TextStyle(color: Color(0xffFDA3B5)),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                Navigator.pop(context);
              },
          )
        ],
      ),
    );
  }
}
