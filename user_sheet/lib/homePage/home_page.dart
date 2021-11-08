import 'package:flutter/material.dart';
import 'package:user_sheet/homePage/button_elevate.dart';

class MyHomePage extends StatelessWidget {
 // late BuildContext context;
  late Color color = Colors.black;
  late String buttonName = "name";
 // late Function function;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text("List of path"),
        ),

      body: ListView(
        children: [
          Column(
            children: [
              Button_Elevate(color: Colors.orange, buttonName: 'Walls and rempards',start: 1,last: 32,funtion: (){}),
              Button_Elevate(color: Colors.pink, buttonName: 'Handcrafts',start: 0,last: 12,funtion: (){}),
              Button_Elevate(color: Colors.brown, buttonName: 'Monuments And Souks',start: 0,last: 12,funtion: (){}),
              Button_Elevate(color: Colors.blue, buttonName: 'Wisdom And Knowledge',start: 0,last: 12,funtion: (){}),
              Button_Elevate(color: Colors.green, buttonName: 'Places And Andalusian Gandens',start: 0,last: 12,funtion: (){}),
              Button_Elevate(color: Colors.purple, buttonName: 'Fes Jdid',start: 0,last: 12,funtion: (){}),
            ],
          ),


        ],
      ),
    );
  }


}

