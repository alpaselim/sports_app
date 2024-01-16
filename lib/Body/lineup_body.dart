import 'package:flutter/material.dart';
import 'package:sports_app/Data/app_constant.dart';
import 'package:sports_app/Data/models/lineup_model.dart';
import 'package:sports_app/Utils/Widgets/lineup_title.dart';

class LineUpBody extends StatefulWidget {
  final List<LineupData> allmatches;

  const LineUpBody(this.allmatches, {super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LineUpBodyState createState() => _LineUpBodyState();
}

class _LineUpBodyState extends State<LineUpBody> {
  int selectedButtonIndex = 1;
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 160,
              child: ElevatedButton(
                onPressed: () {
                  // İlk butona tıklandığında yapılacak işlemler
                  setState(() {
                    selectedButtonIndex = 1;
                    index = 0;
                  });
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  backgroundColor:
                      selectedButtonIndex == 1 ? kLineupBlue : kLineupGrey,
                ),
                child: Text(widget.allmatches[0].team.name),
              ),
            ),
            const SizedBox(width: 16), // Butonlar arasına boşluk eklemek için
            SizedBox(
              width: 160,
              child: ElevatedButton(
                onPressed: () {
                  // İkinci butona tıklandığında yapılacak işlemler
                  setState(() {
                    selectedButtonIndex = 2;
                    index = 1;
                  });
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        20.0), // Kenarları oval yapmak için kullanılır
                  ),
                  backgroundColor:
                      selectedButtonIndex == 2 ? kLineupBlue : kLineupGrey,
                ),
                child: Text(widget.allmatches[1].team.name),
              ),
            ),
          ],
        ),
        Expanded(child: lineUpTitle(widget.allmatches[index])),
      ],
    );
  }
}
