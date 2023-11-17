import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

abstract  class PaymentManager{
  static Future<String> makePayment(int amount, String currency) async{
    try{
    String clinetSecret = await _getClientSecret((amount*100).toString(), currency);
    await _initializePaymentSheet(clinetSecret);
    await Stripe.instance.presentPaymentSheet();
    return clinetSecret;
  }catch(error){
throw Exception(error.toString());
    }
    }

    static Future<void> _initializePaymentSheet(String clientSecret) async{
      await Stripe.instance.initPaymentSheet(
          paymentSheetParameters: SetupPaymentSheetParameters(
              paymentIntentClientSecret: clientSecret,
              googlePay: const PaymentSheetGooglePay(testEnv: true, currencyCode: "US", merchantCountryCode: "+92"),
              style: ThemeMode.light,
              merchantDisplayName: 'Adnan'));
    }
  static Future<String> _getClientSecret(String amount, String currency) async {
    Dio dio = Dio();
    try {
//Request body
      Map<String, dynamic> body = {
        'amount': amount,
        'currency': currency,
      };
//Make post request to Stripe

      var response = await dio.post(
        'https://api.stripe.com/v1/payment_intents',
        options: Options(
          headers: {
            'Authorization': 'Bearer sk_test_51MQJHfL8ZKWD5NB0RSjiA2UpuyCb9IqZYIuUztJNZKkWH0f4voJn2jcqwJe52YTRtzoqm2kG9bZeVFjoRQyOumEA00n1jYW2B4',
            'Content-Type': 'application/x-www-form-urlencoded'
          },
        ),
        data: body,
      );
      return response.data['client_secret'];
    } catch (err) {
      throw Exception(err.toString());
    }
  }
}