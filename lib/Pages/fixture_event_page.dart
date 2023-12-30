import 'package:flutter/material.dart';
import 'package:sports_app/Body/fixture_event_body.dart';
import 'package:sports_app/Data/app_constant.dart';
import 'package:sports_app/Services/api_service.dart';

// ignore: must_be_immutable
class FixtureEventPage extends StatefulWidget {
  int? selectedMatch;
  int homeTeamId;
  int awayTeamId;

  FixtureEventPage(this.selectedMatch, this.homeTeamId, this.awayTeamId,
      {super.key});

  @override
  State<FixtureEventPage> createState() => _FixtureEventPageState();
}

class _FixtureEventPageState extends State<FixtureEventPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: kWhiteColor),
      child: FutureBuilder(
        future: SoccerApi().getFixtureEvent(widget.selectedMatch),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return fixtureEventBody(
                snapshot.data!, widget.homeTeamId, widget.awayTeamId);
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
