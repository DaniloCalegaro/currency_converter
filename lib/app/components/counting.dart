
import 'package:currency_converter/app/containers/modal_currencies.dart';
import 'package:currency_converter/app/models/currency_model.dart';
import 'package:currency_converter/util/colorApp.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Counting extends StatefulWidget {
  final List<CurrencyModel> currencies;
  final CurrencyModel selectedItemFrom;
  final CurrencyModel selectedItemTo;
  final void Function(CurrencyModel) setStateCurrencyFrom;
  final void Function(CurrencyModel) setStateCurrencyTo;

  const Counting({
    super.key,
    required this.currencies,
    required this.selectedItemFrom,
    required this.selectedItemTo,
    required this.setStateCurrencyFrom,
    required this.setStateCurrencyTo,
  });

  @override
  State<Counting> createState() => _CountingState();
}

class _CountingState extends State<Counting> {
  String currentDate = '';

  @override
  void initState() {
    super.initState();
    getCurrentDate();
  }

  void getCurrentDate() {
    setState(() {
      currentDate = DateFormat('dd/MM/yyyy - kk:mm:ss').format(DateTime.now());
    });
  }

  String getValueConvert() {
    String selectedItemTo = widget.selectedItemTo.name;
    CurrencyModel selectedItemFrom = widget.selectedItemFrom;
    double value = 0;

    switch (selectedItemTo) {
      case 'Real':
        value = selectedItemFrom.real;
        break;
      case 'Dolar':
        value = selectedItemFrom.dolar;
        break;
      case 'Euro':
        value = selectedItemFrom.euro;
        break;
    }
    return value.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 80,
      margin: const EdgeInsets.all(25),
      child: DecoratedBox(
        decoration: BoxDecoration(
            color: colorBlueMedium, borderRadius: BorderRadius.circular(30)),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          TextButton(
            onPressed: () {
              modalCurrencies(
                context: context,
                currencies: widget.currencies,
                selectedFrom: widget.selectedItemFrom,
                selectedTo: widget.selectedItemTo,
                onChangedFrom: (model) {
                  if (model != null) {
                    widget.setStateCurrencyFrom(model);
                  }
                },
                onChangedTo: (model) {
                  if (model != null) {
                    widget.setStateCurrencyTo(model);
                  }
                },
              );
            },
            child: const Icon(Icons.auto_graph, color: Colors.white),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                currentDate,
                style: const TextStyle(color: Colors.white, fontSize: 12),
              ),
              Row(
                children: [
                  Text(
                    '1 ${widget.selectedItemFrom.sigla}',
                    style: const TextStyle(color: colorBlueLight, fontSize: 16),
                  ),
                  const Text(
                    ' = ',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  Text(
                    '${getValueConvert()} ${widget.selectedItemTo.sigla}',
                    style: const TextStyle(color: colorGreen, fontSize: 16),
                  ),
                ],
              )
            ],
          ),
          TextButton(
            onPressed: () {
              getCurrentDate();
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('Informação'),
                      content: const Text(
                          'Esta funcionalidade não sincroniza com o servidor de contações. Será implementada futuramente.'),
                      actions: <Widget>[
                        TextButton(
                          style: TextButton.styleFrom(
                            textStyle: Theme.of(context).textTheme.labelLarge,
                            foregroundColor: Colors.white,
                            backgroundColor: colorBlueDark,
                          ),
                          child: const Text("Confirmar"),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        )
                      ],
                    );
                  });
            },
            child: const Icon(Icons.autorenew, color: Colors.white),
          ),
        ]),
      ),
    );
  }
}
