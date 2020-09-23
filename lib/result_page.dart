import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/reused_Card.dart';
import 'package:flutter/material.dart';
import 'reused_Card.dart';
import 'input_page.dart';

// ignore: camel_case_types
class resultsPage extends StatelessWidget {
  resultsPage({this.bmiResult, this.interpretation, this.resultText});

  final String bmiResult;
  final String resultText;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(
              height: 10.0,
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.all(15.0),
                child: Text(
                  'Your Result :',
                  style: kTitleTextStyle,
                  textAlign: TextAlign.left,
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: reused_card(
                col: kInactiveCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      resultText.toUpperCase(),
                      style: resultTextStyle,
                    ),
                    Text(
                      bmiResult,
                      style: KBMITextStyle,
                    ),
                    Text(
                      interpretation,
                      textAlign: TextAlign.center,
                      style: KBodyTextStyle,
                    ),
                    bottomButton(
                      txt: 'RE-CALCULATE',
                      onClick: () {
                        Navigator.pop(context);

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return InputPage();
                            },
                          ),
                        );
                      },
                    )
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
