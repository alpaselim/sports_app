// ignore_for_file: avoid_print
import 'dart:convert';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:sports_app/Data/models/basketball_game_model.dart';
import 'package:sports_app/Data/models/basketball_model.dart';
import 'package:sports_app/Data/models/coach_model.dart';
import 'package:sports_app/Data/models/event_model.dart';
import 'package:sports_app/Data/models/fixture_statistics_model.dart';
import 'package:sports_app/Data/models/lineup_model.dart';
import 'package:sports_app/Data/models/live_score_model.dart';
import 'package:sports_app/Data/models/player_statistics_model.dart';
import 'package:sports_app/Data/models/search_team_model.dart';
import 'package:sports_app/Data/models/standing_model.dart';
import 'package:sports_app/Data/models/volleyball_game_model.dart';

class SoccerApi {
  final Uri apiUrl = Uri.parse(
      "https://v3.football.api-sports.io/standings?season=2023&league=203");

  final Uri apiUrl2 =
      Uri.parse("https://v3.football.api-sports.io/fixtures?live=all");

  static const headers = {
    'x-rapidapi-host': "v3.football.api-sports.io",
    'x-rapidapi-key': "c886db8dc289d7973187aef5780213c6"
  };

  static const header1 = {
    'x-rapidapi-host': "v1.basketball.api-sports.io",
    'x-rapidapi-key': "c886db8dc289d7973187aef5780213c6"
  };
  static const header2 = {
    'x-rapidapi-host': "v3.handball.api-sports.io",
    'x-rapidapi-key': "c886db8dc289d7973187aef5780213c6"
  };

  static const header3 = {
    'x-rapidapi-host': "v3.volleyball.api-sports.io",
    'x-rapidapi-key': "c886db8dc289d7973187aef5780213c6"
  };

  static const headers4 = {
    'x-rapidapi-host': "api-football-beta.p.rapidapi.com",
    'x-rapidapi-key': "c886db8dc289d7973187aef5780213c6",
  };

  Future<List<Takim>> getSuggestion(String? query) async {
    final Uri apiUrl =
        Uri.parse("https://v1.basketball.api-sports.io/teams?search=$query");
    Response res = await get(apiUrl, headers: header1);

    if (res.statusCode == 200) {
      // this means that we are connected to the database
      var body = jsonDecode(res.body);
      print("Api service: $body");
      List<dynamic> matchesList = body['response'];
      // for debugging

      List<Takim> matches =
          matchesList.map((dynamic item) => Takim.fromJson(item)).toList();

      return matches;
    } else {
      throw Exception('Failed to load fixture');
    }
  }

  Future<List<SearchTeam>> getSuggestions(String? query) async {
    final Uri apiUrl =
        Uri.parse("https://v3.football.api-sports.io/teams?search=$query");

    Response res = await get(apiUrl, headers: headers);
    // ignore: prefer_typing_uninitialized_variables

    if (res.statusCode == 200) {
      // this means that we are connected to the database
      var body = jsonDecode(res.body);
      print("Api service: $body");
      List<dynamic> matchesList = body['response'];
      // for debugging

      List<SearchTeam> matches =
          matchesList.map((dynamic item) => SearchTeam.fromJson(item)).toList();

      return matches;
    } else {
      throw Exception('Failed to load fixture');
    }
  }

  Future<List<PlayerStatistics>> getPlayers(String? query) async {
    final Uri apiUrl = Uri.parse(
        "https://v3.football.api-sports.io/players?search=$query&league=203");

    Response res = await get(apiUrl, headers: headers);

    if (res.statusCode == 200) {
      // this means that we are connected to the database
      var body = jsonDecode(res.body);
      print("Api service: $body");
      List<dynamic> matchesList = body['response'];
      // for debugging

      List<PlayerStatistics> matches = matchesList
          .map((dynamic item) => PlayerStatistics.fromJson(item))
          .toList();

      return matches;
    } else {
      throw Exception('Failed to load fixture');
    }
  }

  Future<List<Coach>> getCoach(String? query) async {
    final Uri apiUrl =
        Uri.parse("https://v3.football.api-sports.io/coachs?search=$query");

    Response res = await get(apiUrl, headers: headers);

    if (res.statusCode == 200) {
      // this means that we are connected to the database
      var body = jsonDecode(res.body);
      print("Api service: $body");
      List<dynamic> matchesList = body['response'];
      // for debugging

      List<Coach> matches =
          matchesList.map((dynamic item) => Coach.fromJson(item)).toList();

      return matches;
    } else {
      throw Exception('Failed to load Coach');
    }
  }

