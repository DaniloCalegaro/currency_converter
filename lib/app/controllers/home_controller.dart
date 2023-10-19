import 'package:currency_converter/app/models/currency_model.dart';
import 'package:flutter/material.dart';

class HomeContoller {
  late List<CurrencyModel> currencies;
  late CurrencyModel fromCurrency;
  late CurrencyModel toCurrency;

  final TextEditingController toText;
  final TextEditingController fromText;

  HomeContoller({required this.toText, required this.fromText}) {
    currencies = CurrencyModel.getCurrencies();
    fromCurrency = currencies[0];
    toCurrency = currencies[1];
  }

  void convert() {
    double value = double.tryParse(fromText.text.replaceAll(',', '.')) ?? 1.00;
    double convertedValue = 0;

    switch (toCurrency.name) {
      case 'Real':
        convertedValue = value * fromCurrency.real;
        break;
      case 'Dolar':
        convertedValue = value * fromCurrency.dolar;
        break;
      case 'Euro':
        convertedValue = value * fromCurrency.euro;
        break;
    }

    toText.text = convertedValue.toStringAsFixed(2);
  }
}
