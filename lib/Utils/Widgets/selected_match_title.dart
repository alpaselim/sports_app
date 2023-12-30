import 'package:flutter/material.dart';
import 'package:sports_app/Data/app_constant.dart';
import 'package:sports_app/Data/models/live_score_model.dart';
import 'package:intl/intl.dart';

Widget selectedMatchTitle(LiveScore match) {
  //var homeGoal = match.goal.home;
  //var awayGoal = match.goal.away;
  //String originalDateTimeString = match.fixture.date;
  //String datePart = originalDateTimeString.split('T')[0];
  var halftimeHomeGoal = match.halfTime.home;
  var halftimeAwayGoal = match.halfTime.away;
  var homeGoal = match.goal.home;
  var awayGoal = match.goal.away;
  homeGoal ??= 0;
  awayGoal ??= 0;
  var winnerHomeTeam = match.home.winner;
  winnerHomeTeam ??= false;
  var winnerAwayTeam = match.away.winner;
  winnerAwayTeam ??= false;
  String status = '';
  String dateStr = match.fixture.date;
  DateTime dateTime = DateTime.parse(dateStr).add(const Duration(hours: 3));
  String startTime = DateFormat('HH:mm').format(dateTime);

  if (match.fixture.status.short == "FT") {
    status = "MS";
  } else if (match.fixture.status.short == "NS") {
    status = startTime;
  } else if (match.fixture.status.short == "HT") {
    status = "DA";
  } else if (match.fixture.status.short == "PEN") {
    status = "PEN";
  } else {
    status = "${match.fixture.status.elapsedTime}'";
  }

  return Container(
    margin: const EdgeInsets.symmetric(vertical: 1),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      // crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(
          width: 2,
        ),
        // Sol taraftaki takım
        Image.network(
          match.home.logoUrl,
          width: 40,
        ),

        Expanded(
          child: Text(
            match.home.name.toUpperCase(),
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 12.0,
            ),
          ),
        ),

        // Orta sütun
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                status,
                style: const TextStyle(
                  color: Colors.red,
                  fontSize: 13.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "$homeGoal - $awayGoal",
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                ),
              ),
              Text(
                "(İY $halftimeHomeGoal-$halftimeAwayGoal)",
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: kBlackColor,
                  // fontWeight: FontWeight.bold,
                  fontSize: 11.0,
                ),
              ),
            ],
          ),
        ),

        // Sağ taraftaki takım

        Expanded(
          child: Text(
            match.away.name.toUpperCase(),
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: kBlackColor,
              fontSize: 12.0,
            ),
          ),
        ),

        Image.network(
          match.away.logoUrl,
          width: 40,
        ),
        const SizedBox(
          width: 2,
        ),
      ],
    ),
  );
}