  Future<List<PlayerStatistics>> getIstatistik(
      String? param, String? selectedSeason, int? leagueID) async {
    List<String> parts = selectedSeason!.split("/");
    String result = parts[0];
    final Uri apiUrl = Uri.parse(
      "https://v3.football.api-sports.io/players/$param?season=$result&league=$leagueID",
    );
    Response res = await get(apiUrl, headers: headers);

    if (res.statusCode == 200) {
      // this means that we are connected to the database
      var body = jsonDecode(res.body);
      print("Api service: $body");
      List<dynamic> matchesList = body['response'];
      // for debugging

      List<PlayerStatistics> matches = matchesList
          .map((dynamic item) => PlayerStatistics.fromJson(item))
          .toList();

      return matches;
    } else {
      throw Exception('Failed to load fixture');
    }
  }

  Future<List<LiveScore>> getFixture(
      String? selectedSeason, int? leagueID) async {
    List<String> parts = selectedSeason!.split("/");
    String result = parts[0];
    final Uri apiUrl = Uri.parse(
        //"https://v3.football.api-sports.io/fixtures?season=$result&league=$leagueID");
        "https://v3.football.api-sports.io/fixtures?season=$result&league=$leagueID");
    Response res = await get(apiUrl, headers: headers);

    if (res.statusCode == 200) {
      // this means that we are connected to the database
      var body = jsonDecode(res.body);
      print("Api service: $body");
      List<dynamic> matchesList = body['response'];
      // for debugging

      List<LiveScore> matches =
          matchesList.map((dynamic item) => LiveScore.fromJson(item)).toList();

      return matches;
    } else {
      throw Exception('Failed to load fixture');
    }
  }

  Future<List<LiveScore>> getSelectedFixture(int? selectedFixture) async {
    final Uri apiUrl = Uri.parse(
        "https://v3.football.api-sports.io/fixtures?id=$selectedFixture");
    Response res = await get(apiUrl, headers: headers4);

    if (res.statusCode == 200) {
      // this means that we are connected to the database
      var body = jsonDecode(res.body);
      print("Api service: $body");
      List<dynamic> matchesList = body['response'];
      // print("Api service: $matchesList");
      // for debugging

      List<LiveScore> matches =
          matchesList.map((dynamic item) => LiveScore.fromJson(item)).toList();

      return matches;
    } else {
      throw Exception('Failed to load fixture');
    }
  }

  Future<List<Event>> getFixtureEvent(int? selectedFixture) async {
    final Uri apiUrl = Uri.parse(
        "https://v3.football.api-sports.io/fixtures/events?fixture=$selectedFixture");
    Response res = await get(apiUrl, headers: headers);

    if (res.statusCode == 200) {
      // this means that we are connected to the database
      var body = jsonDecode(res.body);
      print("Api service: $body");
      List<dynamic> matchesList = body['response'];
      // print("Api service: $matchesList");
      // for debugging

      List<Event> matches =
          matchesList.map((dynamic item) => Event.fromJson(item)).toList();

      return matches;
    } else {
      throw Exception('Failed to load fixture');
    }
  }

  Future<List<LineupData>> getFixtureLineUp(int? selectedFixture) async {
    final Uri apiUrl = Uri.parse(
        "https://v3.football.api-sports.io/fixtures/lineups?fixture=$selectedFixture");
    Response res = await get(apiUrl, headers: headers);

    if (res.statusCode == 200) {
      // this means that we are connected to the database
      var body = jsonDecode(res.body);
      print("Api service: $body");
      List<dynamic> matchesList = body['response'];
      // print("Api service: $matchesList");
      // for debugging

      List<LineupData> matches =
          matchesList.map((dynamic item) => LineupData.fromJson(item)).toList();

      return matches;
    } else {
      throw Exception('Failed to load fixture');
    }
  }

