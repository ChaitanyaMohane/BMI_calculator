import 'package:flutter/material.dart';

// ignore: camel_case_types
class reused_card extends StatelessWidget {
  reused_card({@required this.col, this.cardChild, this.onPress});

  final Color col;
  final Widget cardChild;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: col,
          borderRadius: BorderRadius.circular(10.0),
        ),
        height: 200.0,
        width: 170.0,
      ),
    );
  }
}
