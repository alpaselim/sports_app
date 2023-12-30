import 'package:flutter/material.dart';
import 'package:sports_app/Data/app_constant.dart';
import 'package:sports_app/Data/models/live_score_model.dart';

Widget matchTitle(LiveScore match) {
  var homeGoal = match.goal.home;
  var awayGoal = match.goal.away;
  var elapsed = match.fixture.status.elapsedTime;
  //String originalDateTimeString = match.fixture.date;
  //String datePart = originalDateTimeString.split('T')[0];
  homeGoal ??= 0;
  awayGoal ??= 0;

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
        color: kWhiteColor,
        margin: const EdgeInsets.symmetric(vertical: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 4.0),
              child: Text(
                "$elapsed'",
                style: const TextStyle(
                  color: kRedColor,
                  fontSize: 13.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              child: Text(
                match.home.name,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: kBlackColor,
                  fontSize: 13.0,
                ),
              ),
            ),
            Image.network(
              match.home.logoUrl,
              width: 24,
            ),
            const SizedBox(width: 2),
            Text(
              "$homeGoal - $awayGoal",
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: kBlackColor,
                fontSize: 13.0,
              ),
            ),
            const SizedBox(width: 2),
            Image.network(
              match.away.logoUrl,
              width: 24,
            ),
            Expanded(
              child: Text(
                match.away.name,
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
