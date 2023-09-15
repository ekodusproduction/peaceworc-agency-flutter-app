import 'package:flutter/material.dart';
import 'package:peaceworc_agency/ui/authorized_officer/add_auth_officer_screen.dart';
import 'package:peaceworc_agency/ui/authorized_officer/authorize_officer_card.dart';
class AuthorizeOfficerListScreen extends StatefulWidget {
  const AuthorizeOfficerListScreen({super.key});

  @override
  State<AuthorizeOfficerListScreen> createState() => _AuthorizeOfficerListScreenState();
}

class _AuthorizeOfficerListScreenState extends State<AuthorizeOfficerListScreen> {
  final List _authorizeOfficer = [
    "Test mark",
    "Isiah Borak",
    "Hennos Todler",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Authorized Officers", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          ListView.builder(
              shrinkWrap: true,
              itemCount: _authorizeOfficer.length,
              itemBuilder: (context, index){
                return AuthorizeOfficerCard(title: _authorizeOfficer[index],);
              }),
          Positioned(
            bottom: 30,
            left: 15,
            right: 15,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey[200],
                minimumSize: const Size.fromHeight(50), // NEW
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0)
                ),
              ),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => AddAuthOfficerScreen()));
              },
              child: const Text(
                'Add Authorize Officer',
                style: TextStyle(fontSize: 14,
                    color: Colors.black),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
