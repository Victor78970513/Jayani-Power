import 'package:flutter/material.dart';

class InputFieldWidget extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;

  const InputFieldWidget({
    super.key,
    required this.hintText,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Container(
        height: 100,
        width: size.width * 0.8,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.grey[400]!,
              blurRadius: 0.5,
              offset: const Offset(-0.5, -0.6),
              spreadRadius: 0.4,
              // blurStyle: BlurStyle.inner,
            ),
          ],
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(hintText),
              TextFormField(
                controller: controller,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
