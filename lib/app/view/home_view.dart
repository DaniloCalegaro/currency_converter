import 'package:currency_converter/app/components/counting.dart';
import 'package:currency_converter/app/containers/keyboard_container.dart';
import 'package:currency_converter/app/containers/price_container.dart';
import 'package:currency_converter/app/controllers/home_controller.dart';
import 'package:currency_converter/app/models/currency_model.dart';
import 'package:currency_converter/util/colorApp.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final TextEditingController fromText = TextEditingController(text: '1');

  final TextEditingController toText = TextEditingController();

  late HomeContoller homeController;

  @override
  void initState() {
    super.initState();
    homeController = HomeContoller(fromText: fromText, toText: toText);

    homeController.convert();
  }

  void setFromText(String key) {
    String textFrom = fromText.text;
    String textTo = toText.text;

    if (key == 'C') {
      textFrom = '0';
      textTo = '0';
    } else if (key == 'V') {
      if (textFrom != '0' && textFrom.isNotEmpty) {
        textFrom = textFrom.substring(0, textFrom.length - 1);
      }

      if (textFrom.isEmpty) {
        textFrom = '0';
        textTo = '0';
      }
    } else {
      if (fromText.text == '0') {
        textFrom = key;
      } else {
        textFrom = textFrom + key;
      }
    }

    setState(() {
      fromText.text = textFrom;
      toText.text = textTo;
    });

    if (textFrom != '0') {
      homeController.convert();
    }
  }

  void setStateCurrencyFrom(CurrencyModel modelFrom) {
    setState(() {
      homeController.fromCurrency = modelFrom;
    });
    homeController.convert();
  }

  void setStateCurrencyTo(CurrencyModel modelTo) {
    setState(() {
      homeController.toCurrency = modelTo;
    });
    homeController.convert();
  }

  void reverseCorrentiesFromTo() {
    CurrencyModel fromCurrency = homeController.fromCurrency;
    CurrencyModel toCurrency = homeController.toCurrency;

    setState(() {
      homeController.fromCurrency = toCurrency;
      homeController.toCurrency = fromCurrency;
    });
    homeController.convert();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Counting(
                currencies: homeController.currencies,
                selectedItemFrom: homeController.fromCurrency,
                selectedItemTo: homeController.toCurrency,
                setStateCurrencyFrom: setStateCurrencyFrom,
                setStateCurrencyTo: setStateCurrencyTo),
            Expanded(child: Container()),
            Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 200,
                  padding: const EdgeInsets.all(30),
                  decoration: const BoxDecoration(
                      color: colorBlueLight,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(50),
                          topRight: Radius.circular(50)),
                      boxShadow: [
                        BoxShadow(
                            color: Color.fromARGB(50, 0, 0, 0),
                            spreadRadius: 5,
                            blurRadius: 20,
                            offset: Offset(0, 0))
                      ]),
                  child: PriceContainer(
                      controller: fromText,
                      selectedItem: homeController.fromCurrency),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 120),
                  width: MediaQuery.of(context).size.width,
                  height: 200,
                  padding: const EdgeInsets.all(30),
                  decoration: const BoxDecoration(
                      color: colorGreen,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(50),
                          topRight: Radius.circular(50)),
                      boxShadow: [
                        BoxShadow(
                            color: Color.fromARGB(50, 0, 0, 0),
                            spreadRadius: 5,
                            blurRadius: 20,
                            offset: Offset(0, 0))
                      ]),
                  child: PriceContainer(
                      controller: toText,
                      selectedItem: homeController.toCurrency),
                ),
                Align(
                  alignment: Alignment.center,
                  child: InkWell(
                    onTap: reverseCorrentiesFromTo,
                    child: Container(
                      width: 50,
                      height: 50,
                      margin: const EdgeInsets.only(top: 95),
                      decoration: BoxDecoration(
                        color: colorBlueDark,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: const [
                          BoxShadow(
                              color: Color.fromARGB(50, 0, 0, 0),
                              spreadRadius: 3,
                              blurRadius: 5,
                              offset: Offset(0, 0))
                        ],
                      ),
                      child: Transform.rotate(
                        angle: 90 * math.pi / 180,
                        child: const Icon(
                          Icons.repeat,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 240),
                  width: MediaQuery.of(context).size.width,
                  height: 420,
                  decoration: const BoxDecoration(
                      color: colorBlueDark,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(50),
                          topRight: Radius.circular(50)),
                      boxShadow: [
                        BoxShadow(
                            color: Color.fromARGB(50, 0, 0, 0),
                            spreadRadius: 5,
                            blurRadius: 20,
                            offset: Offset(0, 0))
                      ]),
                  child: Keyboard(setFromText: setFromText),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
