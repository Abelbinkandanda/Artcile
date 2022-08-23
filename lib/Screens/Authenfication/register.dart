import 'dart:convert';

import 'package:article/widgets/CustomTextField.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Register extends StatefulWidget {
  final VoidCallback visible;
  Register(this.visible);
  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  CustomTextField emailText = new CustomTextField(
    title: "Email",
    placeholder: "Enter Email",
  );
  CustomTextField nameText = new CustomTextField(
    title: "Name",
    placeholder: "Enter Name",
  );

  void register(String name, String email, String pass) async {
    final response = await http.post(
        Uri.parse("https://abkcorp.000webhostapp.com/article/register.php"),
        body: {
          "name": name,
          "email": email,
          "pass": pass,
        });
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      print(data);
    }
  }

  CustomTextField passText = new CustomTextField(
    title: "Password",
    placeholder: "********",
    ispass: true,
  );
  CustomTextField confirmpassText = new CustomTextField(
    title: "Confirm Password",
    placeholder: "********",
    ispass: true,
  );
  final _key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    nameText.err = "Enter name";
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
                      "Register",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.red.withOpacity(.8)),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    nameText.textFormField(),
                    SizedBox(
                      height: 10,
                    ),
                    emailText.textFormField(),
                    SizedBox(
                      height: 10,
                    ),
                    passText.textFormField(),
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    confirmpassText.textFormField(),
                    SizedBox(
                      height: 10,
                    ),
                    RaisedButton(
                      onPressed: () {
                        if (_key.currentState!.validate()) {
                          //   print(emailText.value);
                          //   print("Ok");
                        }

                        if (passText.value == confirmpassText.value) {
                          register(
                              nameText.value, emailText.value, passText.value);
                        } else {
                          print("les nots de passes sont differents");
                        }
                      },
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      child: Text(
                        "Register",
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
                              "Login",
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
