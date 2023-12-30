import 'package:flutter/material.dart';
import 'package:sports_app/Data/app_constant.dart';

Widget topRow() {
  TextStyle textStyle = const TextStyle(
      fontSize: 13, fontWeight: FontWeight.bold, color: kWhiteColor);
  //TextStyle textStyle2 = TextStyle(fontSize: 13);
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
            child: const Text('Takım', style: TextStyle(color: kWhiteColor))),
        const Spacer(),
        SizedBox(
          width: 23,
          child: Text('O', style: textStyle),
        ),
        const SizedBox(
          width: 3,
        ),
        SizedBox(
          width: 23,
          child: Text('G', style: textStyle),
        ),
        const SizedBox(
          width: 3,
        ),
        SizedBox(
          width: 23,
          child: Text('B', style: textStyle),
        ),
        const SizedBox(
          width: 3,
        ),
        SizedBox(
          width: 23,
          child: Text('M', style: textStyle),
        ),
        const SizedBox(
          width: 3,
        ),
        SizedBox(
          width: 23,
          child: Text('A', style: textStyle),
        ),
        const SizedBox(
          width: 3,
        ),
        SizedBox(
          width: 23,
          child: Text('Y', style: textStyle),
        ),
        const SizedBox(
          width: 3,
        ),
        SizedBox(
          width: 23,
          child: Text('AV', style: textStyle),
        ),
        const SizedBox(
          width: 3,
        ),
        SizedBox(
          width: 23,
          child: Text('P', style: textStyle),
        ),
        const SizedBox(
          width: 3,
        ),
      ],
    ),
  );
}
