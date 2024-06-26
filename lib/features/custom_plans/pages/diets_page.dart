import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jayani_power/features/custom_plans/bloc/custom_diet_bloc/custom_diet_bloc_bloc.dart';
import 'package:jayani_power/features/custom_plans/widgets/state_meals_widgets.dart';
import 'package:jayani_power/features/profile/bloc/profile_bloc.dart';

class DietsPage extends StatefulWidget {
  const DietsPage({super.key});

  @override
  State<DietsPage> createState() => _DietsPageState();
}

class _DietsPageState extends State<DietsPage> {
  final ProfileBloc profile = ProfileBloc();
  void getGptDiet() {
    final userModel = context.read<ProfileBloc>().userModel;
    context.read<CustomDietBloc>().add(OnGetCustomDietEvent(user: userModel!));
  }

  void checkDiet() => context.read<CustomDietBloc>().add(OnCheckUserDiet());

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CustomDietBloc, CustomDietState>(
      builder: (context, state) {
        switch (state) {
          case CustomDietSuccessState():
            return SuccessCustomDietWidget(onPressed: checkDiet);

          case CustomDietLoadingState():
            return const LoadingCustomDietWidget();

          case CustomDietErrorState():
            return ErrorCustomDIetWidget(onPressed: getGptDiet);

          default:
            return InitialCustomDietWidget(onPressed: getGptDiet);
        }
      },
    );
  }
}
