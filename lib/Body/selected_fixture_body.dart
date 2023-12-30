import 'package:flutter/material.dart';
import 'package:sports_app/Data/models/live_score_model.dart';
import 'package:sports_app/Utils/Widgets/selected_match_title.dart';

Widget selectedFixtureBody(List<LiveScore> allmatches) {
  return Column(
    children: [
      Expanded(
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: allmatches.length,
                itemBuilder: (context, index) {
                  return selectedMatchTitle(allmatches[index]);
                },
              ),
            )
          ],
        ),
      )
    ],
  );
}
