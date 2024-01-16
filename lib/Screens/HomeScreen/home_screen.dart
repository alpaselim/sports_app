import 'package:flutter/material.dart';
import 'package:sports_app/Data/app_constant.dart';
import 'package:sports_app/Pages/all_fixture_page.dart';
import 'package:sports_app/Pages/basketball_games_page.dart';
import 'package:sports_app/Pages/live_fixture_page.dart';
import 'package:sports_app/Pages/volleyball_game_page.dart';
import 'package:sports_app/Utils/Widgets/drawer_content.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 7, vsync: this, initialIndex: 3);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

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
        //flexibleSpace: myBody(),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: kWhiteColor),
            onPressed: () {},
          ),
        ],
      ),
      drawer: const CustomDrawer(),
      body: Column(
        children: [
          Container(
            height: 40,
            decoration: const BoxDecoration(
              color: kBlueColor,
            ),
            child: tabBarButton(),
          ),
          const SizedBox(
            height: 1,
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
      controller: _tabController,
      children: const [
        LiveFixture(),
        LiveFixture(),
        LiveFixture(),
        AllFixture(),
        BasketballGames(),
        VolleyballGames(),
        VolleyballGames(),
      ],
    );
  }

  Container tabBarButton() {
    return Container(
      color: Colors.black87,
      child: TabBar(
        isScrollable: false,
        physics: const NeverScrollableScrollPhysics(),
        indicatorColor: kBlueColor,
        controller: _tabController,
        indicatorSize: TabBarIndicatorSize.tab,
        indicator: const BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Colors.blue, // Gösterge çizgisinin rengi
              width: 40, // Gösterge çizgisinin kalınlığı
            ),
          ),
        ),
        unselectedLabelStyle: const TextStyle(color: kGreyColor),
        tabs: [
          Tab(
            child: CustomImageButton(
              image: Image.asset(
                "assets/images/kupa.png",
                width: 20, // İstediğiniz genişlik
                height: 20, // İstediğiniz yükseklik
                color: kWhiteColor,
              ),
              onPressed: () {
                _tabController.animateTo(0);
              },
            ),
          ),
          Tab(
            child: CustomImageButton(
              image: Image.asset(
                "assets/images/formula1.png",
              ),
              onPressed: () {
                _tabController.animateTo(1);
              },
            ),
          ),
          Tab(
            child: CustomImageButton(
              image: Image.asset(
                "assets/images/flame.png",
                width: 25,
                height: 25,
              ),
              onPressed: () {
                _tabController.animateTo(2);
              },
            ),
          ),
          Tab(
            child: CustomImageButton(
              image: Image.asset(
                "assets/images/soccer-ball.png",
                width: 25,
                height: 25,
              ),
              onPressed: () {
                _tabController.animateTo(3);
              },
            ),
          ),
          Tab(
            child: CustomImageButton(
              image: Image.asset(
                "assets/images/basketball.png",
                width: 25,
                height: 25,
              ),
              onPressed: () {
                _tabController.animateTo(4);
              },
            ),
          ),
          Tab(
            child: CustomImageButton(
              image: Image.asset(
                "assets/images/volleyball.png",
                width: 25,
                height: 25,
              ),
              onPressed: () {
                _tabController.animateTo(5);
              },
            ),
          ),
          Tab(
            child: CustomImageButton(
              image: Image.asset(
                "assets/images/tennis.png",
                width: 25,
                height: 25,
              ),
              onPressed: () {
                _tabController.animateTo(6);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class CustomImageButton extends StatefulWidget {
  final Image image;
  final Function onPressed;

  const CustomImageButton(
      {Key? key, required this.image, required this.onPressed})
      : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _CustomImageButtonState createState() => _CustomImageButtonState();
}

class _CustomImageButtonState extends State<CustomImageButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onPressed();
      },
      child: Container(
        child: widget.image,
      ),
    );
  }
}
