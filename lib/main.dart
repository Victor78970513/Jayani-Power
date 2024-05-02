import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jayani_power/core/theme/app_theme.dart';
import 'package:jayani_power/features/auth/bloc/auth_bloc.dart';
import 'package:jayani_power/features/auth/pages/sign_in_page.dart';
import 'package:jayani_power/features/home/pages/home_page.dart';
import 'package:jayani_power/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(create: (context) => AuthBloc()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Jayani Power',
      theme: AppTheme.getAppTheme,
      home: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          if (state is AuthSuccessState) {
            return const HomePage();
          }
          return const SignInPage();
        },
      ),
    );
  }
}
