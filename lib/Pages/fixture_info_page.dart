import 'package:flutter/material.dart';
import 'package:sports_app/Body/selected_fixture_body.dart';
import 'package:sports_app/Data/app_constant.dart';
import 'package:sports_app/Pages/fixture_event_page.dart';
import 'package:sports_app/Pages/fixture_statistic_page.dart';
import 'package:sports_app/Pages/lineup_page.dart';
import 'package:sports_app/Pages/live_fixture_page.dart';
import 'package:sports_app/Services/api_service.dart';

class FixtureInfoPage extends StatefulWidget {
  final int? selectedMatch;
  final int homeTeamId;
  final int awayTeamId;

  const FixtureInfoPage(this.selectedMatch, this.homeTeamId, this.awayTeamId,
      {super.key});

  @override
  // ignore: library_private_types_in_public_api
  _FixtureInfoPageState createState() => _FixtureInfoPageState();
}

class _FixtureInfoPageState extends State<FixtureInfoPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBlueColor,
        title: const Row(
          children: <Widget>[
            SizedBox(width: 90),
            Text(
              "mackolik",
              style: TextStyle(
                fontFamily: 'Poppins',
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Container(
            width: screenWidth,
            height: 65,
            decoration: const BoxDecoration(color: kWhiteColor),
            child: FutureBuilder(
              future: SoccerApi().getSelectedFixture(widget.selectedMatch),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return selectedFixtureBody(snapshot.data!);
                } else if (snapshot.hasError) {
                  return const Center(
                    child: Text("Bir hata oluştu"),
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          ),
          Container(
            height: 50,
            decoration: const BoxDecoration(
              color: kBlueColor,
            ),
            child: tabBarButton(),
          ),
          Expanded(
            child: tabBarView(),
          ),
        ],
      ),
    );
  }

  TabBarView tabBarView() {
    return TabBarView(
      physics: const BouncingScrollPhysics(),
      controller: _tabController,
      children: [
        FixtureEventPage(
            widget.selectedMatch, widget.homeTeamId, widget.awayTeamId),
        LineUpPage(widget.selectedMatch),
        FixtureStatisticPage(widget.selectedMatch),
        const LiveFixture(), //ForumPage(matchId: widget.selectedMatch),
      ],
    );
  }

  TabBar tabBarButton() {
    return TabBar(
      tabAlignment: TabAlignment.start,
      indicatorColor: kOrangeColor,
      indicatorWeight: 3.0,
      isScrollable: true,
      controller: _tabController,
      indicatorSize: TabBarIndicatorSize.tab,
      unselectedLabelStyle: const TextStyle(color: kGreyColor),
      tabs: [
        Tab(
          child: TextButton(
            onPressed: () {
              _tabController.animateTo(0); // İlk sekme
            },
            child: const Text(
              'Detay',
              style: TextStyle(color: kWhiteColor, fontSize: 13),
            ),
          ),
        ),
        Tab(
          child: TextButton(
            onPressed: () {
              _tabController.animateTo(1); // İkinci sekme
            },
            child: const Text(
              'Kadro',
              style: TextStyle(color: kWhiteColor, fontSize: 13),
            ),
          ),
        ),
        Tab(
          child: TextButton(
            onPressed: () {
              _tabController.animateTo(2); // Üçüncü sekme
            },
            child: const Text(
              'İstatistik',
              style: TextStyle(color: kWhiteColor, fontSize: 13),
            ),
          ),
        ),
        Tab(
          child: TextButton(
            onPressed: () {
              _tabController.animateTo(3); // Beşinci sekme
            },
            child: const Text(
              'Forum',
              style: TextStyle(color: kWhiteColor, fontSize: 13),
            ),
          ),
        ),
      ],
    );
  }
}
