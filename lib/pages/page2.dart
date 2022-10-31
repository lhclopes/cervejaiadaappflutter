import 'package:cervejaiadaappflutter/shared/app_images.dart';
import 'package:flutter/material.dart';

class Page2 extends StatefulWidget {
  const Page2({ Key? key }) : super(key: key);

  @override
  _Page1State createState() => _Page1State();
}

class _Page1State extends State<Page2> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amberAccent, 
      child: Image.asset(AppImages.logo, height: 10,)
    );
  }
}