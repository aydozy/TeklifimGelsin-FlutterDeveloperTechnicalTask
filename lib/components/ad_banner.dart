import 'package:flutter/material.dart';

// AdBanner, is designed to display an advertisement banner with customizable text.
// The widget is made reusable by accepting the text content as a parameter through its constructor.

class AdBanner extends StatelessWidget {
  final String text;

  AdBanner({required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Align(
        alignment: Alignment.topRight,
        child: Container(
          alignment: Alignment.center,
          width: 100,
          padding: const EdgeInsets.all(4.0),
          decoration: BoxDecoration(
            border: Border.all(color: Color(0xff4EBBB4)),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Align(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                text,
                style: TextStyle(
                    color: Color(0xff4EBBB4), fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
