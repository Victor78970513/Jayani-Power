import 'package:flutter/material.dart';

class PostCardButton extends StatelessWidget {
  final VoidCallback iconPressed;
  final IconData iconData;
  final String iconText;
  const PostCardButton({
    super.key,
    required this.iconData,
    required this.iconPressed,
    required this.iconText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              IconButton(
                onPressed: iconPressed,
                icon: Icon(
                  iconData,
                  size: 30,
                  color: Colors.white,
                ),
              ),
              const SizedBox(width: 10),
              Text(iconText, style: const TextStyle(color: Colors.white))
            ],
          ),
        ],
      ),
    );
  }
}

class PostCardText extends StatelessWidget {
  const PostCardText({
    super.key,
    required this.titleOnTap,
    required this.title,
  });

  final VoidCallback titleOnTap;
  final String title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: titleOnTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Text(
          title,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
