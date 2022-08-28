import 'package:flutter/material.dart';
import 'package:payment/screens/kiosk.dart';
import 'package:payment/screens/visa_card.dart';

class ToggelScreen extends StatelessWidget {
  const ToggelScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        
        body: Container(
          padding: EdgeInsets.all(20),
          width: double.infinity,
          height: double.infinity,

          child: Column(
            children: [
              Expanded(
                child: InkWell(
                  onTap: (){
                    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => VisaCardScreen(),), (route) => false);
                  },
                  child: Container(

                    decoration: BoxDecoration(
                      border: Border.all(width: 0.4),
                    ),

                    height: 200,
                    width: 300,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 100,
                          width: 200,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            image: DecorationImage(
                              image: NetworkImage('https://pngimg.com/uploads/visa/small/visa_PNG38.png',),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Text("Visa Card",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 20),),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: InkWell(
                  onTap: (){
                    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => KioskScerrn(),), (route) => false);
                  },
                  child: Container(

                    decoration: BoxDecoration(
                      border: Border.all(width: 0.4),
                    ),

                    height: 200,
                    width: 300,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 200,
                          width: 200,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            image: DecorationImage(
                              image: NetworkImage('https://img.freepik.com/premium-vector/tickets-kiosk-flat-concept-icon-illustration-isolated_151150-4839.jpg?w=2000',),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Text("Koisk ",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 20),),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
