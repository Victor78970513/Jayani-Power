import 'package:flutter_bloc/flutter_bloc.dart';

class WeekCubit extends Cubit<int> {
  WeekCubit() : super(0);

  void changeWeekIndex(int value) => emit(value);
}
