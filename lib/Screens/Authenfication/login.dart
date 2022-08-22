import 'dart:convert';

import 'package:article/widgets/CustomTextField.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Login extends StatefulWidget {
  final VoidCallback visible;
  Login(this.visible);
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  void login(String email, String pass) async {
    final response = await http.get(
        Uri.parse("https://abkcorp.000webhostapp.com/article/connection.php"));
    // final response = await http
    //     .get("https://abkcorp.000webhostapp.com/article/connection.php");
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      print(data);
    }
  }

  CustomTextField emailText = new CustomTextField(
    title: "Email",
    placeholder: "Enter Email",
  );
  CustomTextField passText = new CustomTextField(
    title: "Password",
    placeholder: "********",
    ispass: true,
  );
  final _key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    emailText.err = "Enter email";
    passText.err = "Enter password";
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Form(
                key: _key,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      "Login",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.red.withOpacity(.8)),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    emailText.textFormField(),
                    SizedBox(
                      height: 10,
                    ),
                    passText.textFormField(),
                    SizedBox(
                      height: 10,
                    ),
                    RaisedButton(
                      onPressed: () {
                        // if (_key.currentState!.validate()) {
                        //   print(emailText.value);
                        //   print("Ok");
                        // }
                        login("", "");
                      },
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      child: Text(
                        "Login",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      color: Colors.redAccent.withOpacity(.7),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Have you an account?"),
                        FlatButton(
                            onPressed: widget.visible,
                            child: Text(
                              "Register",
                              style: TextStyle(color: Colors.redAccent),
                            ))
                      ],
                    )
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
