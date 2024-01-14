import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sports_app/Data/app_constant.dart';
import 'package:sports_app/Data/models/volleyball_game_model.dart';

Widget volleyballGameTitle(VolleyballGamesModel match) {
  var homeScore = match.scores.home;
  var awayScore = match.scores.away;

  String status;
  Color statusColor = kBlackColor;

  String dateStr = match.date;
  DateTime dateTime = DateTime.parse(dateStr).add(const Duration(hours: 3));

  String startTime = DateFormat('HH:mm').format(dateTime);

  if (match.status.short == "FT") {
    status = "MS";
  } else if (match.status.short == "NS") {
    status = startTime;
  } else if (match.status.short == "HT") {
    status = "DA";
  } else if (match.status.short == "PEN") {
    status = "PEN";
  } else if (match.status.short == "AOT") {
    status = "UZ";
  } else if (match.status.short == "PST") {
    status = "ERT";
  } else {
    status = "${match.status.short} ${match.status.short}'";
    statusColor = kRedColor;
  }

  return Column(
    children: [
      Container(
        color: kLabelColor,
        height: 25,
        child: Row(
          children: [
            Image.network(
              match.league.logo,
              width: 20,
            ),
            const SizedBox(
              width: 15,
            ),
            Text(
              "${match.country.name} - ${match.league.name} ",
              style: const TextStyle(color: kWhiteColor),
            ),
          ],
        ),
      ),
      Container(
        color: const Color.fromARGB(255, 230, 230, 230),
        margin: const EdgeInsets.symmetric(vertical: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              width: 5,
            ),
            statuCheck(status, statusColor),
            Expanded(
              child: Text(
                match.teams.home.name,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: kBlackColor,
                  fontSize: 13.0,
                ),
              ),
            ),
            Image.network(
              match.teams.home.logo,
              width: 24,
              height: 24,
              errorBuilder:
                  (BuildContext context, Object error, StackTrace? stackTrace) {
                // Hata durumunda gösterilecek default resmi belirtin.
                return Image.network(
                  'https://media.api-sports.io/volley/teams/1043.png',
                  width: 24,
                  height: 24,
                );
              },
            ),
            const SizedBox(width: 2),
            scorBoard(homeScore, awayScore, match),
            const SizedBox(width: 3.5),
            Image.network(
              match.teams.away.logo,
              width: 24,
              height: 24,
              errorBuilder:
                  (BuildContext context, Object error, StackTrace? stackTrace) {
                // Hata durumunda gösterilecek default resmi belirtin.
                return Image.network(
                  'https://media.api-sports.io/volley/teams/1043.png',
                  width: 24,
                  height: 24,
                );
              },
            ),
            Expanded(
              child: Text(
                match.teams.away.name,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: kBlackColor,
                  fontSize: 13.0,
                ),
              ),
            ),
          ],
        ),
      ),
    ],
  );
}

Text statuCheck(var status, Color statusColor) {
  return Text(
    "$status",
    style: TextStyle(
      color: statusColor,
      fontSize: 13.0,
      fontWeight: FontWeight.bold,
    ),
  );
}

Widget scorBoard(int? homeScore, int? awayScore, VolleyballGamesModel match) {
  if (match.status.short == "NS") {
    return const Text(
      " v ",
      textAlign: TextAlign.center,
      style: TextStyle(
        color: kBlackColor,
        fontSize: 13.0,
        fontWeight: FontWeight.bold,
      ),
    );
  } else {
    return Text(
      "$homeScore - $awayScore",
      textAlign: TextAlign.center,
      style: const TextStyle(
        color: kBlackColor,
        fontSize: 13.0,
      ),
    );
  }
}
