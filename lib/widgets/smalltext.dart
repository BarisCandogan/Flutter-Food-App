import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class smallText extends StatelessWidget {
  final Color color;
  final String text;
  double size;
  double height;
  smallText({
    Key? key,
    this.color = const Color(0xFF9E9E9E),
    this.size = 12,
    this.height = 1.2,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: "Roboto",
        fontSize: size,
        height: height,
        color: color,
      ),
    );
  }
}
