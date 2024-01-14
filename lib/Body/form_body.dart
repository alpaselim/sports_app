import 'package:flutter/material.dart';
import 'package:sports_app/Data/models/standing_model.dart';
import 'package:sports_app/Utils/Widgets/form_table_row.dart';
import 'package:sports_app/Utils/Widgets/form_top_row.dart';

Widget formBody(List<PuanTablosu> allmatches) {
  List<Widget> children = [];

  children.add(formTopRow());
  int leagulength = allmatches[0].league.standings[0].length;
  for (int index = 0; index < leagulength; index++) {
    children.add(formTableRow(allmatches, index));
  }

  return ListView(children: children);
}
