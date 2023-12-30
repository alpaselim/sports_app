import 'package:flutter/material.dart';
import 'package:sports_app/Body/live_score_body.dart';
import 'package:sports_app/Data/app_constant.dart';
import 'package:sports_app/Services/api_service.dart';

class LiveFixture extends StatefulWidget {
  const LiveFixture({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LiveFixtureState createState() => _LiveFixtureState();
}

class _LiveFixtureState extends State<LiveFixture> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: kWhiteColor,
      ),
      child: FutureBuilder(
        future: SoccerApi().getLiveFixture(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return liveScoreBody(snapshot.data!);
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
