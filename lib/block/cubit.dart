
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment/block/states.dart';
import 'package:payment/model/first_token.dart';
import 'package:payment/network/dio_helper.dart';
import 'package:payment/share/constant/strings.dart';

class PaymentCubit extends Cubit<payementState>
{
  PaymentCubit():super(paymenetInit());

  static PaymentCubit get(context)=>BlocProvider.of(context);

  FirstToken? firstToken;

   Future GetFirstToken(String price,String phone,String firstName,String lastName,String Email,) async
  {
    print("Iam here can you see me    $price");
    DioHelper.postData(url: '/auth/tokens', data: {"api_key": paymobeApiKey}).then((value)
    {
      PaymobeFirstToken=value.data['token'];
      print('data is : ${PaymobeFirstToken.toString()}');
      GetOrderID(price, phone, firstName, lastName, Email);
      emit(paymenetSuccssed());

    }).catchError(
            (error)
        {
          emit(paymenetError(error: error));
          print(error);
        });
  }
  
  
  Future GetOrderID(String price,String phone,String firstName,String lastName,String Email,)async
  {
    DioHelper.postData(
      url: 'ecommerce/orders',
      data: {
        "auth_token": PaymobeFirstToken,
        "delivery_needed": "false",
        "amount_cents": price,
        "currency": "EGP",},).then((value) {
      OrderId=value.data["id"].toString();
      print("id is : $OrderId");
      GetFinalToken(price, phone, firstName, lastName, Email);
      GetFinalTokenKiosk(price, phone, firstName, lastName, Email);
      emit(paymenetOrderIDSuccssed());
    }).catchError((error){
      print(error);
          emit(paymenetOrderIDError());
    });
  }
  
  
  Future GetFinalToken(String price,String phone,String firstName,String lastName,String Email,)async
  {
    DioHelper.postData(url: 'acceptance/payment_keys', data: {
      "auth_token": PaymobeFirstToken,
      "amount_cents": price,
      "expiration": 3600,
      "order_id": OrderId,
      "billing_data": {
        "apartment":  "NA",
        "email": Email,
        "floor":  "NA",
        "first_name": firstName,
        "street":  "NA",
        "building":  "NA",
        "phone_number": phone,
        "shipping_method":  "NA",
        "postal_code":  "NA",
        "city":  "NA",
        "country":  "NA",
        "last_name": lastName,
        "state":  "NA"
      },
      "currency": "EGP",
      "integration_id": IntegrationIdCard,
      "lock_order_when_paid": "false"
    }).then((value) {
      FinalTokenCard=value.data['token'];
      print("final token is  : ${FinalTokenCard}");
      emit(paymenetRequestTokenSuccssed());

    }
    ).catchError((error){emit(paymenetRequestTokenError(error: error));});
  }


// final kiosk token
  Future GetFinalTokenKiosk(String price,String phone,String firstName,String lastName,String Email,)async
  {
    DioHelper.postData(url: 'acceptance/payment_keys', data: {
      "auth_token": PaymobeFirstToken,
      "amount_cents": price,
      "expiration": 3600,
      "order_id": OrderId,
      "billing_data": {
        "apartment":  "NA",
        "email": Email,
        "floor":  "NA",
        "first_name": firstName,
        "street":  "NA",
        "building":  "NA",
        "phone_number": phone,
        "shipping_method":  "NA",
        "postal_code":  "NA",
        "city":  "NA",
        "country":  "NA",
        "last_name": lastName,
        "state":  "NA"},
      "currency": "EGP",
      "integration_id": IntegrationIdKios,
      "lock_order_when_paid": "false"
    }).then((value) {
      FinalTokenkiosk=value.data['token'];
      print("final token is kiosk : ${FinalTokenkiosk}");
      GetRefrancekiosk();
      emit(paymenetRequestTokenkioskSuccssed());
    }
    ).catchError((error){emit(paymenetRequestTokenkioskError(error: error));});
  }



  Future GetRefrancekiosk()async
  {
    DioHelper.postData(url: 'acceptance/payments/pay', data: {

      "source": {
        "identifier": "AGGREGATOR",
        "subtype": "AGGREGATOR"
      },
      "payment_token": FinalTokenkiosk,
    }).then((value) {
      RefCode=value.data['id'].toString();
      print("Ref Code is kiosk : ${RefCode.toString()}");
      emit(paymenetRefkioskSuccssed());
    }
    ).catchError((error){
      print(error);
      emit(paymenetRefkioskError(error: error));});
  }
}