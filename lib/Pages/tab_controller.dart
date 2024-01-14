import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:sports_app/Data/app_constant.dart';
import 'package:sports_app/Pages/fixture_round_page.dart';
import 'package:sports_app/Pages/form_page.dart';
import 'package:sports_app/Pages/standing_page.dart';
import 'package:sports_app/Pages/statistics_page.dart';

class MyTabBarWithButtons extends StatefulWidget {
  final int leagueID;
  final String leagueLogo;
  final String leagueName;
  const MyTabBarWithButtons(
      {super.key,
      required this.leagueID,
      required this.leagueLogo,
      required this.leagueName});
  @override
  // ignore: library_private_types_in_public_api
  _MyTabBarWithButtonsState createState() => _MyTabBarWithButtonsState();
}

class _MyTabBarWithButtonsState extends State<MyTabBarWithButtons>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  String? selectedSeason = '2023/2024'; // Başlangıçta seçili olan sezon
  List<String> seasons = [
    '2023/2024',
    '2022/2023',
    '2021/2022',
    '2020/2021',
    '2019/2020',
    '2018/2019',
    '2017/2018',
    '2016/2017',
    '2015/2016',
    '2014/2015',
    '2013/2014',
    '2012/2013',
    '2011/2012',
  ]; // Dropdown seçenekleri

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this); // Sekme sayısı 4
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
      ),
      body: Column(
        children: [
          Container(
            width: screenWidth,
            height: 53,
            decoration: const BoxDecoration(color: kcustomWhiteColor),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      left: 30.0), // Adjust the left padding as needed
                  child: Image.asset(
                    widget.leagueLogo,
                    width: 40, // Genişliği ayarlayabilirsiniz
                    height: 40, // Yüksekliği ayarlayabilirsiniz
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 80.0),
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 3,
                      ),
                      Text(
                        widget.leagueName,
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      Center(
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton2<String>(
                            isExpanded: true,
                            hint: const Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    '2023/2024',
                                    style: TextStyle(
                                      fontSize: 14,
                                      // fontWeight: FontWeight.bold,
                                      color: kWhiteColor,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                            items: seasons
                                .map((String item) => DropdownMenuItem<String>(
                                      value: item,
                                      child: Text(
                                        item,
                                        style: const TextStyle(
                                          fontSize: 14,
                                          //fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ))
                                .toList(),
                            value: selectedSeason,
                            onChanged: (String? value) {
                              setState(() {
                                selectedSeason = value;
                              });
                            },
                            buttonStyleData: ButtonStyleData(
                              height: 20,
                              width: 115,
                              padding:
                                  const EdgeInsets.only(left: 14, right: 2),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(2),
                                border: Border.all(
                                  color: Colors.black26,
                                ),
                                color: const Color.fromARGB(255, 34, 150, 243),
                              ),
                              elevation: 2,
                            ),
                            iconStyleData: const IconStyleData(
                              icon: Icon(
                                Icons.keyboard_arrow_down,
                              ),
                              iconSize: 20,
                              iconEnabledColor: Colors.black,
                              iconDisabledColor: Colors.grey,
                            ),
                            dropdownStyleData: DropdownStyleData(
                              maxHeight: 300,
                              width: 115,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(2),
                                color: kWhiteColor,
                              ),
                              //offset: const Offset(-20, 0),
                              scrollbarTheme: ScrollbarThemeData(
                                radius: const Radius.circular(40),
                                thickness: MaterialStateProperty.all<double>(6),
                                thumbVisibility:
                                    MaterialStateProperty.all<bool>(true),
                              ),
                            ),
                            menuItemStyleData: const MenuItemStyleData(
                              height: 25,
                              padding: EdgeInsets.only(left: 14, right: 14),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
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
      controller: _tabController,
      children: [
        StandingPage(selectedSeason, widget.leagueID),
        FormPage(selectedSeason, widget.leagueID),
        FixtureScreen(selectedSeason, widget.leagueID),
        StaticticPage(selectedSeason, widget.leagueID),
      ],
    );
  }

  TabBar tabBarButton() {
    return TabBar(
      tabAlignment: TabAlignment.start,
      indicatorColor: kOrangeColor,
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
              'Puan Durumu',
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
              'Form',
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
              'Fikstür',
              style: TextStyle(color: kWhiteColor, fontSize: 13),
            ),
          ),
        ),
        Tab(
          child: TextButton(
            onPressed: () {
              _tabController.animateTo(3); // Dördüncü sekme
            },
            child: const Text(
              'İstatistik',
              style: TextStyle(color: kWhiteColor, fontSize: 13),
            ),
          ),
        ),
      ],
    );
  }
}
