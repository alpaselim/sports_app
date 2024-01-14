import 'package:flutter/material.dart';
import 'package:sports_app/Data/models/volleyball_game_model.dart';
import 'package:sports_app/Utils/Widgets/volleyball_game_title.dart';

Widget volleyballGamesBody(List<VolleyballGamesModel> allmatches) {
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
                    child: volleyballGameTitle(allmatches[index]),
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
