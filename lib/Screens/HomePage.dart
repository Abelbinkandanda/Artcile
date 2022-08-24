import 'package:article/Screens/Authenfication/login.dart';
import 'package:article/Screens/Authenfication/register.dart';
import 'package:article/Screens/Home/home.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool visible = true, login = false;
  toggle() {
    setState(() {
      visible = !visible;
    });
  }

  islogin() {
    setState(() {
      login = !login;
    });
  }

  @override
  Widget build(BuildContext context) {
    return login
        ? Home()
        : visible
            ? Login(toggle, islogin)
            : Register(toggle);
  }
}
