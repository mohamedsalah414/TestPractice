import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  final String txt;
  final Color? color;
 final FontWeight? fontWeight;
  final double? fontSize;
  const TextWidget({Key? key, required this.txt, this.color, this.fontWeight, this.fontSize}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   Text(
      txt,
      style: TextStyle(
        color: color,
        fontWeight: fontWeight,
        fontSize: fontSize,
      ),
    );
  }
}
