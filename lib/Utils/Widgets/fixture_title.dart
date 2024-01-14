import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sports_app/Data/app_constant.dart';
import 'package:sports_app/Data/models/live_score_model.dart';

Widget fixturetitle(LiveScore match) {
  var homeGoal = match.goal.home;
  var awayGoal = match.goal.away;
  var winnerHomeTeam = match.home.winner;
  winnerHomeTeam ??= false;
  var winnerAwayTeam = match.away.winner;
  winnerAwayTeam ??= false;

  String status;
  Color statusColor = kBlackColor;

  String dateStr = match.fixture.date;
  DateTime dateTime = DateTime.parse(dateStr).add(const Duration(hours: 3));

  String startTime = DateFormat('HH:mm').format(dateTime);

  String datePart = dateStr.split('T')[0];

  if (match.fixture.status.short == "FT") {
    status = "MS";
  } else if (match.fixture.status.short == "NS") {
    status = startTime;
  } else if (match.fixture.status.short == "HT") {
    status = "DA";
  } else if (match.fixture.status.short == "PEN") {
    status = "PEN";
  } else if (match.fixture.status.short == "TBD") {
    status = "TBD";
  } else if (match.fixture.status.short == "PST") {
    status = "ERT";
  } else {
    status = "${match.fixture.status.elapsedTime}'";
    statusColor = kRedColor;
  }

  return Column(
    children: [
      Container(
        alignment: Alignment.centerLeft,
        color: kLabelColor,
        height: 25,
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Text(
            datePart,
            style: const TextStyle(
              color: kWhiteColor,
            ),
          ),
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
      "$homeGoal - $awayGoal",
      textAlign: TextAlign.center,
      style: const TextStyle(
        color: kBlackColor,
        fontSize: 13.0,
      ),
    );
  }
}
