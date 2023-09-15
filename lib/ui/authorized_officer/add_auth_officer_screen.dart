import 'package:flutter/material.dart';
class AddAuthOfficerScreen extends StatefulWidget {
  const AddAuthOfficerScreen({super.key});

  @override
  State<AddAuthOfficerScreen> createState() => _AddAuthOfficerScreenState();
}

class _AddAuthOfficerScreenState extends State<AddAuthOfficerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Authorize officer information", style: TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold),),
        actions: [
          Icon(Icons.clear, color: Colors.black, size: 24,)
        ],
      ),
      body: Column(
        children: [

        ],
      ),
    );
  }
}
