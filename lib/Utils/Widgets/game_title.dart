import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sports_app/Data/app_constant.dart';
import 'package:sports_app/Data/models/basketball_game_model.dart';

Widget gameTitle(BasketballGamesModel match) {
  var homeScore = match.scores.home.total;
  var awayScore = match.scores.away.total;
  var winnerHomeTeam = match.home.winner;
  winnerHomeTeam ??= false;
  var winnerAwayTeam = match.away.winner;
  winnerAwayTeam ??= false;

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
    status = "${match.status.short} ${match.status.timer ?? ""} ";
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
                match.home.name,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: kBlackColor,
                  fontSize: 13.0,
                  fontWeight:
                      winnerHomeTeam ? FontWeight.bold : FontWeight.normal,
                ),
              ),
            ),
            Image.network(
              match.home.logoUrl,
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
              match.away.logoUrl,
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
                match.away.name,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: kBlackColor,
                  fontSize: 13.0,
                  fontWeight:
                      winnerAwayTeam ? FontWeight.bold : FontWeight.normal,
                ),
              ),
            ),
          ],
        ),
      ),
    ],
  );
}

Text statuCheck(String status, Color statusColor) {
  return Text(
    status,
    style: TextStyle(
      color: statusColor,
      fontSize: 13.0,
      fontWeight: FontWeight.bold,
    ),
  );
}

Widget scorBoard(int? homeScore, int? awayScore, BasketballGamesModel match) {
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
