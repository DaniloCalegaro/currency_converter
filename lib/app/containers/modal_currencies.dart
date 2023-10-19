import 'package:currency_converter/app/models/currency_model.dart';
import 'package:currency_converter/util/colorApp.dart';
import 'package:flutter/material.dart';

Future<dynamic> modalCurrencies(
    {required BuildContext context,
    required List<CurrencyModel> currencies,
    required CurrencyModel selectedFrom,
    required CurrencyModel selectedTo,
    required void Function(CurrencyModel? model) onChangedFrom,
    required void Function(CurrencyModel? model) onChangedTo}) {
  return showModalBottomSheet(
      context: context,
      useSafeArea: true,
      builder: (BuildContext context) {
        return StatefulBuilder(builder: ((context, setState) {
          return Container(
              width: MediaQuery.of(context).size.width,
              height: 300,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30))),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    const Text('Selecione a converção desejada',
                        style: TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 18)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                          child: DropdownButton<CurrencyModel>(
                            underline:
                                Container(height: 1, color: colorBlueDark),
                            isExpanded: true,
                            value: selectedFrom,
                            items: currencies
                                .map((e) => DropdownMenuItem(
                                    value: e, child: Text(e.name)))
                                .toList(),
                            onChanged: (currency) {
                              onChangedFrom(currency);
                              if (currency != null) {
                                setState(() {
                                  selectedFrom = currency;
                                });
                              }
                            },
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(20),
                          child: Icon(
                            Icons.arrow_forward_rounded,
                            color: Colors.black,
                          ),
                        ),
                        Expanded(
                          child: DropdownButton<CurrencyModel>(
                            underline:
                                Container(height: 1, color: colorBlueDark),
                            isExpanded: true,
                            value: selectedTo,
                            items: currencies
                                .map((e) => DropdownMenuItem(
                                    value: e, child: Text(e.name)))
                                .toList(),
                            onChanged: (currency) {
                              onChangedTo(currency);
                              if (currency != null) {
                                setState(() {
                                  selectedTo = currency;
                                });
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                    ElevatedButton(
                      onPressed: () => Navigator.pop(context),
                      style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: colorBlueDark),
                      child: const Text('Fechar'),
                    ),
                  ],
                ),
              ));
        }));
      });
}
