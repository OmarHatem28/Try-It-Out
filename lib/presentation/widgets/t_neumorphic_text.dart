import 'package:flutter/material.dart';

class TNeumorphicText extends StatelessWidget {
  final String text;
  final double? fontSize;
  final Color? color;

  const TNeumorphicText(this.text, {Key? key, this.fontSize, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: fontSize ?? 35,
        shadows: [
          const Shadow(offset: Offset(3, 3), color: Colors.black54, blurRadius: 10),
          Shadow(offset: const Offset(-3, -3), color: Colors.white.withOpacity(0.85), blurRadius: 10),
        ],
        color: color ?? Colors.white,
      ),
    );
  }
}
