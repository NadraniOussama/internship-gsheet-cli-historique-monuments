
import 'package:flutter/material.dart';
import 'package:user_sheet/list/showplaces.dart';
class Button_Elevate extends StatelessWidget {
  const Button_Elevate({
    Key? key,
    required this.color,
    required this.buttonName,
    required this.funtion,
    required this.start,
    required this.last,
  }) : super(key: key);

  final Color color;
  final String buttonName;
  final Function funtion;
  final int start,last;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      height: 50.0,
      width: 300,
      child: ElevatedButton(
        style: ButtonStyle(
            padding: MaterialStateProperty.resolveWith(
                    (states) => const EdgeInsets.all(10.0)),
            foregroundColor: MaterialStateColor.resolveWith((states) => color),
            backgroundColor:
            MaterialStateColor.resolveWith((states) => Colors.white),
            shape: MaterialStateProperty.resolveWith(
                  (states) => RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  side: BorderSide(color: color)),
            )),
        onPressed: (){
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => ShowPlaces(buttonName,start,last,color) ) );
        },
        child: Text(
          buttonName,
          style: const TextStyle(fontSize: 15),
        ),
      ),
    );
  }
}

