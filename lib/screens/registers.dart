import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment/block/cubit.dart';
import 'package:payment/block/states.dart';
import 'package:payment/screens/toggel_screen.dart';
import 'package:payment/share/componenet/componenet.dart';

class RegisterScreen extends StatelessWidget {
   RegisterScreen({Key? key}) : super(key: key);

  TextEditingController firstName=TextEditingController();
  TextEditingController lastName=TextEditingController();
  TextEditingController email=TextEditingController();
  TextEditingController password=TextEditingController();
  TextEditingController price=TextEditingController();
  TextEditingController phone=TextEditingController();
  var formkey=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(

      create: ( context) { return PaymentCubit(); },
      child: BlocConsumer<PaymentCubit,payementState>(
        listener: (context, state) {
          if(state is paymenetRefkioskSuccssed)
            {
              Navigator.push(context, MaterialPageRoute(builder: (context) => ToggelScreen(),));
            }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(title:Center(child: Text("PAyment Method"),) ),
            body: SingleChildScrollView(
              child: Form(
                key: formkey,
                child: Column(
                  children: [
                    SizedBox(height: 20,),

                    defultFromFiled(
                        controller: firstName,
                        type: TextInputType.name,
                        validate: (value){
                          if(value!.isEmpty)
                          {
                            return "plz enter your firstName";
                          }
                          return null;
                        }, label: "First Name", prefix: Icons.person),
                    SizedBox(height: 10,),

                    defultFromFiled(
                        controller: lastName,
                        type: TextInputType.name,
                        validate: (value){
                          if(value!.isEmpty)
                          {
                            return "plz enter your lastName";
                          }
                          return null;
                        }, label: "Last Name", prefix: Icons.person),
                    SizedBox(height: 10,),

                    defultFromFiled(
                        controller: email,
                        type: TextInputType.emailAddress,
                        validate: (value){
                          if(value!.isEmpty)
                          {
                            return "plz enter your email";
                          }
                          return null;
                        }, label: "Email", prefix: Icons.email),
                    SizedBox(height: 10,),

                    defultFromFiled(
                        controller: phone,
                        type: TextInputType.number,
                        validate: (value){
                          if(value!.isEmpty)
                          {
                            return "plz enter your phone";
                          }
                          return null;
                        }, label: "phone", prefix: Icons.phone_android),
                    SizedBox(height: 10,),

                    defultFromFiled(
                        controller: price,
                        type: TextInputType.number,
                        validate: (value){
                          if(value!.isEmpty)
                          {
                            return "plz enter your price";
                          }
                          return null;
                        }, label: "price", prefix: Icons.price_change_outlined),
                    SizedBox(height: 10,),
                    defultButton(function: (){
                      if(formkey.currentState!.validate())
                        {
                          PaymentCubit.get(context).GetFirstToken(price.text,phone.text,firstName.text,lastName.text,email.text);
                        }

                    }, text: "pay now"),


                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
