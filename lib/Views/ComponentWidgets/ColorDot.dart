import 'package:flutter/material.dart';

class ColorDot extends StatefulWidget {
  ColorDot({
    Key key,
    @required this.height,
    @required this.size,
    @required this.colorId,
    @required this.color,
  }) ;

  final double height;
  final double size;
  final double colorId;
  final Color color;

  @override
  _ColorDotState createState() => _ColorDotState();
}

class _ColorDotState extends State<ColorDot> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height*widget.size,
      width: widget.height*widget.size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: widget.color,
      ),
    );
  }
}
