import 'package:flutter/material.dart';
import 'package:sports_app/Data/app_constant.dart';
import 'package:sports_app/Data/models/lineup_model.dart';

Widget lineUpTitle(LineupData match) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisSize: MainAxisSize.max,
    children: [
      SingleChildScrollView(
        child: Container(
          color: const Color.fromARGB(255, 65, 65, 65),
          height: 25,
          width: double.infinity,
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(
              "${match.team.name} ilk 11",
              style: const TextStyle(
                color: kWhiteColor,
              ),
            ),
          ),
        ),
      ),
      const SizedBox(
        height: 1,
      ),
      // ListView.builder ekleniyor
      Expanded(
        child: ListView.builder(
          itemCount: match.startXI.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      SizedBox(
                          width: 20,
                          child: Text(
                              match.startXI[index].player.number.toString())),
                      const SizedBox(
                        width: 10,
                      ),
                      SizedBox(
                          width: 200,
                          child: Text(match.startXI[index].player.name)),
                    ],
                  ),
                ),
                const Divider(
                  color: kGreyColor, // Çizgi rengini ayarlayabilirsiniz
                  thickness: 1, // Çizgi kalınlığını ayarlayabilirsiniz
                  indent: 5, // Çizginin sol tarafındaki boşluk
                  endIndent: 5, // Çizginin sağ tarafındaki boşluk
                ),
              ],
            );
          },
        ),
      ),

      const Text(
        "Yedekler",
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      const Divider(
        color: kGreyColor, // Çizgi rengini ayarlayabilirsiniz
        thickness: 1, // Çizgi kalınlığını ayarlayabilirsiniz
        indent: 5, // Çizginin sol tarafındaki boşluk
        endIndent: 280, // Çizginin sağ tarafındaki boşluk
      ),
      Expanded(
        child: ListView.builder(
          itemCount: match.substitutes.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      SizedBox(
                          width: 20,
                          child: Text(
                              match.startXI[index].player.number.toString())),
                      const SizedBox(
                        width: 10,
                      ),
                      SizedBox(
                          width: 200,
                          child: Text(match.startXI[index].player.name)),
                    ],
                  ),
                ),
                const Divider(
                  color: kGreyColor, // Çizgi rengini ayarlayabilirsiniz
                  thickness: 1, // Çizgi kalınlığını ayarlayabilirsiniz
                  indent: 5, // Çizginin sol tarafındaki boşluk
                  endIndent: 5, // Çizginin sağ tarafındaki boşluk
                ),
              ],
            );
          },
        ),
      ),

      const Text(
        "Teknik Direktör",
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      const Divider(
        color: kGreyColor, // Çizgi rengini ayarlayabilirsiniz
        thickness: 1, // Çizgi kalınlığını ayarlayabilirsiniz
        indent: 5, // Çizginin sol tarafındaki boşluk
        endIndent: 280, // Çizginin sağ tarafındaki boşluk
      ),
      Text(match.coach.name),
    ],
  );
}
