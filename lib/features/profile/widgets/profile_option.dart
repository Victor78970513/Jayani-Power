import 'package:flutter/material.dart';

class ProfileOption extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final IconData icon;
  const ProfileOption(
      {super.key,
      required this.title,
      required this.onPressed,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: SizedBox(
        width: size.width,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: GestureDetector(
                onTap: onPressed,
                child: Row(
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w500),
                    ),
                    const Spacer(),
                    Icon(icon, color: Colors.white),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 5),
            const Divider(
              color: Color(0xffCEB2C1),
              indent: 10.0,
              thickness: 3.0,
              endIndent: 10.0,
            )
          ],
        ),
      ),
    );
  }
}
