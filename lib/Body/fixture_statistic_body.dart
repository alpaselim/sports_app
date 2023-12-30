import 'package:flutter/material.dart';
import 'package:sports_app/Data/app_constant.dart';
import 'package:sports_app/Data/models/fixture_statistics_model.dart';

Widget fixtureStatisticBody(List<FixtureResult> allmatches) {
  return SingleChildScrollView(
    child: Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(2.0),
            child: Text("Topla Oynama"),
          ),
          toplaOynama(allmatches[0].statistics[9].value,
              allmatches[1].statistics[9].value),

          //  Text('Yüzde: $percentage% Mavi, ${100 - percentage}% Kırmızı'),
          statisticWidget((allmatches[0].statistics[2].value).toDouble(),
              "Toplam Şut", (allmatches[1].statistics[2].value).toDouble()),
          statisticWidget((allmatches[0].statistics[0].value).toDouble(),
              "İsabetli Şut", (allmatches[1].statistics[0].value).toDouble()),
          statisticWidget((allmatches[0].statistics[1].value).toDouble(),
              "İsabetsiz Şut", (allmatches[1].statistics[1].value).toDouble()),
          statisticWidget((allmatches[0].statistics[3].value).toDouble(),
              "Engellenen Şut", (allmatches[1].statistics[3].value).toDouble()),

          statisticWidget(
              (allmatches[0].statistics[12].value).toDouble(),
              "Kaleci Kurtarışı",
              (allmatches[1].statistics[12].value).toDouble()),

          statisticWidget(
              (allmatches[0].statistics[4].value).toDouble(),
              "Ceza Sahası İçinden Şut",
              (allmatches[1].statistics[4].value).toDouble()),
          statisticWidget(
              (allmatches[0].statistics[5].value).toDouble(),
              "Ceza Sahası Dışından Şut",
              (allmatches[1].statistics[5].value).toDouble()),

          statisticWidget((allmatches[0].statistics[13].value).toDouble(),
              "Toplam Pas", (allmatches[1].statistics[13].value).toDouble()),

          statisticWidget((allmatches[0].statistics[14].value).toDouble(),
              "İsabetli Pas", (allmatches[1].statistics[14].value).toDouble()),

          statisticWidget(
              double.parse(allmatches[0].statistics[16].value),
              "Gol Beklentisi",
              double.parse(allmatches[1].statistics[16].value)),

          statisticWidget((allmatches[0].statistics[7].value).toDouble(),
              "Korner", (allmatches[1].statistics[7].value).toDouble()),

          statisticWidget((allmatches[0].statistics[8].value).toDouble(),
              "Ofsayt", (allmatches[1].statistics[8].value).toDouble()),

          statisticWidget((allmatches[0].statistics[6].value).toDouble(),
              "Faul", (allmatches[1].statistics[6].value).toDouble()),

          statisticWidget((allmatches[0].statistics[10].value).toDouble(),
              "Sarı Kart", (allmatches[1].statistics[10].value).toDouble()),

          statisticWidget((allmatches[0].statistics[11].value).toDouble(),
              "Kırmızı Kart", (allmatches[1].statistics[11].value).toDouble()),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    ),
  );
}

Column statisticWidget(double homeTeam, String label, double awayTeam) {
  bool flag = true;
  double totalShots = homeTeam + awayTeam;
  double progressValueAway = awayTeam / totalShots;
  double progressValueHome = 1 - homeTeam / totalShots;
  if (homeTeam == 0 && awayTeam == 0) {
    totalShots = 2;
    progressValueAway = 1 / 2;
    progressValueHome = 1 / 2;
  }

  if (label != "Gol Beklentisi") {
    flag = false;
  }
  return Column(
    children: [
      const SizedBox(height: 10.0),
      Row(
        children: [
          const SizedBox(width: 20), // Sol kenarda 2 birim boşluk
          Text(
            flag ? '$homeTeam' : '${homeTeam.toInt()}',
          ),
          const Spacer(), // Ortaya gelecek şekilde boşluk bırakır
          Text(
            label,
          ),
          const Spacer(), // Ortaya gelecek şekilde boşluk bırakır
          Text(
            flag ? '$awayTeam' : '${awayTeam.toInt()}',
          ),
          const SizedBox(width: 20), // Sağ kenarda 2 birim boşluk
        ],
      ),
      const SizedBox(
        height: 2,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 184.0,
            height: 10,
            child: LinearProgressIndicator(
              value: progressValueHome,
              backgroundColor: kBlueColor,
              valueColor: const AlwaysStoppedAnimation<Color>(
                kWhiteStickColor,
              ),
            ),
          ),
          const SizedBox(
            width: 4,
          ),
          SizedBox(
            width: 184.0,
            height: 10,
            child: LinearProgressIndicator(
              value: progressValueAway,
              backgroundColor: kWhiteStickColor,
              valueColor: const AlwaysStoppedAnimation<Color>(
                kRedStickColor,
              ),
            ),
          ),
        ],
      ),
    ],
  );
}

SizedBox toplaOynama(String homePerc, String awayPerc) {
  double homePercentage =
      double.parse(homePerc.replaceAll('%', '')); // Yüzde dilimi
  return SizedBox(
    width: 370.0,
    child: Stack(
      children: [
        Container(
          width: double.infinity,
          height: 30.0,
          color: kRedStickColor, // Kırmızı kısım
        ),
        FractionallySizedBox(
          widthFactor: homePercentage / 100.0,
          child: Container(
            height: 30.0,
            color: kBlueColor, // Mavi kısım
          ),
        ),
        Positioned.fill(
          child: Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 4.0),
              child: Text(
                homePerc,
                style: const TextStyle(
                    color: kWhiteColor, fontWeight: FontWeight.w700),
              ),
            ),
          ),
        ),
        Positioned.fill(
          child: Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.only(right: 4.0),
              child: Text(
                awayPerc,
                style: const TextStyle(
                    color: kWhiteColor, fontWeight: FontWeight.w700),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
