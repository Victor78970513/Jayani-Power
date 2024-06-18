import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jayani_power/core/shared_preferences/preferences.dart';
import 'package:jayani_power/features/custom_plans/pages/custom_plans_page.dart';
import 'package:jayani_power/features/home/pages/home_page.dart';
import 'package:jayani_power/features/profile/bloc/cubit/get_new_user_data_cubit.dart';
import 'package:jayani_power/features/profile/bloc/profile_bloc.dart';
import 'package:jayani_power/features/profile/pages/profile_page.dart';
import 'package:jayani_power/features/profile/widgets/edit_profile_field.dart';
import 'package:jayani_power/features/social_media/pages/social_media_page.dart';
import 'package:jayani_power/features/tabs/cubit/navbar_cubit.dart';
import 'package:jayani_power/features/tabs/widgets/tabs_nav_bar.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class TabsPage extends StatefulWidget {
  final bool isNewUser;
  const TabsPage({super.key, required this.isNewUser});

  @override
  State<TabsPage> createState() => _TabsPageState();
}

class _TabsPageState extends State<TabsPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (widget.isNewUser) {
        getDataFromNewUser(context: context);
      } else {
        final userId = Preferences().userUUID;
        context.read<ProfileBloc>().add(OnGetProfileEvent(userId));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavbarCubit, int>(
      builder: (context, state) {
        return Scaffold(
          body: Stack(
            fit: StackFit.expand,
            children: [
              IndexedStack(
                index: state,
                children: const [
                  HomePage(),
                  CustomoPlansPage(),
                  SocialMedaPage(),
                  ProfilePage(),
                ],
              ),
              const Align(
                alignment: Alignment.bottomCenter,
                child: TabsNavBar(),
              ),
            ],
          ),
        );
      },
    );
  }
}

void getDataFromNewUser({
  required BuildContext context,
}) {
  final TextEditingController ageCtrl = TextEditingController();
  final TextEditingController weightCtrl = TextEditingController();
  final TextEditingController heaightCtrl = TextEditingController();
  final TextEditingController physicalCtrl = TextEditingController();
  final TextEditingController foodResCtrl = TextEditingController();
  final TextEditingController goalCtrl = TextEditingController();
  final TextEditingController genderCtrl = TextEditingController();
  //
  final userUid = Preferences().userUUID;
  showModalBottomSheet(
    isDismissible: false,
    isScrollControlled: true,
    backgroundColor: const Color(0xff252935),
    context: context,
    builder: (context) {
      return BlocConsumer<GetNewUserDataCubit, GetNewUserDataState>(
        listener: (context, state) {
          if (state is GetNewUserDataSucess) {
            Navigator.pop(context);
            context.read<ProfileBloc>().add(OnGetProfileEvent(userUid));
          }
        },
        builder: (context, state) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.8,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  const Text(
                    "Llena los campos porfavor",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  const SizedBox(height: 20),
                  EditTextField(
                    title: "Edad",
                    controller: ageCtrl,
                    keyboardType: TextInputType.number,
                  ),
                  EditTextField(
                    title: "Peso",
                    controller: weightCtrl,
                    keyboardType: TextInputType.number,
                  ),
                  EditTextField(title: "Altura", controller: heaightCtrl),
                  EditTextField(title: "Genero", controller: genderCtrl),
                  EditTextField(
                      title: "Restricciones fisicas", controller: physicalCtrl),
                  EditTextField(
                      title: "Restricciones alimentarias",
                      controller: foodResCtrl),
                  EditTextField(title: "Objetivo", controller: goalCtrl),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(300, 50),
                      backgroundColor: const Color(0xffFF004D),
                    ),
                    onPressed: state is GetNewUserDataLoading
                        ? () {}
                        : () {
                            context.read<GetNewUserDataCubit>().setData(
                                  uid: userUid,
                                  age: int.parse(ageCtrl.text),
                                  height: double.parse(heaightCtrl.text),
                                  weight: double.parse(weightCtrl.text),
                                  gender: genderCtrl.text,
                                  physicalLimitations: physicalCtrl.text,
                                  foodRestrictions: foodResCtrl.text,
                                  goal: goalCtrl.text,
                                );
                          },
                    child: state is GetNewUserDataLoading
                        ? Padding(
                            padding: const EdgeInsets.all(0.0),
                            child: LoadingAnimationWidget.inkDrop(
                                color: const Color(0xffFF004D), size: 20))
                        : const Text(
                            "Guardar",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                  ),
                  const SizedBox(height: 80),
                ],
              ),
            ),
          );
        },
      );
    },
  );
}
