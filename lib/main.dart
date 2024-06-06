import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:jayani_power/core/cubit/terms_policy_cubit.dart';
import 'package:jayani_power/core/theme/app_theme.dart';
import 'package:jayani_power/features/auth/bloc/auth_bloc.dart';
import 'package:jayani_power/features/auth/pages/sign_in_page.dart';
import 'package:jayani_power/features/custom_plans/bloc/custom_diet_bloc/custom_diet_bloc_bloc.dart';
import 'package:jayani_power/features/custom_plans/bloc/custom_exercise_bloc/custom_exercise_bloc.dart';
import 'package:jayani_power/features/custom_plans/bloc/week/week_cubit.dart';
import 'package:jayani_power/features/profile/bloc/profile_bloc.dart';
import 'package:jayani_power/features/tabs/cubit/navbar_cubit.dart';
import 'package:jayani_power/features/tabs/pages/tabs_page.dart';
import 'package:jayani_power/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
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
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => TermsPolicyCubit()),
        BlocProvider(create: (context) => WeekCubit()),
        BlocProvider(create: (context) => NavbarCubit()),
        BlocProvider(create: (context) => ProfileBloc()),
        BlocProvider(create: (context) => CustomExerciseBloc()),
        BlocProvider(create: (context) => CustomDietBloc())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Jayani Power',
        theme: AppTheme.getAppTheme,
        home: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            if (state is AuthSuccessState) {
              return const TabsPage();
            }
            return const SignInPage();
          },
        ),
      ),
    );
  }
}
