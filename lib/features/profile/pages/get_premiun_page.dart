import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:jayani_power/core/shared_preferences/preferences.dart';
import 'package:jayani_power/features/profile/bloc/profile_bloc.dart';
import 'package:jayani_power/repositories/user/user_repository_impl.dart';

class GetPremiumPage extends StatefulWidget {
  const GetPremiumPage({super.key});

  @override
  State<GetPremiumPage> createState() => _GetPremiumPageState();
}

class _GetPremiumPageState extends State<GetPremiumPage> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool isLightTheme = false;
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;
  bool useGlassMorphism = false;
  bool useBackgroundImage = false;
  bool useFloatingAnimation = true;
  void onCreditCardModelChange(CreditCardModel creditCardModel) {
    setState(() {
      cardNumber = creditCardModel.cardNumber;
      expiryDate = creditCardModel.expiryDate;
      cardHolderName = creditCardModel.cardHolderName;
      cvvCode = creditCardModel.cvvCode;
      isCvvFocused = creditCardModel.isCvvFocused;
    });
  }

  Widget build(BuildContext context) {
    const underlineInputBorder =
        UnderlineInputBorder(borderSide: BorderSide(color: Colors.white));
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            CreditCardWidget(
              cardNumber: cardNumber,
              expiryDate: expiryDate,
              cardHolderName: cardHolderName,
              cvvCode: cvvCode,
              showBackView: false,
              onCreditCardWidgetChange: (CreditCardBrand) {},
              bankName: "BANCO BNB",
              cardBgColor: Colors.black87,
              glassmorphismConfig: Glassmorphism.defaultConfig(),
              floatingConfig: const FloatingConfig(
                isGlareEnabled: true,
                isShadowEnabled: true,
                shadowConfig: FloatingShadowConfig(),
              ),
              backgroundImage: "assets/credit_card/card_bg.png",
              labelValidThru: 'VALID\nTHRU',
              obscureCardNumber: true,
              obscureInitialCardNumber: false,
              obscureCardCvv: true,
              cardType: CardType.mastercard,
              isHolderNameVisible: true,
              width: MediaQuery.of(context).size.width,
              isChipVisible: true,
              isSwipeGestureEnabled: true,
              frontCardBorder: Border.all(color: Colors.grey),
              backCardBorder: Border.all(color: Colors.grey),
            ),
            CreditCardForm(
              cardNumber: cardNumber,
              expiryDate: expiryDate,
              cardHolderName: cardHolderName,
              cvvCode: cvvCode,
              onCreditCardModelChange: onCreditCardModelChange,
              formKey: formKey,
              inputConfiguration: const InputConfiguration(
                cardHolderTextStyle: TextStyle(color: Colors.white),
                expiryDateTextStyle: TextStyle(color: Colors.white),
                cvvCodeTextStyle: TextStyle(color: Colors.white),
                cardNumberTextStyle: TextStyle(color: Colors.white),
                cardNumberDecoration: InputDecoration(
                  enabledBorder: underlineInputBorder,
                  focusedBorder: underlineInputBorder,
                  labelText: 'Numero de la tarjeta',
                  hintText: 'XXXX XXXX XXXX XXXX',
                  hintStyle: TextStyle(color: Colors.white),
                  labelStyle: TextStyle(color: Colors.white),
                ),
                expiryDateDecoration: InputDecoration(
                  enabledBorder: underlineInputBorder,
                  focusedBorder: underlineInputBorder,
                  labelText: 'Fecha de expiracion',
                  hintText: 'XX/XX',
                  hintStyle: TextStyle(color: Colors.white),
                  labelStyle: TextStyle(color: Colors.white),
                ),
                cvvCodeDecoration: InputDecoration(
                  enabledBorder: underlineInputBorder,
                  focusedBorder: underlineInputBorder,
                  labelText: 'CVV',
                  hintText: 'XXX',
                  hintStyle: TextStyle(color: Colors.white),
                  labelStyle: TextStyle(color: Colors.white),
                ),
                cardHolderDecoration: InputDecoration(
                  enabledBorder: underlineInputBorder,
                  focusedBorder: underlineInputBorder,
                  labelText: 'Nombre del propietario',
                  hintStyle: TextStyle(color: Colors.white),
                  labelStyle: TextStyle(color: Colors.white),
                ),
              ),
            ),
            const Spacer(),
            GestureDetector(
              onTap: () async {
                final userId = Preferences().userUUID;
                final changed =
                    await UserRepositoryImpl().changeToPremium(userId);
                if (changed) {
                  context.read<ProfileBloc>().add(OnGetProfileEvent(userId));
                  await Future.delayed(Duration(seconds: 2));
                  Navigator.pop(context);
                }
              },
              child: Container(
                height: 60,
                width: MediaQuery.of(context).size.width * 0.9,
                decoration: BoxDecoration(
                  color: const Color(0xffFF004D),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Center(
                  child: Text(
                    "Guardar Tarjeta",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
