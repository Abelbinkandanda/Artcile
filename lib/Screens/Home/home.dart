import 'dart:html';

import 'package:flutter/material.dart ';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text("HOME"),
      ),
    );
  }
}
