import 'package:article/widgets/CustomTextField.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  CustomTextField emailText = new CustomTextField(
    title: "Email",
    placeholder: "Enter Email",
  );
  CustomTextField passText = new CustomTextField(
    title: "Password",
    placeholder: "********",
    ispass: true,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
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
                  onPressed: () {},
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
                    Text("Avez-vous un compte?"),
                    FlatButton(
                        onPressed: () {},
                        child: Text(
                          "Register",
                          style: TextStyle(color: Colors.redAccent),
                        ))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
