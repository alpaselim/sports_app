import 'package:flutter/material.dart';
import 'package:sports_app/Body/basketball_games_body.dart';
import 'package:sports_app/Data/app_constant.dart';
import 'package:sports_app/Services/api_service.dart';

class BasketballGames extends StatefulWidget {
  const BasketballGames({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _BasketballGamesState createState() => _BasketballGamesState();
}

class _BasketballGamesState extends State<BasketballGames> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: kWhiteColor,
      ),
      child: FutureBuilder(
        future: SoccerApi().getBasketballGames(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return basketballGamesBody(snapshot.data!);
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
