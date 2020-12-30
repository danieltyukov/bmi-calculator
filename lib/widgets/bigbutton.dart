import 'package:flutter/material.dart';
import '../properties/constants.dart';

class BigButton extends StatelessWidget {
  final Function onTap;
  final String buttonTitle;

  BigButton({@required this.onTap, this.buttonTitle});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(
          child: Text(
            '$buttonTitle',
            style: kCalculateButton,
          ),
        ),
        color: kBottomContainerColor,
        margin: EdgeInsets.only(top: 10),
        width: double.infinity,
        height: kBottomContainer,
      ),
    );
  }
}
