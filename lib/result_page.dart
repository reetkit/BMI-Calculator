import 'dart:ui';

import 'package:my_bmi_calculator/Bottom_Button.dart';
import 'package:my_bmi_calculator/constants.dart';
import 'package:flutter/material.dart';
import 'package:my_bmi_calculator/reUsableCode.dart';


class ResultsPage extends StatelessWidget {
  ResultsPage({required this.interpretation,required this.bmiResult,required this.resultText});
  final String bmiResult;
  final String resultText;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "BMI CALCULATOR",
        ),
        backgroundColor: Color(0xff0a0e21),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(child: Container(
            padding: EdgeInsets.all(15.0),
            alignment: Alignment.bottomLeft,
            child: Text(
              "Your Result",
              style: kTitleTextStyle,
            ),
          ),),
          Expanded(
              flex:5,
              child: reUseableCode(
                colour:kActiveCardColour,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(resultText,
                    style: resultTextStyle,),
                    Text(bmiResult,
                    style: kBMITextStyle,),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                    Text("Normal BMI range:",
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.grey,
                    ),
                    ),
                      SizedBox(
                        height: 5.0,
                      ),

                      Wrap(
                        children: <Widget>[
                        Text('18.5-25 kg/m'),
                        Text(
                          '2',
                          textScaleFactor: 0.7,
                        ),],
                      ),
                    ],),
                    Text(interpretation,
                    textAlign: TextAlign.center,
                    style: kBodyTextStyle,),
                  ],
                ), onPress: () {  },
              ),),
          BottomButton(onTap: (){
            Navigator.pop(context);
          }, buttonTitle: 'RE-CALCULATE')
        ],
      ),
    );
  }
}
