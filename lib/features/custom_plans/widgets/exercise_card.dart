import 'package:flutter/material.dart';

class ExerciseCard extends StatelessWidget {
  final String exercise;
  final int kcal;
  final int timeInMinutes;
  final String level;

  const ExerciseCard({
    super.key,
    required this.exercise,
    required this.kcal,
    required this.timeInMinutes,
    required this.level,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.95,
          height: 120,
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Image.asset("/assets/"),
              Container(
                decoration: BoxDecoration(
                    color: const Color(0xffFDA3B5),
                    borderRadius: BorderRadius.circular(20)),
                width: 90,
                child: Image.asset("assets/icons/google_icon.png"),
              ),
              SizedBox(
                width: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(exercise,
                        style: TextStyle(color: Colors.black, fontSize: 20)),
                    Container(
                      width: 170,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            "$kcal kcal",
                            style: TextStyle(color: Colors.black),
                          ),
                          Text("|"),
                          Text("$timeInMinutes minutes")
                        ],
                      ),
                    ),
                    Text(level)
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
// text
// image.asset, image.network
// listview.build
// row, column, 

//
    // return Padding(
    //   padding: const EdgeInsets.all(9.0),
    //   child: Row(
    //     children: [
    //       // Image.asset("/assets/")
    //       Column(
    //         mainAxisAlignment: MainAxisAlignment.center,
    //         children: [
    //           Container(
    //             width: MediaQuery.of(context).size.width * 0.90,
    //             height: 100,
    //             color: Colors.red,
    //             child: Text(exercise, style: TextStyle(color: Colors.black)),
    //           ),
    //         ],
    //       )
    //     ],
    //   ),
    // );