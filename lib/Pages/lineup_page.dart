import 'package:flutter/material.dart';
import 'package:sports_app/Body/lineup_body.dart';
import 'package:sports_app/Data/app_constant.dart';
import 'package:sports_app/Services/api_service.dart';

// ignore: must_be_immutable
class LineUpPage extends StatefulWidget {
  int? selectedMatch;

  LineUpPage(this.selectedMatch, {super.key});

  @override
  State<LineUpPage> createState() => _LineUpPageState();
}

class _LineUpPageState extends State<LineUpPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: kWhiteColor),
      child: FutureBuilder(
        future: SoccerApi().getFixtureLineUp(widget.selectedMatch),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return LineUpBody(snapshot.data!);
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
