import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sports_app/Data/app_constant.dart';
import 'package:sports_app/Data/models/live_score_model.dart';

Widget matchTitle(LiveScore match) {
  var homeGoal = match.goal.home;
  var awayGoal = match.goal.away;
  var winnerHomeTeam = match.home.winner;
  winnerHomeTeam ??= false;
  var winnerAwayTeam = match.away.winner;
  winnerAwayTeam ??= false;

  String status = match.fixture.status.short;
  Color statusColor = kBlackColor;

  String dateStr = match.fixture.date;
  DateTime dateTime = DateTime.parse(dateStr).add(const Duration(hours: 3));
  String startTime = DateFormat('HH:mm').format(dateTime);

  if (match.fixture.status.short == "NS") {
    status = startTime;
  } else if (status == "1H" || status == "2H") {
    status = "${match.fixture.status.elapsedTime}'";
    statusColor = kRedColor;
  } else {
    status = match.fixture.status.short;
  }

  return Column(
    children: [
      Container(
        color: kLabelColor,
        height: 25,
        child: Row(
          children: [
            Image.network(
              match.league.logoUrl,
              width: 20,
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
            const SizedBox(
              width: 15,
            ),
            Text(
              "${match.league.country} - ${match.league.name} ",
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
            SizedBox(
              width: 40,
              child: statuCheck(status, statusColor),
            ),
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
            scorBoard(homeGoal, awayGoal),
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

Widget scorBoard(int? homeGoal, int? awayGoal) {
  if (homeGoal == null && awayGoal == null) {
    return const Text(
      "v   ",
      textAlign: TextAlign.center,
      style: TextStyle(
        color: kBlackColor,
        fontSize: 13.0,
        fontWeight: FontWeight.bold,
      ),
    );
  } else {
    return Text(
      "$homeGoal - $awayGoal",
      textAlign: TextAlign.center,
      style: const TextStyle(
        color: kBlackColor,
        fontSize: 13.0,
      ),
    );
  }
}
