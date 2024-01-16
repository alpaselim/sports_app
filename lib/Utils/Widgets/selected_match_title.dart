import 'package:flutter/material.dart';
import 'package:sports_app/Data/app_constant.dart';
import 'package:sports_app/Data/models/live_score_model.dart';
import 'package:intl/intl.dart';

Widget selectedMatchTitle(LiveScore match) {
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
  String status = "";
  String dateStr = match.fixture.date;
  DateTime dateTime = DateTime.parse(dateStr).add(const Duration(hours: 3));
  String startTime = DateFormat('HH:mm').format(dateTime);

  if (match.fixture.status.short == "NS") {
    status = startTime;
  } else if (status == "1H" || status == "2H") {
    status = "${match.fixture.status.elapsedTime}'";
  } else {
    status = match.fixture.status.short;
  }

  return Container(
    margin: const EdgeInsets.symmetric(vertical: 1),
    child: Row(
      children: [
        const SizedBox(
          width: 2,
        ),
        // Sol taraftaki takım
        Image.network(
          match.home.logoUrl,
          width: 40,
          errorBuilder:
              (BuildContext context, Object error, StackTrace? stackTrace) {
            return Image.network(
              'https://media.api-sports.io/volley/teams/1043.png',
              width: 24,
              height: 24,
            );
          },
        ),

        const SizedBox(
          width: 10,
        ),

        Text(
          match.home.name.toUpperCase(),
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: kBlackColor,
            fontSize: 14,
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
                  fontSize: 13.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "$homeGoal - $awayGoal",
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: kBlackColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              Text(
                "(İY $halftimeHomeGoal-$halftimeAwayGoal)",
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: kBlackColor,
                  fontSize: 11.0,
                ),
              ),
            ],
          ),
        ),

        // Sağ taraftaki takım

        Text(
          match.away.name.toUpperCase(),
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: kBlackColor,
            fontSize: 14,
          ),
        ),

        const SizedBox(
          width: 10,
        ),
        Image.network(
          match.away.logoUrl,
          width: 40,
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
          width: 2,
        ),
      ],
    ),
  );
}
