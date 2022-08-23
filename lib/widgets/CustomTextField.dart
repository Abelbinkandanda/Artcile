import 'package:flutter/material.dart';

class CustomTextField {
  final String title;
  final String placeholder;
  final bool ispass;
  String _value = "";
  String err;
  CustomTextField({
    this.title = "",
    this.placeholder = "",
    this.ispass = false,
    this.err = "Pleace specify this field",
  });
  TextEditingController controller = new TextEditingController();
  TextFormField textFormField() {
    return TextFormField(
      controller: controller,
      onChanged: (e) {
        _value = e;
      },
      validator: (e) => e!.isEmpty ? this.err : null,
      obscureText: this.ispass,
      decoration: InputDecoration(
          hintText: this.placeholder,
          labelText: this.title,
          labelStyle: TextStyle(color: Colors.redAccent.withOpacity(.9)),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(1))),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.redAccent))),
    );
  }

  String get value {
    return _value;
  }
}
