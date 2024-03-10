import 'package:flutter/material.dart';

// MyCustomInputField, is designed to create a customizable input field (text field)
// that is specifically styled and can accept numerical input.

// The widget takes two required parameters: hintText and controller.

// --> hintText is used to display a floating label above the text field,
// providing users with a hint about what information is expected to be entered.

// --> controller is a TextEditingController that allows you to read the text a user has
// entered or control the text displayed in the text field.

class MyCustomInputField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;

  MyCustomInputField({
    required this.hintText,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.always,
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            borderSide: BorderSide(color: Color(0xff2A3B5F)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(color: Color(0xff2A3B5F)),
          ),
          labelText: hintText,
          labelStyle: TextStyle(color:Color(0xff2A3B5F)),
        ),
      ),
    );
  }
}