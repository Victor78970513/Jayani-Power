import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:jayani_power/repositories/custom_plans/custom_plans_repository_impl.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final custom = CustomPLansRepositoryImpl();
    return Scaffold(
        body: Center(
            child: ElevatedButton(
      onPressed: () {
        // log(custom.mapping().toString());
        custom.mapping();
      },
      child: Text("Home"),
    )));
  }
}
