import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  final Function() onTap;
  final Widget child;
  const LoginButton({super.key, required this.onTap, required this.child});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 70,
        width: size.width * 0.8,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Center(
          // child: Text(
          //   "Login",
          //   style: TextStyle(color: Colors.white, fontSize: 18),
          // ),
          child: child,
        ),
      ),
    );
  }
}
