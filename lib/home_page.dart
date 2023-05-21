import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_math/const.dart';
import 'package:flutter_math/util/my_button.dart';
import 'package:flutter_math/util/result_message.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //numpad list
  List<String> numberPad = [
    '7',
    '8',
    '9',
    'AC',
    '4',
    '5',
    '6',
    'DEL',
    '1',
    '2',
    '3',
    '=',
    '0'
  ];

  //numner a and number b
  int numberA = 1;
  int numberB = 1;

  //user answer
  String userAnswer = '';

  //user tapped a button
  void buttonTapped(String button) {
    setState(() {
      if (button == '=') {
        //calculate user is correct or incorrect
        checkResult();
      } else if (button == 'AC') {
        userAnswer = '';
      } else if (button == 'DEL') {
        if (userAnswer.isNotEmpty) {
          userAnswer = userAnswer.substring(0, userAnswer.length - 1);
        }
      } else if (userAnswer.length < 3) {
        userAnswer += button;
      }
    });
  }

  //check is user is correct or not
  void checkResult() {
    if (numberA + numberB == int.parse(userAnswer)) {
      showDialog(
          context: context,
          builder: (context) {
            return ResultMessage(
                message: 'Correct',
                onTap: goToNextQuestion,
                icon: Icons.arrow_forward);
          });
    } else {
      showDialog(
          context: context,
          builder: (context) {
            return ResultMessage(
                message: 'Try again!!',
                onTap: goBackToQuestion,
                icon: Icons.rotate_left);
          });
    }
  }

  //create random numbers
  var randomNumber = Random();

  void goToNextQuestion() {
    Navigator.of(context).pop();

    //reset values

    setState(() {
      userAnswer = '';
    });

    // create new question
    numberA = randomNumber.nextInt(30);
    numberB = randomNumber.nextInt(30);
  }

  void goBackToQuestion() {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      body: Column(
        children: [
          //level progress

          Container(
              height: 170,
              color: Colors.red,
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('The Maths Quiz!!', style: whiteTextStyle),
                  ],
                ),
              )),
          //question
          Expanded(
            child: Container(
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                        numberA.toString() + ' + ' + numberB.toString() + ' = ',
                        style: whiteTextStyle),
                    //answer box

                    Container(
                      height: 50,
                      width: 100,
                      decoration: BoxDecoration(
                        color: Colors.white60,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Center(
                        child: Text(
                          userAnswer,
                          style: whiteTextStyle,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          //numpad
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: GridView.builder(
                itemCount: numberPad.length,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                ),
                itemBuilder: (context, index) {
                  return MyButton(
                    child: numberPad[index],
                    onTap: () => buttonTapped(numberPad[index]),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
