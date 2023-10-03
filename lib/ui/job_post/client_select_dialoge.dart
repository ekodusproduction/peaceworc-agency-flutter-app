import 'package:flutter/material.dart';
import 'package:peaceworc_agency/helper/constants.dart';
import 'package:peaceworc_agency/ui/client_management/add_client_screen.dart';
import 'package:peaceworc_agency/ui/client_management/search_client_screen.dart';
class ClientSelectDialoge extends StatefulWidget {
  const ClientSelectDialoge({super.key});

  @override
  State<ClientSelectDialoge> createState() => _ClientSelectDialogeState();
}


class _ClientSelectDialogeState extends State<ClientSelectDialoge> {

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: contentBox(context),
    );
  }

  contentBox(context){
    return Container(
      padding: EdgeInsets.only(left: Constants.padding, top: Constants.padding,right: Constants.padding,bottom: Constants.padding
      ),
      margin: EdgeInsets.only(top: Constants.avatarRadius),
      decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: Colors.white,
          borderRadius: BorderRadius.circular(Constants.padding),
          boxShadow: [
            BoxShadow(color: Colors.black,offset: Offset(0,10),
                blurRadius: 10
            ),
          ]
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(Icons.person_add_alt_1_outlined, color: Colors.black,),
              SizedBox(width: 10.0,),
              Text("Add Client", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black),)
            ],
          ),
          SizedBox(height: 10.0,),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0),
              border: Border.all()
            ),
            child: ListTile(
              title: const Text('Add New Client'),
              leading: Radio<String>(
                value: 'add new client',
                groupValue: '',
                onChanged: (String? v){
                  Navigator.of(context).pop();
                  Navigator.push(context, MaterialPageRoute(builder: (context) => AddClientScreen()));
                },
              )
            ),
          ),
          SizedBox(height: 10.0,),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                border: Border.all()
            ),
            child: ListTile(
                title: const Text('Add Existing Client'),
                leading: Radio<String>(
                  value: 'add existing client',
                  groupValue: '',
                  onChanged: (String? v){
                    Navigator.of(context).pop();
                    Navigator.push(context, MaterialPageRoute(builder: (context) => SearchClientScreen()));
                  },
                )
            ),
          ),
        ],
      ),
    );
  }
}
