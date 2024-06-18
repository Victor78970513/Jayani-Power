// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:jayani_power/features/auth/bloc/auth_bloc.dart';
// import 'package:jayani_power/features/profile/bloc/profile_bloc.dart';
// import 'package:jayani_power/features/profile/widgets/edit_profile_field.dart';
// import 'package:jayani_power/features/tabs/pages/tabs_page.dart';
// import 'package:loading_animation_widget/loading_animation_widget.dart';

// class GetNewUserData extends StatefulWidget {
//   const GetNewUserData({super.key});

//   @override
//   State<GetNewUserData> createState() => _GetNewUserDataState();
// }

// class _GetNewUserDataState extends State<GetNewUserData> {
//   final TextEditingController ageCtrl = TextEditingController();
//   final TextEditingController weightCtrl = TextEditingController();
//   final TextEditingController heaightCtrl = TextEditingController();
//   final TextEditingController physicalCtrl = TextEditingController();
//   final TextEditingController foodResCtrl = TextEditingController();
//   final TextEditingController goalCtrl = TextEditingController();
//   final TextEditingController nameCtrl = TextEditingController();

//   @override
//   void initState() {
//     final profileBloc =
//         context.read<ProfileBloc>().state as ProfileSuccessState;
//     nameCtrl.text = profileBloc.user.username;
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: BlocBuilder<ProfileBloc, ProfileState>(
//         builder: (context, state) {
//           return SafeArea(
//             child: SingleChildScrollView(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   const Text(
//                     "Llena con tu datos Personales",
//                     style: TextStyle(color: Colors.white, fontSize: 20),
//                   ),
//                   EditTextField(
//                     title: "Edad",
//                     controller: ageCtrl,
//                     keyboardType: TextInputType.number,
//                   ),
//                   EditTextField(
//                     title: "Peso",
//                     controller: weightCtrl,
//                     keyboardType: TextInputType.number,
//                   ),
//                   EditTextField(title: "Altura", controller: heaightCtrl),
//                   EditTextField(
//                       title: "Restricciones fisicas", controller: physicalCtrl),
//                   EditTextField(
//                       title: "Restricciones alimentarias",
//                       controller: foodResCtrl),
//                   EditTextField(title: "Objetivo", controller: goalCtrl),
//                   const SizedBox(height: 20),
//                   ElevatedButton(
//                     style: ElevatedButton.styleFrom(
//                       minimumSize: const Size(300, 50),
//                       backgroundColor: const Color(0xffFF004D),
//                     ),
//                     onPressed: () {
//                       if (state is ProfileSuccessState) {
//                         context.read<ProfileBloc>().add(OnEditProfileEvent(
//                               username: nameCtrl.text,
//                               weight: double.parse(weightCtrl.text),
//                               height: double.parse(heaightCtrl.text),
//                               physicalLimitations: physicalCtrl.text,
//                               foodRestrictions: foodResCtrl.text,
//                               profilePictureUrl: state.user.profilePictureUrl,
//                               goal: goalCtrl.text,
//                               uid: state.user.uid,
//                             ));
//                         Navigator.pushReplacement(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) => const TabsPage()));
//                       } else {
//                         final authBloc = AuthBloc().state as AuthSuccessState;
//                         context
//                             .read<ProfileBloc>()
//                             .add(OnGetProfileEvent(authBloc.uid));
//                         Navigator.pushReplacement(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) => const TabsPage()));
//                       }
//                     },
//                     child: state is ProfileLoadingState
//                         ? LoadingAnimationWidget.inkDrop(
//                             color: Colors.white, size: 30)
//                         : const Text(
//                             "Guardar informacion",
//                             style: TextStyle(color: Colors.white, fontSize: 20),
//                           ),
//                   ),
//                 ],
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
