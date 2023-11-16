import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:http/http.dart' as http;
import 'package:peaceworc_agency/bloc/update_payment_status_bloc.dart';
import 'package:peaceworc_agency/payment/payment_manager.dart';
class PaymentDetailsScreen extends StatefulWidget {
  const PaymentDetailsScreen({super.key});

  @override
  State<PaymentDetailsScreen> createState() => _PaymentDetailsScreenState();
}

class _PaymentDetailsScreenState extends State<PaymentDetailsScreen> {
  Map<String, dynamic>? paymentIntent;
  bool isLoading = false;

  @override
  void initState() {
    updatePayment();
    updatePaymentListener();
    super.initState();
  }

  void updatePayment(){
    updatePaymentStatusBloc.updatePayment();
  }
  void updatePaymentListener() {
    setState(() {
      isLoading = true;
    });
    updatePaymentStatusBloc.subject.stream.listen((value) async {
      setState(() {
        isLoading = false;
      });
      if(value.error == null){
        if (value.success == true) {

        } else {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(value.message.toString()),
          ));
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(value.error.toString()),
        ));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Payment Summary:", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black),),
                  SizedBox(height: 10.0,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Caregiver charge:", style: TextStyle(fontSize: 16, color: Colors.black),),
                      Text("25.00", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),),
                    ],
                  ),
                  SizedBox(height: 7.0,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Peaceworc charge:", style: TextStyle(fontSize: 16, color: Colors.black),),
                      Text("20.00", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),),
                    ],
                  ),
                  SizedBox(height: 7.0,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Total amount:", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),),
                      Text("\u002445.00", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),),
                    ],
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromRGBO(0, 0, 0, 1),
                          minimumSize: const Size.fromHeight(50), // NEW
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0)
                          ),
                        ),
                        onPressed: () async {
                          await PaymentManager.makePayment(45, "USD");
                          // final snackBar = SnackBar(
                          //   content: const Text('Payment successful!'),
                          //   action: SnackBarAction(
                          //     label: 'ok',
                          //     onPressed: () async {
                          //       // Some code to undo the change.
                          //
                          //     },
                          //   ),
                          // );
                          // ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        },
                        child: const Text(
                          'Pay \u002445.00',
                          style: TextStyle(fontSize: 16,
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  displayPaymentSheet() async {
    try {
      await Stripe.instance.presentPaymentSheet().then((value) {
        showDialog(
            context: context,
            builder: (_) => AlertDialog(
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Icon(
                    Icons.check_circle,
                    color: Colors.green,
                    size: 100.0,
                  ),
                  SizedBox(height: 10.0),
                  Text("Payment Successful!"),
                ],
              ),
            ));
        paymentIntent = null;
      }).onError((error, stackTrace) {
        throw Exception(error);
      });
    } on StripeException catch (e) {
      print('Error is:---> $e');
      AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: const [
                Icon(
                  Icons.cancel,
                  color: Colors.red,
                ),
                Text("Payment Failed"),
              ],
            ),
          ],
        ),
      );
    } catch (e) {
      print('$e');
    }
  }


}
