import 'package:currency_converter/app/controllers/home_controller.dart';
import 'package:currency_converter/app/models/currency_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  final TextEditingController fromText = TextEditingController();
  final TextEditingController toText = TextEditingController();
  final homeContoller = HomeContoller(fromText: fromText, toText: toText);

  test('deve converter de real para dolar', () {
    fromText.text = '2.0';
    homeContoller.convert();
    expect(toText.text, '0.36');
  });

  test('deve converter de dólar para real', () {
    fromText.text = '2,0';
    homeContoller.fromCurrency = CurrencyModel(
        name: 'Dolar',
        sigla: 'USD',
        simbolo: '\$',
        description: 'Estados Unidos dólar',
        banner: 'assets/images/bandeira-estados-unidos.png',
        real: 4.95,
        dolar: 1,
        euro: 0.85);
    homeContoller.toCurrency = CurrencyModel(
        name: 'Real',
        description: 'Brasil real',
        sigla: 'BRA',
        simbolo: 'R\$',
        banner: 'assets/images/bandeira-brasil.png',
        real: 1.0,
        dolar: 0.20,
        euro: 0.15);

    homeContoller.convert();
    expect(toText.text, '9.90');
  });
}
