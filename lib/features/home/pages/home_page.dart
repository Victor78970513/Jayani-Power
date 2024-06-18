import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jayani_power/core/shared_preferences/preferences.dart';
import 'package:jayani_power/core/utils/snack_bars.dart';
import 'package:jayani_power/features/auth/bloc/auth_bloc.dart';
import 'package:jayani_power/features/home/widgets/radial_progress.dart';
import 'package:jayani_power/features/profile/bloc/profile_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double porcentajeRutina = 0.0;
  double porcentajeDieta = 0.0;

  @override
  void initState() {
    super.initState();
    _initPreferences();
  }

  Future<void> _initPreferences() async {
    final userID = context.read<AuthBloc>().state as AuthSuccessState;
    context.read<ProfileBloc>().add(OnGetProfileEvent(userID.uid));
    porcentajeDieta = Preferences().porcentajeDieta;
    porcentajeRutina = Preferences().porcentajeRutina;
  }

  void _handleDietaClick() {
    final today = DateTime.now().toIso8601String().split('T').first;
    final lastDietaClick = Preferences().lastDietaClickDate;

    if (lastDietaClick != today) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Ya has registrado tu dieta hoy.")));
      return;
    }

    setState(() {
      porcentajeDieta += 20;
      Preferences().porcentajeDieta = porcentajeDieta;
      Preferences().lastDietaClickDate = today;
    });
  }

  void _handleRutinaClick() {
    final today = DateTime.now().toIso8601String().split('T').first;
    final lastRutinaClick = Preferences().lastRutinaClickDate;

    if (lastRutinaClick == today) {
      progressSnackBar(context, "Ya registraste el progreso de hoy");
      return;
    }

    setState(() {
      porcentajeRutina += 20;
      Preferences().porcentajeRutina = porcentajeRutina;
      Preferences().lastRutinaClickDate = today;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: const Color(0xffFF004D),
            title: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                children: [
                  const Text(
                    "JAYANI POWER",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  SvgPicture.asset(
                    "assets/icons/jayani_logo_black.svg",
                    height: 45,
                  )
                ],
              ),
            ),
          ),
          body: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 0, vertical: 40),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(width: 3, color: Colors.white)),
                      child: Column(
                        children: [
                          const Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            child: Text("Progreso de la rutina",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                )),
                          ),
                          RadialProgress(
                            porcentaje: porcentajeRutina,
                            grosorSecundario: 4,
                            grosorPrimario: 10,
                            colorSecundario: Colors.white,
                            colorPrimario: Colors.pink,
                          ),
                          _Button(
                            onPressed: _handleRutinaClick,
                            text: "Registrar",
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 0),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(width: 3, color: Colors.white)),
                      child: Column(
                        children: [
                          const Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            child: Text("Progreso de la dieta",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                )),
                          ),
                          RadialProgress(
                            porcentaje: porcentajeDieta,
                            grosorSecundario: 4,
                            grosorPrimario: 10,
                            colorSecundario: Colors.white,
                            colorPrimario: Colors.pink,
                          ),
                          _Button(
                            onPressed: _handleDietaClick,
                            text: "Registrar",
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 100)
                ],
              ),
            ),
          )),
    );
  }
}

class _Button extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  const _Button({required this.onPressed, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xffFF004D),
          ),
          onPressed: onPressed,
          child: Text(
            text,
            style: const TextStyle(color: Colors.white),
          )),
    );
  }
}



// class HomePage extends StatefulWidget {
//   const HomePage({super.key});

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   double porcentajeRutina = 0.0;
//   double porcentajeDieta = 0.0;
//   @override
//   void initState() {
//     final userID = context.read<AuthBloc>().state as AuthSuccessState;
//     context.read<ProfileBloc>().add(OnGetProfileEvent(userID.uid));
//     porcentajeDieta = Preferences().porcentajeDieta;
//     porcentajeRutina = Preferences().porcentajeRutina;
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//           appBar: AppBar(
//             backgroundColor: const Color(0xffFF004D),
//             title: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 30),
//               child: Row(
//                 children: [
//                   const Text(
//                     "JAYANI POWER",
//                     style: TextStyle(
//                       color: Colors.white,
//                       // fontStyle: FontStyle.italic,
//                       fontSize: 25,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   const Spacer(),
//                   SvgPicture.asset(
//                     "assets/icons/jayani_logo_black.svg",
//                     height: 45,
//                   )
//                 ],
//               ),
//             ),
//           ),
//           body: Center(
//             child: SingleChildScrollView(
//               child: Column(
//                 children: [
//                   Padding(
//                     padding:
//                         const EdgeInsets.symmetric(horizontal: 0, vertical: 40),
//                     child: Container(
//                       decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(15),
//                           border: Border.all(width: 3, color: Colors.white)),
//                       child: Column(
//                         children: [
//                           const Padding(
//                             padding: EdgeInsets.symmetric(
//                                 horizontal: 20, vertical: 10),
//                             child: Text("Progreso de la rutina",
//                                 style: TextStyle(
//                                   color: Colors.white,
//                                   fontSize: 18,
//                                   fontWeight: FontWeight.w700,
//                                 )),
//                           ),
//                           RadialProgress(
//                             porcentaje: porcentajeRutina,
//                             grosorSecundario: 4,
//                             grosorPrimario: 10,
//                             colorSecundario: Colors.white,
//                             colorPrimario: Colors.pink,
//                           ),
//                           _Button(onPressed: () {
//                             porcentajeRutina += 20;
//                             Preferences().porcentajeRutina = porcentajeRutina;
//                             setState(() {});
//                           })
//                         ],
//                       ),
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 0),
//                     child: Container(
//                       decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(15),
//                           border: Border.all(width: 3, color: Colors.white)),
//                       child: Column(
//                         children: [
//                           const Padding(
//                             padding: EdgeInsets.symmetric(
//                                 horizontal: 20, vertical: 10),
//                             child: Text("Progreso de la dieta",
//                                 style: TextStyle(
//                                   color: Colors.white,
//                                   fontSize: 18,
//                                   fontWeight: FontWeight.w700,
//                                 )),
//                           ),
//                           RadialProgress(
//                             porcentaje: porcentajeDieta,
//                             grosorSecundario: 4,
//                             grosorPrimario: 10,
//                             colorSecundario: Colors.white,
//                             colorPrimario: Colors.pink,
//                           ),
//                           _Button(onPressed: () {
//                             porcentajeDieta += 20;
//                             Preferences().porcentajeDieta = porcentajeDieta;
//                             setState(() {});
//                           })
//                         ],
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 100)
//                 ],
//               ),
//             ),
//           )),
//     );
//   }
// }

// class _Button extends StatelessWidget {
//   final VoidCallback onPressed;
//   const _Button({required this.onPressed});

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 20),
//       child: ElevatedButton(
//           style: ElevatedButton.styleFrom(
//             backgroundColor: const Color(0xffFF004D),
//           ),
//           onPressed: onPressed,
//           child: const Text(
//             "Registrar",
//             style: TextStyle(color: Colors.white),
//           )),
//     );
//   }
// }
