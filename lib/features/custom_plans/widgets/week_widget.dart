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
                        day: names[index].substring(0, 3),
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
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Container(
        height: 60,
        width: 60,
        decoration: BoxDecoration(
          color: weekCubit == index ? const Color(0xffFF004D) : Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              day,
              style: TextStyle(
                color: weekCubit == index ? Colors.white : Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            Text(
              date,
              style: TextStyle(
                  fontSize: 18,
                  color: weekCubit == index ? Colors.white : Colors.black,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
