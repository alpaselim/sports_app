import 'package:flutter/material.dart';
import 'package:sports_app/Data/app_constant.dart';
import 'package:sports_app/Data/models/standing_model.dart';

Widget formTableRow(List<PuanTablosu> puandurumu, int index) {
  TextStyle textStyle2 =
      const TextStyle(fontSize: 13, fontWeight: FontWeight.bold);
  String form = puandurumu[0].league.standings[0][index].form;
  List<Widget> widgets = [];

  for (int i = 0; i < form.length; i++) {
    if (form[i] == "W" || form[i] == "w") {
      widgets.add(Container(
        decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.circular(3.0),
        ),
        width: 15,
        height: 15,
        child: const Center(
          child: Text(
            'G',
            style: TextStyle(
              color: Colors.white,
              fontSize: 10,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ));
    } else if (form[i] == "L" || form[i] == "l") {
      widgets.add(Container(
        decoration: BoxDecoration(
          color: kRedColor,
          borderRadius: BorderRadius.circular(3.0),
        ),
        width: 15,
        height: 15,
        child: const Center(
          child: Text(
            'M',
            style: TextStyle(
              color: Colors.white,
              fontSize: 10,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ));
    } else if (form[i] == "D" || form[i] == "d") {
      widgets.add(Container(
        decoration: BoxDecoration(
          color: Colors.yellow,
          borderRadius: BorderRadius.circular(3.0),
        ),
        width: 15,
        height: 15,
        child: const Center(
          child: Text(
            'B',
            style: TextStyle(
              color: Colors.white,
              fontSize: 10,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ));
    }
    widgets.add(const SizedBox(
      width: 2,
    ));
  }

  return Container(
    width: double.infinity,
    height: 40,
    decoration: BoxDecoration(
      color: index.isEven ? kWhiteColor : kcustomWhiteColor,
    ),
    child: Row(
      children: [
        Container(
          //iinkwell
          alignment: Alignment.center,
          width: 30,
          height: 40,
          decoration: BoxDecoration(
            color: index.isEven ? kWhiteColor : kcustomWhiteColor,
          ),
          child: Text(
            (index + 1).toString(),
            style: const TextStyle(color: kBlackColor),
          ),
        ),
        const SizedBox(width: 10),
        Row(
          children: [
            Image.network(
              puandurumu[0].league.standings[0][index].team.logo,
              width: 24.0,
              height: 24.0,
            ),
            const SizedBox(width: 3),
            puandurumu[0].league.standings[0][index].team.name.length > 20
                ? Text(
                    '${puandurumu[0].league.standings[0][index].team.name.toString().substring(0, 11)}...')
                : Text(
                    puandurumu[0]
                        .league
                        .standings[0][index]
                        .team
                        .name
                        .toString(),
                    style: textStyle2),
          ],
        ),
        const Spacer(),
        SizedBox(
          width: 23,
          child: Text(
              (puandurumu[0].league.standings[0][index].all["played"])
                  .toString(),
              style: textStyle2),
        ),
        const SizedBox(
          width: 3,
        ),
        SizedBox(
          width: 23,
          child: Text(
              (puandurumu[0].league.standings[0][index].points).toString(),
              style: textStyle2),
        ),
        const SizedBox(
          width: 3,
        ),
        Center(
          child: Row(
            children: widgets,
          ),
        ),
        const SizedBox(
          width: 30,
        ),
      ],
    ),
  );
}
