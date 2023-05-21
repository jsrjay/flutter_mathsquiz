import 'package:flutter/material.dart';
import 'package:flutter_math/const.dart';

class ResultMessage extends StatelessWidget {
  final String message;
  final VoidCallback onTap;
  final icon;
  const ResultMessage(
      {Key? key,
      required this.message,
      required this.onTap,
      required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.orange,
      content: Container(
        height: 200,
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Text(
            message,
            style: whiteTextStyle,
          ),
          GestureDetector(
            onTap: onTap,
            child: Container(
              padding: EdgeInsets.all(4),
              child: Icon(
                icon,
                color: Colors.white,
              ),
            ),
          )
        ]),
      ),
    );
  }
}
