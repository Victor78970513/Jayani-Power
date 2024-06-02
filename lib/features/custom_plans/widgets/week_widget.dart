import 'package:flutter/material.dart';
import 'package:jayani_power/core/utils/get_week_days_util.dart';

class WeekListWidget extends StatelessWidget {
  const WeekListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final days = GetWeekDaysUtil.get5Days();
    final names = GetWeekDaysUtil.getWeekNames(days);
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
                return WeekItemWidget(
                  day: names[index].substring(0, 2),
                  date: date.toLocal().toString().substring(8, 10),
                );
              }).toList(),
            ),
          ),
        ),
      ),
    );
  }
}

class WeekItemWidget extends StatelessWidget {
  final String day;
  final String date;
  const WeekItemWidget({super.key, required this.day, required this.date});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        // margin: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Text(
                day,
                style: const TextStyle(
                  color: Colors.white,
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
