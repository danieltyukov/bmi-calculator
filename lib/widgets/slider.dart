import 'package:flutter/material.dart';
import 'package:bmi_calculator/widgets/reuseable_card.dart';
import '../properties/constants.dart';

class SliderWidget extends StatefulWidget {
  @override
  _SliderWidgetState createState() => _SliderWidgetState();
}

class _SliderWidgetState extends State<SliderWidget> {
  int height = 180;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ReuseableCard(
        colorType: kActiveCardColor,
        cardChild: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'HEIGHT',
              style: labeTextStyle,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              //
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              //
              children: <Widget>[
                Text(
                  height.toString(),
                  style: kBulkyLetters,
                ),
                Text(
                  'cm',
                  style: labeTextStyle,
                )
              ],
            ),
            SliderTheme(
              data: SliderTheme.of(context).copyWith(
                inactiveTrackColor: Color(0xFF8D8E98),
                thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
                thumbColor: Color(0xFFEB1555),
                activeTrackColor: Colors.white,
                overlayColor: Color(0x29EB1555),
              ),
              child: Slider(
                value: height.toDouble(),
                min: 100.0,
                max: 220.0,
                onChanged: (double newValue) {
                  setState(() {
                    height = newValue.round();
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
