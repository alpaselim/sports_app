import 'package:flutter/material.dart';
import 'package:sports_app/Data/models/basketball_game_model.dart';
import 'package:sports_app/Utils/Widgets/game_title.dart';

Widget basketballGamesBody(List<BasketballGamesModel> allmatches) {
  return Column(
    children: [
      Expanded(
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: allmatches.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {},
                    child: gameTitle(allmatches[index]),
                  );
                },
              ),
            )
          ],
        ),
      )
    ],
  );
}
