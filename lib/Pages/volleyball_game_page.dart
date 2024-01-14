import 'package:flutter/material.dart';
import 'package:sports_app/Body/volleyball_games_body.dart';
import 'package:sports_app/Data/app_constant.dart';
import 'package:sports_app/Services/api_service.dart';

class VolleyballGames extends StatefulWidget {
  const VolleyballGames({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _VolleyballGamesState createState() => _VolleyballGamesState();
}

class _VolleyballGamesState extends State<VolleyballGames> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: kWhiteColor,
      ),
      child: FutureBuilder(
        future: SoccerApi().getVolleyballGames(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return volleyballGamesBody(snapshot.data!);
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
