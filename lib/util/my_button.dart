import 'package:flutter/material.dart';
import '../const.dart';
import 'package:flutter/src/material/colors.dart';

class MyButton extends StatelessWidget {
  final String child;
  final VoidCallback onTap;
  var buttonColor = Colors.orangeAccent;
  MyButton({Key? key, required this.child, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (child == 'AC') {
      buttonColor = Colors.greenAccent;
    } else if (child == 'DEL') {
      buttonColor = Colors.redAccent;
    }
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
              color: buttonColor, borderRadius: BorderRadius.circular(4)),
          child: Center(
              child: Text(
            child,
            style: whiteTextStyle,
          )),
        ),
      ),
    );
  }
}
