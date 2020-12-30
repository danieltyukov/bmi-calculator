import 'package:flutter/material.dart';

class ReuseableCard extends StatelessWidget {
  final Color colorType;
  final Widget cardChild;
  //same as a defined variable just actually does smth
  final Function onPress;

  ReuseableCard({@required this.colorType, this.cardChild, this.onPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: colorType,
        ),
      ),
    );
  }
}
