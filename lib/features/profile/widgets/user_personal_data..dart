import 'package:flutter/material.dart';

class UserPersonalData extends StatelessWidget {
  const UserPersonalData({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const UserPersonalDataItem(),
          Container(height: 15, width: 3, color: Colors.grey),
          const UserPersonalDataItem(),
          Container(height: 15, width: 3, color: Colors.grey),
          const UserPersonalDataItem(),
        ],
      ),
    );
  }
}

class UserPersonalDataItem extends StatelessWidget {
  const UserPersonalDataItem({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Text("55kg"),
        Text("Weight"),
      ],
    );
  }
}
