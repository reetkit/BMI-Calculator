import 'package:my_bmi_calculator/reUsableCode.dart';
import 'package:my_bmi_calculator/result_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_bmi_calculator/Bottom_Button.dart';
import 'package:my_bmi_calculator/Calculator_Brain.dart';
import 'IconContent.dart';
import 'Round_Icon_Button.dart';
import 'constants.dart';

enum Gender{
  male,
  female,
  n,
}
class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender=Gender.n;
  int height = 120;
  int weight =60;
  int age = 20;
  // Color maleCardColor = inactiveCardColour;
  // Color femaleCardColor = inactiveCardColour;
  //
  // void updateColor(Gender selectedGender){
  //   if(selectedGender==Gender.male){
  //     if(maleCardColor==inactiveCardColour){
  //       maleCardColor=activeCardColour;
  //       femaleCardColor=inactiveCardColour;
  //     }else{
  //       maleCardColor=inactiveCardColour;
  //     }
  //   }
  //   if(selectedGender==Gender.female){
  //     if(femaleCardColor==inactiveCardColour){
  //       femaleCardColor=activeCardColour;
  //       maleCardColor=inactiveCardColour;
  //     }else{
  //       femaleCardColor=inactiveCardColour;
  //     }
  //   }
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff0A0E21),
        centerTitle: true, 
        title:Text('BMI CALCULATOR',
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
          Expanded(child: Row(
          children: <Widget>[
          Expanded(child:reUseableCode(
            onPress: (){
              setState(() {
                selectedGender=Gender.male;
              });
            },
            colour:selectedGender==Gender.male?kActiveCardColour:kInactiveCardColour,
            cardChild: IconContent(icon:FontAwesomeIcons.mars, text:"MALE"),),),
            Expanded(child:reUseableCode(
              onPress: (){
                setState(() {
                  selectedGender=Gender.female;
                });
              },
              colour:selectedGender==Gender.female?kActiveCardColour:kInactiveCardColour,
              cardChild: IconContent(icon:FontAwesomeIcons.venus, text:"FEMALE"),),),
        ],
        ),
        ),
            Expanded(child:reUseableCode(colour:kActiveCardColour
            ,
            cardChild:Column(
              mainAxisAlignment: MainAxisAlignment.center,
            children:<Widget>[Text('Height'),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: <Widget>[
                Text(height.toString(),style: kNumberTextStyle),
                Text('cm',style: kLabelTextStyle),

              ],
            ),
              SliderTheme(
                data: SliderTheme.of(context).copyWith(
                  inactiveTrackColor: Color(0xff8D8E98),
                  activeTrackColor: Colors.white,
                  thumbColor: Color(0xffEB1555),
                  overlayColor: Color(0x29EB1555),
                  thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                  overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
                ),
                child: Slider(
                  value: height.toDouble(),
                  min: 120.0,
                  max: 220.0,

                  onChanged: (double newValue){
                    setState(() {
                      height=newValue.round();
                    });
                  },

                ),
              )
            ]), onPress: () {  },
            ),
            ),
        Expanded(child: Row(children: <Widget>[
          Expanded(child:reUseableCode(
            colour:kActiveCardColour,
          cardChild: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Weight",
                style: kLabelTextStyle,
              ),
              Text(weight.toString(),
              style: kNumberTextStyle,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
              RoundIconButton(icon: FontAwesomeIcons.minus,
              onPressed: (){
                setState(() {
                  weight--;
                });
              },),
              SizedBox(
                width: 10.0,
              ),
                RoundIconButton(icon: FontAwesomeIcons.plus,
                onPressed: (){
                  setState(() {
                    weight++;
                  });
                },),],
              ),
            ],

          ), onPress: () {  },),),
          Expanded(child:reUseableCode(
            colour:kActiveCardColour,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Age",
                    style: kLabelTextStyle,
                  ),
                  Text(age.toString(),
                    style: kNumberTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      RoundIconButton(icon: FontAwesomeIcons.minus,
                        onPressed: (){
                          setState(() {
                            age--;
                          });
                        },),
                      SizedBox(
                        width: 10.0,
                      ),
                      RoundIconButton(icon: FontAwesomeIcons.plus,
                        onPressed: (){
                          setState(() {
                            age++;
                          });
                        },),],
                  ),
                ],

              ), onPress: () {  },
          ),),
        ],),),
          BottomButton(buttonTitle: "CALCULATE",
            onTap: () {
            CalculatorBrain cal = CalculatorBrain(height: height, weight: weight);

              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ResultsPage(
                    bmiResult: cal.calculateBMI(),
                    resultText: cal.getResult(),
                    interpretation: cal.getInterpretation(),
                  )));
            },)
        ],
      ),
    );
  }
}






