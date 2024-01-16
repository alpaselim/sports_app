import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:sports_app/Data/app_constant.dart';
import 'package:sports_app/Data/models/basketball_model.dart';
import 'package:sports_app/Data/models/player_statistics_model.dart';
import 'package:sports_app/Services/api_service.dart';
import 'package:sports_app/Data/models/coach_model.dart';

// ignore: camel_case_types
class myEleven extends StatefulWidget {
  const myEleven({Key? key}) : super(key: key);

  @override
  State<myEleven> createState() => _myElevenState();
}

// ignore: camel_case_types
class _myElevenState extends State<myEleven>
    with SingleTickerProviderStateMixin {
  final TextEditingController _typeAheadController = TextEditingController();

  String teamLogo = '';
  String coachName = "Teknik Direktör";
  String coachPhoto = '';
  String photo = '';
  String pName = '';
  int indeks = -1;
  int isSearchBarVisible = 0;
  //final FocusNode _focusNode = FocusNode();
  List<bool> tiklandiMiList = List.generate(12, (index) => false);
  List<String> playerPhotos = List.generate(12, (index) => '');
  List<String> playerName = List.generate(12, (index) => '');

  bool _isKeyboardVisible = false;
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _focusNode.addListener(_onFocusChange);
  }

  void _onFocusChange() {
    setState(() {
      _isKeyboardVisible = _focusNode.hasFocus;
    });
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
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: kBlueColor),
            onPressed: () {},
          ),
        ],
      ),
      resizeToAvoidBottomInset: false,
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
          isSearchBarVisible = 0;
        },
        child: Center(
          child: Column(
            children: [
              Container(
                color: _isKeyboardVisible
                    ? Colors.black12.withOpacity(0.7)
                    : kWhiteColor,
                height: 65,
                padding: const EdgeInsets.symmetric(
                  horizontal: 12.0,
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(5.0, 10.0, 5.0, 10.0),
                  child: Container(
                    height: 10,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 242, 242, 242),
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: Center(
                      child: isSearchBarVisible == 0
                          ? searchTeamField()
                          : isSearchBarVisible == 1
                              ? searchPlayerField()
                              : isSearchBarVisible == 2
                                  ? searchCoachField()
                                  : Container(),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Stack(
                  children: [
                    // ignore: sized_box_for_whitespace

                    SizedBox(
                      width: double.infinity,
                      height: double.infinity,
                      child: Image.asset(
                        "assets/images/myeleven.jpg",
                        fit: BoxFit.fill,
                      ),
                    ),

                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(170, 20, 60, 30),
                          child: teamLogo != ''
                              ? Image.network(
                                  teamLogo,
                                  width: 65,
                                  height: 65,
                                )
                              : const SizedBox(
                                  width: 55,
                                ),
                        ),
                        Image.asset(
                          "assets/images/benimonbirim.jpg",
                          width: 100,
                          height: 100,
                        ),
                      ],
                    ),
                    coachAlignment(-270, 0, 0, 620, photo, playerName[11],
                        11), // TeknikDirektör
                    playerAlignment(0, 0, 0, 450, playerPhotos[0],
                        playerName[0], 0), // Kaleci
                    playerAlignment(120, 0, 0, 300, playerPhotos[1],
                        playerName[1], 1), // sağStoper
                    playerAlignment(-120, 0, 0, 300, playerPhotos[2],
                        playerName[2], 2), // solStoper
                    playerAlignment(300, 0, 0, 270, playerPhotos[3],
                        playerName[3], 3), // sağBek
                    playerAlignment(-300, 0, 0, 270, playerPhotos[4],
                        playerName[4], 4), // solBek
                    playerAlignment(0, 0, 0, 170, playerPhotos[5],
                        playerName[5], 5), // merkez
                    playerAlignment(200, 0, 0, 160, playerPhotos[6],
                        playerName[6], 6), // sağOrta
                    playerAlignment(-200, 0, 0, 160, playerPhotos[7],
                        playerName[7], 7), // solOrta
                    playerAlignment(200, 0, 0, 0, playerPhotos[8],
                        playerName[8], 8), // sağaçık
                    playerAlignment(-200, 0, 0, 0, playerPhotos[9],
                        playerName[9], 9), // solaçık
                    playerAlignment(0, 0, 50, 0, playerPhotos[10],
                        playerName[10], 10), // santrafor

                    if (_isKeyboardVisible)
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.black26.withOpacity(0.7)),
                        width: double.infinity,
                        height: double.infinity,
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  TypeAheadField<Takim> searchTeamField() {
    return TypeAheadField(
      textFieldConfiguration: TextFieldConfiguration(
        //autofocus: true,
        controller: _typeAheadController,
        focusNode: _focusNode,
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.search, color: Colors.black),
          suffixIcon: IconButton(
            icon: const Icon(Icons.clear, color: Colors.black),
            onPressed: () => _typeAheadController.clear(),
          ),
          hintText: 'Takım Seç',
          border: InputBorder.none,
        ),
      ),
      suggestionsCallback: (pattern) async {
        //   if (pattern.isNotEmpty) {
        // Kullanıcı bir şey yazdığında önerileri getir
        return await SoccerApi()
            .getSuggestion(pattern); // getSuggestion, getPlayers
        //    } else {
        // Kullanıcı bir şey yazmadığında boş bir liste döndür
        //      return [];
        //   }
      },
      itemBuilder: (context, suggestion) {
        return ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(suggestion.logo),
          ),
          title: Text(
            suggestion.name,
            style: const TextStyle(color: Colors.black),
          ),
        );
      },
      onSuggestionSelected: (suggestion) {
        setState(() {
          teamLogo = suggestion.logo;
          // BURASI DEĞİŞECEK
        });
      },
    );
  }

  TypeAheadField<PlayerStatistics> searchPlayerField() {
    //PlayerStatistics, Takim
    return TypeAheadField(
      textFieldConfiguration: TextFieldConfiguration(
        autofocus: true,
        controller: _typeAheadController,
        focusNode: _focusNode,
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.search, color: Colors.black),
          suffixIcon: IconButton(
            icon: const Icon(Icons.clear, color: Colors.black),
            onPressed: () => _typeAheadController.clear(),
          ),
          hintText: 'Oyuncu Seç',
          border: InputBorder.none,
        ),
      ),
      suggestionsCallback: (pattern) async {
        return await SoccerApi()
            .getPlayers(pattern); // getSuggestion, getPlayers
      },
      itemBuilder: (context, suggestion) {
        return ListTile(
          leading: CircleAvatar(
            backgroundImage:
                NetworkImage(suggestion.player.photo), //suggestion.player.photo
          ),
          title: Text(
            suggestion.player.name, // suggestion.player.name
            style: const TextStyle(color: Colors.black),
          ),
        );
      },
      onSuggestionSelected: (suggestion) {
        setState(() {
          // photo = suggestion.player.photo; // BURASI DEĞİŞECEK
          playerPhotos[indeks] = suggestion.player.photo;
          playerName[indeks] = suggestion.player.name;
          isSearchBarVisible = 0;
        });
      },
    );
  }

  TypeAheadField<Coach> searchCoachField() {
    return TypeAheadField(
      textFieldConfiguration: TextFieldConfiguration(
        controller: _typeAheadController,
        focusNode: _focusNode,
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.search, color: Colors.black),
          suffixIcon: IconButton(
            icon: const Icon(Icons.clear, color: Colors.black),
            onPressed: () => _typeAheadController.clear(),
          ),
          hintText: 'Teknik Direktör Seç',
          border: InputBorder.none,
        ),
      ),
      suggestionsCallback: (pattern) async {
        return await SoccerApi().getCoach(pattern); // getSuggestion, getPlayers
      },
      itemBuilder: (context, suggestion) {
        return ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(suggestion.photo),
          ),
          title: Text(
            suggestion.name,
            style: const TextStyle(color: Colors.black),
          ),
        );
      },
      onSuggestionSelected: (suggestion) {
        setState(() {
          // photo = suggestion.player.photo; // BURASI DEĞİŞECEK
          coachPhoto = suggestion.photo;
          coachName = suggestion.name;
          isSearchBarVisible = 0;
        });
      },
    );
  }

  Positioned playerAlignment(double left, double right, double top,
      double bottom, String photo, String oyuncuAdi, int index) {
    return Positioned(
      left: left,
      right: right,
      top: top,
      bottom: bottom,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              setState(() {
                indeks = index;
                tiklandiMiList[index] = true;
                isSearchBarVisible = 1;
                _typeAheadController.clear();
                playerPhotos[index] = photo;
                playerName[index] = oyuncuAdi;
              });

              _focusNode.requestFocus();
            },
            style: ElevatedButton.styleFrom(
              shape: const CircleBorder(),
              backgroundColor: Colors.white,
              foregroundColor: Colors.black,
            ),
            child: tiklandiMiList[index] && playerPhotos[index] != ''
                ? CircleAvatar(
                    backgroundImage: NetworkImage(playerPhotos[index]),
                  )
                : const Icon(
                    Icons.add,
                    color: Color.fromARGB(255, 85, 105, 219),
                  ),
          ),
          if (tiklandiMiList[index] &&
              playerPhotos[index] != '' &&
              playerName[index] != '')
            Container(
              decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.circular(8.0), // Oval kenarları belirle
                color: const Color.fromARGB(
                    255, 129, 121, 121), // Transparan arka plan rengi
              ),
              child: Padding(
                padding: const EdgeInsets.all(
                    4.0), // İstenen iç boşluk miktarını belirle
                child: Text(
                  playerName[index],
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Positioned coachAlignment(double left, double right, double top,
      double bottom, String photo, String oyuncuAdi, int index) {
    return Positioned(
      left: left,
      right: right,
      top: top,
      bottom: bottom,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              setState(() {
                indeks = index;
                tiklandiMiList[index] = true;
                isSearchBarVisible = 2;
                _typeAheadController.clear();
                playerPhotos[index] = photo;
                playerName[index] = oyuncuAdi;
              });
              FocusScope.of(context).requestFocus(_focusNode);
            },
            style: ElevatedButton.styleFrom(
              shape: const CircleBorder(),
              backgroundColor: Colors.white,
              foregroundColor: Colors.black,
            ),
            child: tiklandiMiList[index] && coachPhoto != ''
                ? CircleAvatar(
                    backgroundImage: NetworkImage(coachPhoto),
                  )
                : const Icon(
                    Icons.add,
                    color: Color.fromARGB(255, 85, 105, 219),
                  ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius:
                  BorderRadius.circular(8.0), // Oval kenarları belirle
              color: Colors.white, // Transparan arka plan rengi
            ),
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text(
                coachName,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: Color.fromARGB(255, 85, 105, 219),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
