import 'package:flutter/material.dart';
import 'package:sports_app/Body/form_body.dart';
import 'package:sports_app/Data/app_constant.dart';
import 'package:sports_app/Services/api_service.dart';

class FormPage extends StatefulWidget {
  String? selectedSeason;
  int? leagueID;

  FormPage(this.selectedSeason, this.leagueID, {super.key});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: kWhiteColor),
      child: FutureBuilder(
        future:
            SoccerApi().getAllMatches(widget.selectedSeason, widget.leagueID),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return formBody(snapshot.data!);
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