  Future<List<FixtureResult>> getFixtureStatistic(int? selectedFixture) async {
    final Uri apiUrl = Uri.parse(
        "https://v3.football.api-sports.io/fixtures/statistics?fixture=$selectedFixture");
    // "https://api-football-beta.p.rapidapi.com/fixtures/events?fixture=37899");
    //  "https://v1.football.api-sports.io/fixtures/events?fixture=37899");
    Response res = await get(apiUrl, headers: headers);

    if (res.statusCode == 200) {
      // this means that we are connected to the database
      var body = jsonDecode(res.body);
      print("Api service: $body");
      List<dynamic> matchesList = body['response'];
      // print("Api service: $matchesList");
      // for debugging

      List<FixtureResult> matches = matchesList
          .map((dynamic item) => FixtureResult.fromJson(item))
          .toList();

      return matches;
    } else {
      throw Exception('Failed to load fixture');
    }
  }

  Future<List<LiveScore>> getLiveFixture() async {
    Response res = await get(apiUrl2, headers: headers);
    print("Button pressed");
    if (res.statusCode == 200) {
      // this means that we are connected to the database
      var body = jsonDecode(res.body);
      print("Api service: $body");
      List<dynamic> matchesList = body['response'];
      // for debugging

      List<LiveScore> matches =
          matchesList.map((dynamic item) => LiveScore.fromJson(item)).toList();

      return matches;
    } else {
      throw Exception('Failed to load fixture');
    }
  }

  Future<List<PuanTablosu>> getAllMatches(
      String? selectedSeason, int? leagueID) async {
    List<String> parts = selectedSeason!.split("/");
    String result = parts[0];
    final Uri apiUrl = Uri.parse(
        "https://v3.football.api-sports.io/standings?season=$result&league=$leagueID");
    Response res = await get(apiUrl, headers: headers);

    if (res.statusCode == 200) {
      var body = jsonDecode(res.body);
      print("Api service: $body");
      List<dynamic> matchesList = body['response'];

      List<PuanTablosu> matches = matchesList
          .map((dynamic item) => PuanTablosu.fromJson(item))
          .toList();

      return matches;
    } else {
      throw Exception('Failed to load standing');
    }
  }

  Future<List<BasketballGamesModel>> getBasketballGames() async {
    DateTime today = DateTime.now();
    String formattedDate = DateFormat('yyyy-MM-dd').format(today);

    final Uri apiUrl = Uri.parse(
        "https://v1.basketball.api-sports.io/games?date=$formattedDate");
    Response res = await get(apiUrl, headers: header1);

    if (res.statusCode == 200) {
      var body = jsonDecode(res.body);
      print("Api service: $body");
      List<dynamic> matchesList = body['response'];
      List<BasketballGamesModel> matches = matchesList
          .map((dynamic item) => BasketballGamesModel.fromJson(item))
          .toList();
      return matches;
    } else {
      throw Exception('Failed to load fixture');
    }
  }

  Future<List<VolleyballGamesModel>> getVolleyballGames() async {
    DateTime today = DateTime.now();
    String formattedDate = DateFormat('yyyy-MM-dd').format(today);

    final Uri apiUrl = Uri.parse(
        "https://v1.volleyball.api-sports.io/games?date=$formattedDate");
    Response res = await get(apiUrl, headers: header3);

    if (res.statusCode == 200) {
      var body = jsonDecode(res.body);
      print("Api service: $body");
      List<dynamic> matchesList = body['response'];
      List<VolleyballGamesModel> matches = matchesList
          .map((dynamic item) => VolleyballGamesModel.fromJson(item))
          .toList();
      return matches;
    } else {
      throw Exception('Failed to load fixture');
    }
  }

  Future<List<LiveScore>> getAllFixture() async {
    DateTime today = DateTime.now();
    String formattedDate = DateFormat('yyyy-MM-dd').format(today);

    final Uri apiUrl = Uri.parse(
        "https://v3.football.api-sports.io/fixtures?date=$formattedDate");
    Response res = await get(apiUrl, headers: headers);
    print("Button pressed");
    if (res.statusCode == 200) {
      // this means that we are connected to the database
      var body = jsonDecode(res.body);
      print("Api service: $body");
      List<dynamic> matchesList = body['response'];
      // for debugging

      List<LiveScore> matches =
          matchesList.map((dynamic item) => LiveScore.fromJson(item)).toList();

      return matches;
    } else {
      throw Exception('Failed to load fixture');
    }
  }
}
