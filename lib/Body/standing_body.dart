import 'package:flutter/material.dart';

import 'package:sports_app/Data/models/standing_model.dart';
import 'package:sports_app/Utils/Widgets/table_row.dart';
import 'package:sports_app/Utils/Widgets/top_row.dart';

Widget pageBody(List<PuanTablosu> allmatches) {
  List<Widget> children = [];

  children.add(topRow());
  int leagulength = allmatches[0].league.standings[0].length;
  for (int index = 0; index < leagulength; index++) {
    children.add(tableRow(allmatches, index));
  }

  return ListView(children: children);
}
