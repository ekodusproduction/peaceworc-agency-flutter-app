import 'package:flutter/material.dart';
import 'package:peaceworc_agency/ui/client_management/client_management_card.dart';
class ClientManagementListScreen extends StatefulWidget {
  const ClientManagementListScreen({super.key});

  @override
  State<ClientManagementListScreen> createState() => _ClientManagementListScreenState();
}

class _ClientManagementListScreenState extends State<ClientManagementListScreen> {
  final List _authorizeOfficer = [
    "Test mark",
    "Isiah Borak",
    "Hennos Todler",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Client Management",
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.bold
          ),
        ),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          ListView.builder(
              shrinkWrap: true,
              itemCount: _authorizeOfficer.length,
              itemBuilder: (context, index){
                return ClientManagementCard(title: _authorizeOfficer[index]);
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
                final snackBar = SnackBar(
                  content: const Text('Added successfully!'),
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
                'Add Client',
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
