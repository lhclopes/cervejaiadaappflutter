import 'package:flutter/material.dart';

class Page3 extends StatefulWidget {
  const Page3({ Key? key }) : super(key: key);

  @override
  createState() => _Page1State();
}

class _Page1State extends State<Page3> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 14, 0, 78),
      child: Image.asset("lib/images/logo.png", height: 50,)
    );
  }
}