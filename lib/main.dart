import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:jayani_power/core/cubit/terms_policy_cubit.dart';
import 'package:jayani_power/core/shared_preferences/preferences.dart';
import 'package:jayani_power/core/theme/app_theme.dart';
import 'package:jayani_power/features/auth/bloc/auth_bloc.dart';
import 'package:jayani_power/features/custom_plans/bloc/custom_diet_bloc/custom_diet_bloc_bloc.dart';
import 'package:jayani_power/features/custom_plans/bloc/custom_exercise_bloc/custom_exercise_bloc.dart';
import 'package:jayani_power/features/custom_plans/bloc/week/week_cubit.dart';
import 'package:jayani_power/features/profile/bloc/cubit/get_new_user_data_cubit.dart';
import 'package:jayani_power/features/profile/bloc/profile_bloc.dart';
import 'package:jayani_power/features/social_media/bloc/create_post/create_post_bloc.dart';
import 'package:jayani_power/features/tabs/cubit/navbar_cubit.dart';
import 'package:jayani_power/firebase_options.dart';
import 'package:jayani_power/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = Preferences();
  await prefs.init();
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

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    context.read<AuthBloc>().add(IsUserLoggedIn());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => TermsPolicyCubit()),
        BlocProvider(create: (context) => WeekCubit()),
        BlocProvider(create: (context) => NavbarCubit()),
        BlocProvider(create: (context) => ProfileBloc()),
        BlocProvider(create: (context) => CustomExerciseBloc()),
        BlocProvider(create: (context) => CustomDietBloc()),
        BlocProvider(create: (context) => CreatePostBloc()),
        BlocProvider(create: (context) => GetNewUserDataCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Jayani Power',
        theme: AppTheme.getAppTheme,
        home: const SplashScreen(),
      ),
    );
  }
}
