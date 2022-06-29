import 'dart:async';

import 'package:flutter/material.dart';
import 'package:todoappwithfunctions/screens/home.dart';

import 'home_page.dart';

class Splash extends StatefulWidget {
  const Splash({ Key? key }) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
void initState(){
  super.initState();
  Timer(const Duration(seconds:3), () => Navigator.pushReplacement( context,
        MaterialPageRoute(
          builder: (context) => const TodoApp()),
  )
  );
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.lightBlue,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
            Icons.check_box_rounded,
            size: 50,
            ),
            const Text("TODO APP",
            style: TextStyle(fontSize: 40, 
            fontWeight: FontWeight.bold),)
          ],
          
        ),
      ),
    );
  }
}