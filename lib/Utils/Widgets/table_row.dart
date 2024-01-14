import 'package:flutter/material.dart';
import 'package:sports_app/Data/app_constant.dart';
import 'package:sports_app/Data/models/standing_model.dart';

Widget tableRow(List<PuanTablosu> puandurumu, int index) {
  // TextStyle textStyle = TextStyle(fontSize: 11, fontWeight: FontWeight.bold);
  TextStyle textStyle2 =
      const TextStyle(fontSize: 13, fontWeight: FontWeight.bold);
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
              (puandurumu[0].league.standings[0][index].all["win"]).toString(),
              style: textStyle2),
        ),
        const SizedBox(
          width: 3,
        ),
        SizedBox(
          width: 23,
          child: Text(
              (puandurumu[0].league.standings[0][index].all["draw"]).toString(),
              style: textStyle2),
        ),
        const SizedBox(
          width: 3,
        ),
        SizedBox(
          width: 23,
          child: Text(
              (puandurumu[0].league.standings[0][index].all["lose"]).toString(),
              style: textStyle2),
        ),
        const SizedBox(
          width: 3,
        ),
        SizedBox(
          width: 23,
          child: Text(
              (puandurumu[0].league.standings[0][index].all["goals"]["for"])
                  .toString(),
              style: textStyle2),
        ),
        const SizedBox(
          width: 3,
        ),
        SizedBox(
          width: 23,
          child: Text(
              (puandurumu[0].league.standings[0][index].all["goals"]["against"])
                  .toString(),
              style: textStyle2),
        ),
        const SizedBox(
          width: 3,
        ),
        SizedBox(
          width: 23,
          child: Text(
              (puandurumu[0].league.standings[0][index].all["goals"]["for"] -
                      puandurumu[0].league.standings[0][index].all["goals"]
                          ["against"])
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
      ],
    ),
  );
}
