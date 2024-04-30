import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jayani_power/features/auth/bloc/auth_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final authBloc = context.watch<AuthBloc>();
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            authBloc.add(OnUserSignOut());
          },
          child: Text("salite choco para cambiar de cuenta"),
        ),
      ),
    );
  }
}
