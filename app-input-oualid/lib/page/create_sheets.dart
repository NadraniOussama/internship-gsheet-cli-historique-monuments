
import 'package:flutter/material.dart';
import 'package:user_sheet/api/user_sheet_api.dart';
import 'package:user_sheet/model/user.dart';
import 'package:user_sheet/page/rounded_button.dart';
import 'package:user_sheet/page/rouned_input_filed.dart';
import 'package:user_sheet/page/save_button.dart';

class CreateSheets extends StatelessWidget{
  late TextEditingController controllerName;
  late TextEditingController controllerEmail;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text(
        'fill in the fields'
        ),),
        resizeToAvoidBottomInset: false,
        body: ListView(
          children: <Widget>[
                RounedInputFiled(
                  size: size, hintText: 'Email', icon: Icons.person, onChanged: (String value) { },),
                RounedInputFiled(
                  size: size, hintText: 'Phone number', icon: Icons.person, onChanged: (String value) { },),
            SizedBox(height: size.height*0.06,),
            RoundedButton(size: size, text: 'Login', color: Colors.blue,textColor: Colors.white, width: 0.8,
            onClicked: () async {
              //await UserSheetApi.init();
            /* final user = {
              UserFields.id : 1,
              UserFields.name: 'Oualid',
              UserFields.email: 'walidelhamdi5@gmail.com',
              UserFields.isBeginner: true
            };
              await UserSheetApi.insert([user]);*/
            },),
            SizedBox(height: size.height*0.04,),
            //ForgetPassword(press:(){}),
          ],
        ));
  }

}

