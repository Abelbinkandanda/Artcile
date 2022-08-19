import 'package:article/Screens/Authenfication/login.dart';
import 'package:article/Screens/Authenfication/register.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool visible = true;
  toggle() {
    setState(() {
      visible = !visible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return visible ? Login(toggle) : Register(toggle);
  }
}
