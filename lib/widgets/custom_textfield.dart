import 'package:flutter/material.dart';

import '../constants.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.text,
    this.maxlines = 1,
    this.onsaved,
    this.onChanged,
  });
  final Function(String)? onChanged;

  final String text;
  final int maxlines;
  final void Function(String?)? onsaved;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved: onsaved,
      onChanged: onChanged,
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return "This field is required";
        }
        // else if (value!.substring(0, 1).toLowerCase() ==
        //     value.substring(0, 1)) {
        //   return "Please, Write first letter in upper case";
        // }
        else {
          return null;
        }
      },
      cursorColor: kprimaryColor,
      maxLines: maxlines,
      decoration: InputDecoration(
          hintText: text,
          border: buildBorder(),
          enabledBorder: buildBorder(),
          focusedBorder: buildBorder(kprimaryColor)),
    );
  }

  OutlineInputBorder buildBorder([color]) {
    return OutlineInputBorder(
      borderSide: BorderSide(
        color: color ?? Colors.white,
      ),
      borderRadius: const BorderRadius.all(
        Radius.circular(
          16,
        ),
      ),
    );
  }
}
