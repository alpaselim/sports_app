import 'package:flutter/material.dart';
import 'package:sports_app/Body/fixture_statistic_body.dart';
import 'package:sports_app/Data/app_constant.dart';
import 'package:sports_app/Services/api_service.dart';

// ignore: must_be_immutable
class FixtureStatisticPage extends StatefulWidget {
  int? selectedMatch;

  FixtureStatisticPage(this.selectedMatch, {super.key});

  @override
  State<FixtureStatisticPage> createState() => _FixtureStatisticPageState();
}

class _FixtureStatisticPageState extends State<FixtureStatisticPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: kWhiteColor),
      child: FutureBuilder(
        future: SoccerApi().getFixtureStatistic(widget.selectedMatch),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return fixtureStatisticBody(snapshot.data!);
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
