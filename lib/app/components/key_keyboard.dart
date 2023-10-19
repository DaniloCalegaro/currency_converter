import 'package:flutter/material.dart';

class KeyKeyboard extends StatelessWidget {
  final String textKey;
  final Color color;
  final IconData? icon;
  final void Function() onChange;

  const KeyKeyboard(
      {super.key,
      required this.textKey,
      required this.color,
      this.icon,
      required this.onChange});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
      margin: const EdgeInsets.all(4),
      height: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          boxShadow: const [
            BoxShadow(
                color: Color.fromARGB(50, 0, 0, 0),
                spreadRadius: 0,
                blurRadius: 4,
                offset: Offset(0, 2))
          ]),
      child: ElevatedButton(
        onPressed: onChange,
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              textKey,
              style: const TextStyle(
                  fontFamily: 'Sora',
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                  fontSize: 21),
            ),
            icon != null
                ? Icon(
                    icon,
                    size: 28,
                    color: Colors.white,
                  )
                : Container()
          ],
        ),
      ),
    ));
  }
}
