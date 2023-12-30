import 'package:flutter/material.dart';
import 'package:sports_app/Data/models/event_model.dart';

Widget fixtureEventAway(Event match) {
  String time = '${match.time.elapsed}\'';
  String? extraTime = match.time.extra.toString();
  String player = match.player.name;
  String? info = match.assist.name;
  info ??= "";
  String temp = info;
  String type = match.type;
  String detail = match.detail;
  String? comments = match.comments;

  Image myImage = Image.asset(
    "assets/images/goalkeeper.png",
    width: 25,
    height: 25,
  );
  if (match.time.extra != null) {
    time = '$time+$extraTime';
  }
  if (type == 'Goal') {
    if (detail == 'Penalty') {
      info = comments;
    }
    myImage = Image.asset(
      "assets/images/football.png",
      width: 20,
      height: 20,
    );
  } else if (type == "Card") {
    if (detail == "Yellow Card") {
      myImage = Image.asset(
        "assets/images/yellow_card.png",
        width: 25,
        height: 25,
      );
    } else {
      myImage = Image.asset(
        "assets/images/red_card.png",
        width: 25,
        height: 25,
      );
    }
  } else if (type == 'subst') {
    myImage = Image.asset(
      "assets/images/up_down.png",
      width: 25,
      height: 25,
    );
    temp = player;
    player = info;
    info = temp;
  }

  return Container(
    color: Colors.white,
    margin: const EdgeInsets.symmetric(vertical: 5),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(),
            ),

            // Orta sütun
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  time,
                  style: const TextStyle(
                    color: Color.fromARGB(255, 118, 146, 151),
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                const SizedBox(
                  height: 3,
                ),
                Container(
                  height: 40,
                  width: 3,
                  color: Colors.white,
                  child: const VerticalDivider(
                    color: Color.fromARGB(255, 118, 146, 151),
                    thickness: 2.5,
                    width: 20,
                  ),
                ),
              ],
            ),

            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  myImage,
                  SizedBox(
                    width: 140,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment
                          .start, // Metinleri sola yaslamak için
                      children: [
                        Text(
                          player,
                          textAlign: TextAlign.left,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          info!,
                          textAlign: TextAlign.left,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

Widget fixtureEventHome(Event match) {
  String time = '${match.time.elapsed}\'';
  String? extraTime = match.time.extra.toString();
  String player = match.player.name;
  String? info = match.assist.name;
  info ??= "";
  String temp = info;
  String type = match.type;
  String detail = match.detail;
  String? comments = match.comments;

  Image myImage = Image.asset(
    "assets/images/goalkeeper.png",
    width: 25,
    height: 25,
  );
  if (match.time.extra != null) {
    time = '$time+$extraTime';
  }
  if (type == 'Goal') {
    if (detail == 'Penalty') {
      info = comments;
    }
    myImage = Image.asset(
      "assets/images/football.png",
      width: 20,
      height: 20,
    );
  } else if (type == "Card") {
    if (detail == "Yellow Card") {
      myImage = Image.asset(
        "assets/images/yellow_card.png",
        width: 25,
        height: 25,
      );
    } else {
      myImage = Image.asset(
        "assets/images/red_card.png",
        width: 25,
        height: 25,
      );
    }
  } else if (type == 'subst') {
    myImage = Image.asset(
      "assets/images/up_down.png",
      width: 25,
      height: 25,
    );
    temp = player;
    player = info;
    info = temp;
  }

  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 140,
                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.end, // Metinleri sola yaslamak için
                    children: [
                      Text(
                        player,
                        textAlign: TextAlign.right,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        info!,
                        textAlign: TextAlign.right,
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                myImage,
              ],
            ),
          ),

          // Orta sütun
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                time,
                style: const TextStyle(
                  color: Color.fromARGB(255, 118, 146, 151),
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
              const SizedBox(
                height: 3,
              ),
              Container(
                height: 40,
                width: 3,
                color: Colors.white,
                child: const VerticalDivider(
                  color: Color.fromARGB(255, 118, 146, 151),
                  thickness: 2.5,
                  width: 20,
                ),
              ),
            ],
          ),

          Expanded(
            child: Container(),
          ),
          const SizedBox(
            width: 10,
          ),
        ],
      ),
    ],
  );
}
