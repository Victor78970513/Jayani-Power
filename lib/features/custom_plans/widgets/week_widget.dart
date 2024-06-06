import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jayani_power/core/utils/get_week_days_util.dart';
import 'package:jayani_power/features/custom_plans/bloc/week/week_cubit.dart';

class WeekListWidget extends StatelessWidget {
  const WeekListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final days = GetWeekDaysUtil.get5Days();
    final names = GetWeekDaysUtil.getWeekNames(days);
    return BlocBuilder<WeekCubit, int>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.only(top: 20),
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.1,
            width: MediaQuery.of(context).size.width,
            child: Center(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: days.map((date) {
                    int index = days.indexOf(date);
                    return GestureDetector(
                      onTap: () {
                        context.read<WeekCubit>().changeWeekIndex(index);
                      },
                      child: WeekItemWidget(
                        index: index,
                        day: names[index].substring(0, 2),
                        date: date.toLocal().toString().substring(8, 10),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class WeekItemWidget extends StatelessWidget {
  final String day;
  final String date;
  final int index;
  const WeekItemWidget(
      {super.key, required this.day, required this.date, required this.index});

  @override
  Widget build(BuildContext context) {
    final weekCubit = context.watch<WeekCubit>().state;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        decoration: BoxDecoration(
          color: weekCubit == index ? Colors.black : Colors.grey[300],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                day,
                style: TextStyle(
                  color: weekCubit == index ? Colors.white : Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 10),
              CircleAvatar(
                backgroundColor: Colors.white,
                child: Center(
                    child: Text(
                  date,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
