import 'package:flutter/material.dart';

import '../ProjectConstants.dart';

class NoteCard extends StatelessWidget {
  const NoteCard({
    Key key,
    @required this.width,
    @required this.height,
    @required this.color,
    @required this.date,
    @required this.headline,
  }) : super(key: key);

  final double width;
  final double height;
  final Color color;
  final String date;
  final String headline;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width * .44,
      margin: EdgeInsets.only(bottom: width * .04),
      padding: EdgeInsets.all(height * .02),
      decoration: BoxDecoration(
          color: color, borderRadius: BorderRadius.circular(height * .02)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            headline,
            style: TextStyle(
                wordSpacing: 2,
                color: secText,
                fontSize: height * .028,
                fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: height * .015,
          ),
          Text(
            date,
            style: TextStyle(
                wordSpacing: 2,
                color: secData,
                fontSize: height * .024,
                fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
