import 'package:flutter/material.dart';
import 'package:payment/share/constant/strings.dart';

class KioskScerrn extends StatelessWidget {
  const KioskScerrn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("you should go to with the refrance code to pay",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500)),
          Text("the refrance code is ::",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w700)),
          Text(":: $RefCode ::",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w700,),),
        ],
      ),
    );
  }
}
