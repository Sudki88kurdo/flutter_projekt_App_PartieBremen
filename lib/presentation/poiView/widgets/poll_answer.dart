import 'package:flutter/material.dart';

Widget answerCard(String text, BuildContext context, bool isSelected) {
  return Padding(
    padding: const EdgeInsets.all(5.0),
    child: Container(
      width: MediaQuery.of(context).size.width * 0.6,
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20))),
        color: isSelected ? Colors.grey.shade400 : Colors.white,
        elevation: 5,
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.grey.shade700,
            ),
          ),
        ),
      ),
    ),
  );
}
