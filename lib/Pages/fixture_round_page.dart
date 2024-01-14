import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart';
import 'package:sports_app/Data/app_constant.dart';
import 'package:sports_app/Data/models/live_score_model.dart';
import 'package:sports_app/Pages/fixture_info_page.dart';
import 'package:sports_app/Utils/Widgets/fixture_title.dart';

// ignore: must_be_immutable
class FixtureScreen extends StatefulWidget {
  String? selectedSeason;
  int? leagueID;

  FixtureScreen(this.selectedSeason, this.leagueID, {super.key});
  @override
  // ignore: library_private_types_in_public_api
  _FixtureScreenState createState() => _FixtureScreenState();
}

class _FixtureScreenState extends State<FixtureScreen> {
  static const headers = {
    'x-rapidapi-host': "v3.football.api-sports.io",
    'x-rapidapi-key': "c886db8dc289d7973187aef5780213c6",
  };
  int currentWeek = 20;
  List<LiveScore> fixtures = [];

  Future<void> fetchFixtures(
      int week, String? selectedSeason, int? leagueID) async {
    List<String> parts = selectedSeason!.split("/");
    String result = parts[0];
    final Uri apiUrl = Uri.parse(
        "https://v3.football.api-sports.io/fixtures?league=$leagueID&season=$result&round=Regular%20Season%20-%20$week");

    try {
      Response res = await get(apiUrl, headers: headers);
      if (res.statusCode == 200) {
        var body = jsonDecode(res.body);

        if (body['response'] != null) {
          List<dynamic> matchesList = body['response'];
          List<LiveScore> matches = matchesList
              .map((dynamic item) => LiveScore.fromJson(item))
              .toList();

          setState(() {
            fixtures = matches;
          });
        }
      } else {
        throw Exception('Failed to load fixture');
      }
      // ignore: empty_catches
    } catch (e) {}
  }

  @override
  void initState() {
    super.initState();
    fetchFixtures(currentWeek, widget.selectedSeason, widget.leagueID);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kWhiteColor,
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                IconButton(
                  icon: const Icon(Icons.chevron_left),
                  onPressed: () {
                    if (currentWeek > 1) {
                      setState(() {
                        currentWeek--;
                        fetchFixtures(currentWeek, widget.selectedSeason,
                            widget.leagueID);
                      });
                    }
                  },
                ),
                const SizedBox(
                  width: 5,
                ),
                if (currentWeek > 1)
                  Container(
                    height: 40,
                    width: 80,
                    decoration: BoxDecoration(
                      color: kcustomWhiteColor,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    padding: const EdgeInsets.all(10),
                    child: Text('${currentWeek - 1}.hafta',
                        style: const TextStyle(fontSize: 15)),
                  ),
                Container(
                  height: 42,
                  width: 84,
                  decoration: BoxDecoration(
                    color: kcustomBlueColor,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  padding: const EdgeInsets.all(10),
                  child: Text('$currentWeek.hafta',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: kWhiteColor)),
                ),
                if (currentWeek < 38)
                  Container(
                    height: 40,
                    width: 80,
                    decoration: BoxDecoration(
                      color: kcustomWhiteColor,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    padding: const EdgeInsets.all(10),
                    child: Text('${currentWeek + 1}.hafta',
                        style: const TextStyle(fontSize: 15)),
                  ),
                const SizedBox(
                  width: 5,
                ),
                IconButton(
                  icon: const Icon(Icons.chevron_right),
                  onPressed: () {
                    if (currentWeek < 38) {
                      setState(() {
                        currentWeek++;
                        fetchFixtures(currentWeek, widget.selectedSeason,
                            widget.leagueID);
                      });
                    } else {
                      setState(() {
                        currentWeek = 1;
                        fetchFixtures(currentWeek, widget.selectedSeason,
                            widget.leagueID);
                      });
                    }
                  },
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemCount: fixtures.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => FixtureInfoPage(
                            fixtures[index].fixture.id,
                            fixtures[index].home.id,
                            fixtures[index].away.id),
                      ));
                    },
                    child: fixturetitle(fixtures[index]),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
