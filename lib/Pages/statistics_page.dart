import 'package:flutter/material.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:sports_app/Data/app_constant.dart';
import 'package:sports_app/Data/models/player_statistics_model.dart';
import 'package:sports_app/Services/api_service.dart';

class StaticticPage extends StatefulWidget {
  String? selectedSeason;
  int? leagueID;

  StaticticPage(this.selectedSeason, this.leagueID, {super.key});
  @override
  State<StaticticPage> createState() => _StaticticPageState();
}

class _StaticticPageState extends State<StaticticPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: kWhiteColor),
      child: FutureBuilder<List<List<PlayerStatistics>>>(
        future: Future.wait([
          SoccerApi().getIstatistik(
              "topscorers", widget.selectedSeason, widget.leagueID),
          SoccerApi().getIstatistik(
              "topassists", widget.selectedSeason, widget.leagueID),
          SoccerApi().getIstatistik(
              "topyellowcards", widget.selectedSeason, widget.leagueID),
          SoccerApi().getIstatistik(
              "topredcards", widget.selectedSeason, widget.leagueID),
        ]),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            final List<PlayerStatistics> goalStats = snapshot.data![0];
            final List<PlayerStatistics> assistStats = snapshot.data![1];
            final List<PlayerStatistics> yellowCardStats = snapshot.data![2];
            final List<PlayerStatistics> redCardStats = snapshot.data![3];

            return CustomScrollView(
              slivers: [
                _buildStickyHeader('Gol Krallığı', goalStats, "goals.total"),
                _buildStickyHeader(
                    'Asist Krallığı', assistStats, "goals.assists"),
                _buildStickyHeader(
                    'Sarı Kart Sayısı', yellowCardStats, "cards.yellow"),
                _buildStickyHeader(
                    'Kırmızı Kart Sayısı', redCardStats, "cards.red"),
              ],
            );
          }
        },
      ),
    );
  }

  SliverStickyHeader _buildStickyHeader(
      String title, List<PlayerStatistics>? playerStats, String statField) {
    return SliverStickyHeader(
      header: Container(
        height: 28,
        color: kLabelColor,
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0, top: 6.0, bottom: 6.0),
          child: Text(
            title,
            style: const TextStyle(
                color: kWhiteColor, fontWeight: FontWeight.w900),
          ),
        ),
      ),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            String statValue = "";

            if (statField == "goals.total") {
              statValue =
                  playerStats?[index].statistics[0].goals.total.toString() ??
                      "N/A";
            } else if (statField == "goals.assists") {
              statValue =
                  playerStats?[index].statistics[0].goals.assists.toString() ??
                      "N/A";
            } else if (statField == "cards.yellow") {
              statValue =
                  playerStats?[index].statistics[0].cards.yellow.toString() ??
                      "N/A";
            } else if (statField == "cards.red") {
              statValue =
                  playerStats?[index].statistics[0].cards.red.toString() ??
                      "N/A";
            }

            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.network(
                        playerStats![index].statistics[0].team!.logo,
                        width: 24,
                      ),
                      Expanded(
                        child: Text(
                          playerStats[index].player.name,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: kBlackColor,
                            fontSize: 13.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const Spacer(),
                      Expanded(
                        child: Text(
                          statValue,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: kBlackColor,
                            fontSize: 13.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const Divider(
                  color: kGreyColor,
                  thickness: 1,
                  indent: 16,
                  endIndent: 16,
                ),
              ],
            );
          },
          childCount: 10,
        ),
      ),
    );
  }
}
