import 'package:flutter/material.dart';
import 'package:sports_app/Data/models/live_score_model.dart';
import 'package:sports_app/Pages/fixture_info_page.dart';
import 'package:sports_app/Utils/Widgets/match_title.dart';

Widget allfixturebody(List<LiveScore> allmatches) {
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
                    onTap: () {
                      // Tıklanan öğenin işlemleri burada gerçekleştirilir

                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => FixtureInfoPage(
                            allmatches[index].fixture.id,
                            allmatches[index].home.id,
                            allmatches[index].away.id),
                      ));
                    },
                    child: matchTitle(allmatches[index]),
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
