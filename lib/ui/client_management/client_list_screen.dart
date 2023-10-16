import 'package:flutter/material.dart';
import 'package:peaceworc_agency/bloc/get_client_bloc.dart';
import 'package:peaceworc_agency/model/get_client/get_client_response.dart';
import 'package:peaceworc_agency/ui/client_management/add_client_screen.dart';
import 'package:peaceworc_agency/ui/client_management/client_management_card.dart';
class ClientManagementListScreen extends StatefulWidget {
  const ClientManagementListScreen({super.key});

  @override
  State<ClientManagementListScreen> createState() => _ClientManagementListScreenState();
}

class _ClientManagementListScreenState extends State<ClientManagementListScreen> {
  bool isLoading = false;

  @override
  void initState() {
    getClient();
    super.initState();
  }

  void getClient(){
    getClientBloc.getClient();
  }

  void getClientListener() {
    setState(() {
      isLoading = true;
    });
    getClientBloc.subject.stream.listen((value) async {
      setState(() {
        isLoading = false;
      });
      if(value.error == null){
        if (value.success == true) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(value.message.toString()),
          ));
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
          StreamBuilder(
            stream: getClientBloc.subject.stream,
            builder: (context, snapshot){
              if(snapshot.hasData){
                return ListView.builder(
                    shrinkWrap: true,
                    itemCount: snapshot.data!.data!.length,
                    itemBuilder: (context, index){
                      Data _data = snapshot.data!.data![index];
                      return ClientManagementCard(data: _data);
                    });
              }else{
                return _noDataLay();
              }
            }
          ),
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
                Navigator.push(context, MaterialPageRoute(builder: (context) => AddClientScreen()));
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

  Widget _noDataLay() {
    return Center(child: Text("No data found.", style: TextStyle(color: Colors.black),),);
  }
}
