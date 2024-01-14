import 'package:flutter/material.dart';
import 'package:sports_app/Data/app_constant.dart';

Widget formTopRow() {
  TextStyle textStyle = const TextStyle(
      fontSize: 13, fontWeight: FontWeight.bold, color: kWhiteColor);

  return Container(
    height: 28,
    decoration: const BoxDecoration(color: kLabelColor),
    child: Row(
      children: [
        Container(
          alignment: Alignment.center,
          width: 30,
          height: 30,
          child: const Text(
            'Sıra',
            style: TextStyle(color: kWhiteColor),
          ),
        ),
        const SizedBox(width: 20),
        Container(
          alignment: Alignment.center,
          child: const Text(
            'Takım',
            style: TextStyle(color: kWhiteColor),
          ),
        ),
        const SizedBox(
          width: 158,
        ),
        SizedBox(
          width: 25,
          child: Text('O', style: textStyle),
        ),
        const SizedBox(
          width: 3,
        ),
        SizedBox(
          width: 30,
          child: Text('P', style: textStyle),
        ),
        const SizedBox(
          width: 3,
        ),
        SizedBox(
          width: 60,
          child: Text('Form', style: textStyle),
        ),
        const SizedBox(
          width: 30,
        ),
      ],
    ),
  );
}
