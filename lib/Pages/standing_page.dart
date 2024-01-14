import 'package:flutter/material.dart';
import 'package:sports_app/Body/standing_body.dart';
import 'package:sports_app/Data/app_constant.dart';
import 'package:sports_app/Services/api_service.dart';

// ignore: must_be_immutable
class StandingPage extends StatefulWidget {
  String? selectedSeason;
  int? leagueID;

  StandingPage(this.selectedSeason, this.leagueID, {super.key});
  @override
  // ignore: library_private_types_in_public_api
  _StandingPageState createState() => _StandingPageState();
}

class _StandingPageState extends State<StandingPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: kWhiteColor),
      child: FutureBuilder(
        future:
            SoccerApi().getAllMatches(widget.selectedSeason, widget.leagueID),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return pageBody(snapshot.data!);
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
