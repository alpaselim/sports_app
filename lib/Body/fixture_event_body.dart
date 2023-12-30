import 'package:flutter/material.dart';
import 'package:sports_app/Data/app_constant.dart';
import 'package:sports_app/Data/models/event_model.dart';
import 'package:sports_app/Utils/Widgets/fixture_event_title.dart';

Widget fixtureEventBody(
    List<Event> allmatches, int homeTeamId, int awayTeamId) {
  return Column(
    children: [
      Expanded(
        child: Column(
          children: [
            Transform.rotate(
              angle: 330 * (3.14 / 180), // Radyan cinsinden açı (45 derece)
              child: const Icon(
                Icons.sports,
                size: 30,
                color: kEventIconColor,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: allmatches.length,
                itemBuilder: (context, index) {
                  if (allmatches[index].team.id == homeTeamId) {
                    return fixtureEventHome(allmatches[index]);
                  } else {
                    return fixtureEventAway(allmatches[index]);
                  }
                },
              ),
            )
          ],
        ),
      )
    ],
  );
}
