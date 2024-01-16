import 'package:flutter/material.dart';
import 'package:sports_app/Data/app_constant.dart';
import 'package:sports_app/Pages/tab_controller.dart';

class PopularLeagueList extends StatefulWidget {
  const PopularLeagueList({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _PopularLeagueListState createState() => _PopularLeagueListState();
}

class _PopularLeagueListState extends State<PopularLeagueList> {
  List<League> leagues = [
    League(
        id: 203,
        name: 'Süper Lig',
        flag: 'assets/images/turkiye.png',
        leagueLogo: 'assets/images/superlig.png'),
    League(
        id: 204,
        name: 'TFF 1. Lig',
        flag: 'assets/images/turkiye.png',
        leagueLogo: 'assets/images/TFF1lig.png'),
    League(
        id: 39,
        name: 'Premier Lig',
        flag: 'assets/images/ingiltere.png',
        leagueLogo: 'assets/images/premierLig.png'),
    League(
        id: 61,
        name: 'Ligue 1',
        flag: 'assets/images/fransa.png',
        leagueLogo: 'assets/images/Ligue1.png'),
    League(
        id: 140,
        name: 'LaLiga',
        flag: 'assets/images/ispanya.png',
        leagueLogo: 'assets/images/laliga.png'),
    League(
        id: 135,
        name: 'Serie A',
        flag: 'assets/images/italya.png',
        leagueLogo: 'assets/images/serieA.png'),
    League(
        id: 78,
        name: 'Bundesliga',
        flag: 'assets/images/almanya.png',
        leagueLogo: 'assets/images/bundesliga.png'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBlueColor,
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "mackolik",
              style: TextStyle(
                fontFamily: 'Poppins',
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: kWhiteColor),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          const SizedBox(height: 6),
          Container(
            color: kLabelColor,
            child: const Row(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(7, 3, 7, 3),
                  child: Text(
                    "Popüler Ligler",
                    style: TextStyle(color: kWhiteColor, fontSize: 15),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: leagues.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(left: 8, top: 8, right: 8),
                  child: Column(
                    children: [
                      InkWell(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Image.asset(
                                  leagues[index].flag,
                                  width: 24, // Genişliği ayarlayabilirsiniz
                                  height: 24, // Yüksekliği ayarlayabilirsiniz
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  leagues[index].name,
                                  style: const TextStyle(fontSize: 16),
                                ),
                              ],
                            ),
                            const Icon(Icons.chevron_right, color: Colors.black)
                          ],
                        ),
                        // Boşlukları ayarlayabilirsiniz
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => MyTabBarWithButtons(
                              leagueID: leagues[index].id,
                              leagueLogo: leagues[index].leagueLogo,
                              leagueName: leagues[index].name,
                            ),
                          ));
                        },
                        // trailing: const Icon(Icons.chevron_right,
                        //     color: Colors.black), // Sağ ok eklemek için
                      ),
                      const Divider(
                        color: kGreyColor, // Çizgi rengini ayarlayabilirsiniz
                        thickness: 1, // Çizgi kalınlığını ayarlayabilirsiniz
                        indent: 2, // Çizginin sol tarafındaki boşluk
                        endIndent: 8, // Çizginin sağ tarafındaki boşluk
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class League {
  final int id;
  final String name;
  final String flag;
  final String leagueLogo;

  League(
      {required this.id,
      required this.name,
      required this.flag,
      required this.leagueLogo});
}
