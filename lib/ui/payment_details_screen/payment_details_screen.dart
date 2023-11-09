import 'package:flutter/material.dart';
class PaymentDetailsScreen extends StatefulWidget {
  const PaymentDetailsScreen({super.key});

  @override
  State<PaymentDetailsScreen> createState() => _PaymentDetailsScreenState();
}

class _PaymentDetailsScreenState extends State<PaymentDetailsScreen> {
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
                        onPressed: () {
                          final snackBar = SnackBar(
                            content: const Text('Payment successful!'),
                            action: SnackBarAction(
                              label: 'ok',
                              onPressed: () {
                                // Some code to undo the change.
                              },
                            ),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
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
}
