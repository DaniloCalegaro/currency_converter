import 'package:currency_converter/app/components/key_keyboard.dart';
import 'package:currency_converter/util/colorApp.dart';
import 'package:flutter/material.dart';

class Keyboard extends StatelessWidget {
  final void Function(String) setFromText;
  const Keyboard({super.key, required this.setFromText});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(18),
      child: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                KeyKeyboard(
                  textKey: 'C',
                  color: Colors.black,
                  onChange: () => {setFromText('C')},
                ),
                KeyKeyboard(
                  textKey: '',
                  icon: Icons.arrow_back_rounded,
                  color: Colors.black,
                  onChange: () => {setFromText('V')},
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                KeyKeyboard(
                  textKey: '7',
                  color: colorBlueMedium,
                  onChange: () => {setFromText('7')},
                ),
                KeyKeyboard(
                  textKey: '8',
                  color: colorBlueMedium,
                  onChange: () => {setFromText('8')},
                ),
                KeyKeyboard(
                  textKey: '9',
                  color: colorBlueMedium,
                  onChange: () => {setFromText('9')},
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                KeyKeyboard(
                  textKey: '4',
                  color: colorBlueMedium,
                  onChange: () => {setFromText('4')},
                ),
                KeyKeyboard(
                  textKey: '5',
                  color: colorBlueMedium,
                  onChange: () => {setFromText('5')},
                ),
                KeyKeyboard(
                  textKey: '6',
                  color: colorBlueMedium,
                  onChange: () => {setFromText('6')},
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                KeyKeyboard(
                  textKey: '1',
                  color: colorBlueMedium,
                  onChange: () => {setFromText('1')},
                ),
                KeyKeyboard(
                  textKey: '2',
                  color: colorBlueMedium,
                  onChange: () => {setFromText('2')},
                ),
                KeyKeyboard(
                  textKey: '3',
                  color: colorBlueMedium,
                  onChange: () => {setFromText('3')},
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                KeyKeyboard(
                  textKey: '0',
                  color: colorBlueMedium,
                  onChange: () => {setFromText('0')},
                ),
                KeyKeyboard(
                  textKey: '.',
                  color: colorBlueMedium,
                  onChange: () => {setFromText('.')},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
