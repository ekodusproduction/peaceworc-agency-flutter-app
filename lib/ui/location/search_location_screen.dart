import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:peaceworc_agency/helper/constants.dart';
import 'package:peaceworc_agency/ui/components/location_list_tile.dart';
import 'package:uuid/uuid.dart';
import 'package:http/http.dart' as http;
class SearchLocationScreen extends StatefulWidget {
  const SearchLocationScreen({super.key});

  @override
  State<SearchLocationScreen> createState() => _SearchLocationScreenState();
}

class _SearchLocationScreenState extends State<SearchLocationScreen> {
  TextEditingController _controller = TextEditingController();
  var uuid = Uuid();
  String _sessionToken = "12344";
  List<dynamic> _placesList = [];

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      onChange();
    });
  }

  void onChange(){
    if(_sessionToken == null){
      setState(() {
        _sessionToken = uuid.v4();
      });
    }

    getSuggestion(_controller.text);
  }

  void getSuggestion(String input) async{
    var kPLACES_API_KEY = placeApiKey;
    String baseURL ='https://maps.googleapis.com/maps/api/place/autocomplete/json';
    String request = '$baseURL?input=$input&key=$kPLACES_API_KEY&sessiontoken=$_sessionToken';

    var response = await http.get(Uri.parse(request));
    var data = response.body.toString();

    print('data');
    print(data);
    if(response.statusCode == 200){
      setState(() {
        _placesList = jsonDecode(response.body.toString()) ['predictions'];
      });
    }else{
      throw Exception('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(10.0),
          child: CircleAvatar(
            child: Icon(Icons.location_on_outlined, size: 18, color: Colors.grey[800],),
            backgroundColor: Colors.grey[200],
          ),
        ),
        title: Text("Set Address", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.black),),
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: CircleAvatar(
              child: Icon(Icons.clear, size: 24, color: Colors.grey[800],),
              backgroundColor: Colors.grey[200],
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Form(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  controller: _controller,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey[200],
                      border: InputBorder.none,
                      hintText: "Search your address",
                      contentPadding:
                      EdgeInsets.only(left: 10.0,right: 40.0, top: 10.0, bottom: 10.0),
                      prefixIcon: Icon(Icons.gps_fixed_outlined),
                  ),
                ),
              )
          ),
          Divider(
            height: 4,
            thickness: 4,
            color: Colors.grey[200],
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey[200],
                minimumSize: const Size.fromHeight(40), // NEW
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0)
                ),
                elevation: 0.0
              ),
              onPressed: () {
                final snackBar = SnackBar(
                  content: const Text('Location fetched successfully'),
                  action: SnackBarAction(
                    label: 'ok',
                    onPressed: () {
                      // Some code to undo the change.
                    },
                  ),
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.gps_fixed_outlined, color: Colors.black, size: 16,),
                  SizedBox(width: 10,),
                  Text(
                    "Use my current location",
                    style: TextStyle(fontSize: 13,
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          Divider(
            height: 4,
            thickness: 4,
            color: Colors.grey[200],
          ),
          Expanded(
              child: ListView.builder(
                  itemCount: _placesList.length.toInt(),
                  itemBuilder: (context, index){
                    return LocationListTile(
                        press: (){},
                        location: _placesList[index]['description']
                    );
                  }
              )
          ),
        ],
      ),
    );
  }
}
