import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/icon_Content.dart';
import 'package:bmi_calculator/reused_Card.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/result_page.dart';
import 'package:bmi_calculator/calculate_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int height = 180;
  int weight = 60;
  int age = 10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
                child: Row(
              children: <Widget>[
                Expanded(
                  child: reused_card(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    col: selectedGender == Gender.male
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    cardChild: IconContent(
                      icon: FontAwesomeIcons.mars,
                      label: "MALE",
                    ),
                  ),
                ),
                Expanded(
                  child: reused_card(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    col: selectedGender == Gender.female
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    cardChild: IconContent(
                      icon: FontAwesomeIcons.venus,
                      label: "FEMALE",
                    ),
                  ),
                ),
              ],
            )),
            Expanded(
              child: reused_card(
                cardChild: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      'HEIGHT',
                      style: kLabelTextStyle,
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: <Widget>[
                        Text(
                          height.toString(),
                          style: kNumberTextStyle,
                        ),
                        Text(
                          'cm',
                          style: kLabelTextStyle,
                        ),
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        activeTrackColor: Colors.white,
                        inactiveTrackColor: Colors.grey,
                        thumbColor: Color(0xFFEB1555),
                        overlayColor: Color(0x29EB1555),
                        thumbShape: RoundSliderThumbShape(
                          enabledThumbRadius: 15.0,
                        ),
                        overlayShape: RoundSliderOverlayShape(
                          overlayRadius: 30.0,
                        ),
                      ),
                      child: Slider(
                        value: height.toDouble(),
                        min: 120.0,
                        max: 220.0,
                        onChanged: (double newValue) {
                          setState(() {
                            height = newValue.round();
                          });
                        },
                      ),
                    )
                  ],
                ),
                col: kActiveCardColor,
              ),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: reused_card(
                      col: kActiveCardColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'WEIGHT',
                            style: kLabelTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            children: <Widget>[
                              Text(
                                weight.toString(),
                                style: kNumberTextStyle,
                              ),
                              Text(
                                'kg',
                                style: kLabelTextStyle,
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                onPressed: () {
                                  setState(() {
                                    weight++;
                                  });
                                },
                              ),
                              RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                onPressed: () {
                                  setState(() {
                                    weight--;
                                    if (weight < 0) {
                                      Alert(
                                        context: context,
                                        type: AlertType.error,
                                        title: "Are you mad ?",
                                        desc: "Weight Can't be Negative ! ",
                                        buttons: [
                                          DialogButton(
                                            child: Text("Ok",
                                                style: kLabelTextStyle),
                                            onPressed: () =>
                                                Navigator.pop(context),
                                            width: 120,
                                          )
                                        ],
                                      ).show();
                                      weight = 60;
                                    }
                                  });
                                },
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: reused_card(
                      col: kActiveCardColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'AGE',
                            style: kLabelTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            children: <Widget>[
                              Text(
                                age.toString(),
                                style: kNumberTextStyle,
                              ),
                              Text('yrs')
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                onPressed: () {
                                  setState(() {
                                    age++;
                                  });
                                },
                              ),
                              RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                onPressed: () {
                                  setState(() {
                                    age--;
                                    if (age < 1) {
                                      Alert(
                                        context: context,
                                        type: AlertType.error,
                                        title: "Are you mad ?",
                                        desc: "Age Can't be below 0 ! ",
                                        buttons: [
                                          DialogButton(
                                            child: Text("Ok",
                                                style: kLabelTextStyle),
                                            onPressed: () =>
                                                Navigator.pop(context),
                                            width: 120,
                                          )
                                        ],
                                      ).show();
                                      age = 18;
                                    }
                                  });
                                },
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            bottomButton(
              txt: 'CALCULATE',
              onClick: () {
                CalculatorBrain calc =
                    CalculatorBrain(weight: weight, height: height);

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return resultsPage(
                        bmiResult: calc.calculateBMI(),
                        interpretation: calc.getInterpretation(),
                        resultText: calc.getResult(),
                      );
                    },
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}

// ignore: camel_case_types, must_be_immutable
class bottomButton extends StatelessWidget {
  bottomButton({this.txt, this.onClick});
  final String txt;
  final Function onClick;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Container(
        child: Center(
          child: Text(
            txt,
            style: kLargeButtonTextStyle,
          ),
        ),
        color: kBottomContainerColor,
        margin: EdgeInsets.only(top: 10.0),
        width: double.infinity,
        height: kBottomContainerHeight,
      ),
    );
  }
}

class RoundIconButton extends StatelessWidget {
  RoundIconButton({@required this.icon, @required this.onPressed});
  final IconData icon;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      onPressed: onPressed,
      elevation: 6.0,
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
    );
  }
}
