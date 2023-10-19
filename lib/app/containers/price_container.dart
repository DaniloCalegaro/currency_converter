import 'package:currency_converter/app/models/currency_model.dart';
import 'package:flutter/material.dart';

class PriceContainer extends StatelessWidget {
  final CurrencyModel selectedItem;
  final TextEditingController controller;

  const PriceContainer({
    super.key,
    required this.selectedItem,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          SizedBox(
            width: 200,
            child: Align(
              alignment: Alignment.centerLeft,
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Row(children: [
                  Text(
                    '${selectedItem.simbolo} ',
                    style: const TextStyle(
                      fontFamily: 'Sora',
                      fontWeight: FontWeight.w600,
                      color: Colors.black38,
                      fontSize: 36,
                    ),
                  ),
                  Text(controller.text,
                      style: const TextStyle(
                          fontFamily: 'Sora',
                          color: Colors.black,
                          fontSize: 36))
                ]),
              ),
            ),
          ),
          Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
            Row(
              children: [
                Text(
                  selectedItem.name,
                  style: const TextStyle(
                      fontWeight: FontWeight.w700, fontSize: 16),
                ),
                const SizedBox(width: 8),
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    selectedItem.banner,
                    width: 42,
                  ),
                ),
              ],
            ),
            Text(
              selectedItem.description,
              style: const TextStyle(color: Colors.black45),
            ),
          ])
        ]),
      ],
    );
  }
}
