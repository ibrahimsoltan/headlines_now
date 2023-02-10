import 'package:flutter/material.dart';
import 'package:headlines_now/models/SourcesResponse.dart';
import 'package:headlines_now/screens/home_screen.dart';
import 'package:headlines_now/shared/network/remote/api_amnger.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({Key? key}) : super(key: key);
  static const String routeName = 'homeScreen';
  @override
  Widget build(BuildContext context) {
    return Container(
      // decoration: BoxDecoration(
      //   color: Colors.white,
      //   image: DecorationImage(image: AssetImage('assets/images/pattern.png'),fit: BoxFit.fill),
      // ),
      child: Scaffold(
        backgroundColor: Colors.white ,
        appBar: AppBar( title: Text("News")
          ,),
        body: HomeScreen(),
      ),
    );
  }

}
