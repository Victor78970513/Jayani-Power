import 'package:flutter/material.dart';
import 'package:jayani_power/core/shared_preferences/preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: ElevatedButton(
      onPressed: () {
        setState(() {});
      },
      child: Text("Home, ${Preferences().userUUID}"),
    )));
  }
}
