import 'package:bmi_calculator/output.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import './widgets/reuseable_card.dart';
import './widgets/card_child.dart';
import './properties/constants.dart';
import './widgets/slider.dart';
import './widgets/roundiconbutton.dart';
import './output.dart';
import './widgets/bigbutton.dart';
import './brain/calculator_brain.dart';

//stuff that could replicated over the program

//
//enums to enumarise comaprisons for the class
enum GenderCardType {
  male, //0
  female, //1
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  int weight = 60;
  int age = 20;
  int height = 180;
  //
  GenderCardType selectedGender;
  //replaces all the code below cos of turnery operator
  //
  //defining variables
  // Color maleCardColor = inactiveCardColor;
  // Color femaleCardColor = inactiveCardColor;
  // //comapring the defined variables
  // void updateColor({GenderCardType genderType}) {
  //   if (genderType == GenderCardType.male) {
  //     if (maleCardColor == inactiveCardColor) {
  //       maleCardColor = activeCardColor;
  //       femaleCardColor = inactiveCardColor;
  //     } else {
  //       maleCardColor = inactiveCardColor;
  //     }
  //   }
  //   if (genderType == GenderCardType.female) {
  //     if (femaleCardColor == inactiveCardColor) {
  //       femaleCardColor = activeCardColor;
  //       maleCardColor = inactiveCardColor;
  //     } else {
  //       femaleCardColor = inactiveCardColor;
  //     }
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReuseableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = GenderCardType.male;
                      });
                    },
                    //if it is male shuts down female and varies between 2 choices
                    colorType: selectedGender == GenderCardType.male
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    cardChild: CardChild(
                      gender: 'MALE',
                      iconType: FontAwesomeIcons.mars,
                    ),
                  ),
                ),
                Expanded(
                  child: ReuseableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = GenderCardType.female;
                      });
                    },
                    //if it is female shuts down male and varies between 2 choices
                    colorType: selectedGender == GenderCardType.female
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    cardChild: CardChild(
                      gender: 'FEMALE',
                      iconType: FontAwesomeIcons.venus,
                    ),
                  ),
                ),
              ],
            ),
          ),
          //
          SliderWidget(),
          //
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReuseableCard(
                    colorType: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'WEIGHT',
                          style: labeTextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: kBulkyLetters,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  if (weight != 0) {
                                    weight--;
                                  }
                                });
                              },
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(
                                  () {
                                    if (weight != 450) {
                                      weight++;
                                    }
                                  },
                                );
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReuseableCard(
                    colorType: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'AGE',
                          style: labeTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: kBulkyLetters,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  if (age != 0) {
                                    age--;
                                  }
                                });
                              },
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  if (age != 120) {
                                    age++;
                                  }
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          BigButton(
            buttonTitle: 'CALCULATE',
            onTap: () {
              CalculatorBrain calc =
                  CalculatorBrain(height: height, weight: weight);

              //
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultPage(
                    bmiResult: calc.calculateBMI(),
                    resultText: calc.getResults(),
                    interpretation: calc.getInterpretation(),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
