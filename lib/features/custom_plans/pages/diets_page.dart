import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jayani_power/features/custom_plans/bloc/custom_diet_bloc/custom_diet_bloc_bloc.dart';
import 'package:jayani_power/features/custom_plans/widgets/state_meals_widgets.dart';

class DietsPage extends StatefulWidget {
  const DietsPage({super.key});

  @override
  State<DietsPage> createState() => _DietsPageState();
}

class _DietsPageState extends State<DietsPage> {
  void getGptDiet() =>
      context.read<CustomDietBloc>().add(OnGetCustomDietEvent());

  void checkDiet() => context.read<CustomDietBloc>().add(OnCheckUserDiet());

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CustomDietBloc, CustomDietState>(
      builder: (context, state) {
        switch (state) {
          case CustomDietSuccessState():
            return SizedBox(
              height: double.infinity,
              width: double.infinity,
              child: SuccessCustomDietWidget(onPressed: checkDiet),
            );

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
