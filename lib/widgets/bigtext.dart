import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Bigtext extends StatelessWidget {
  final Color? color;
  final String text;
  double size;
  TextOverflow overFlow;
  Bigtext({Key? key,
  this.color=const Color(0xFF322d2b), 
  this.size=20,
  required this.text,
  this.overFlow=TextOverflow.ellipsis}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow:overFlow,
      style: TextStyle(
        fontFamily: "Roboto",
        fontSize: size,
        color: color,
        fontWeight: FontWeight.w400
      ),   
    );
  }
}