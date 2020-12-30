import 'package:flutter/material.dart';
import '../properties/constants.dart';

//

class CardChild extends StatelessWidget {
  final IconData iconType;
  final String gender;

  const CardChild({this.iconType, this.gender});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          iconType,
          size: 80.0,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text('$gender', style: labeTextStyle),
      ],
    );
  }
}
