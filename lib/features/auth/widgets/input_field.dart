import 'package:flutter/material.dart';

class InputFieldWidget extends StatelessWidget {
  final String title;
  final String hintText;
  final TextEditingController controller;

  const InputFieldWidget({
    super.key,
    required this.title,
    required this.controller,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(color: Colors.white, fontSize: 16),
          ),
          const SizedBox(height: 5),
          Container(
            decoration: BoxDecoration(
              border: Border.all(width: 2, color: Colors.grey[600]!),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: TextFormField(
                style: const TextStyle(color: Colors.white),
                controller: controller,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: hintText,
                    hintStyle: TextStyle(color: Colors.grey[600])),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "revisa el campo de $title";
                  }
                  return null;
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
