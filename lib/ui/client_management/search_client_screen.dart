import 'package:flutter/material.dart';
import 'package:peaceworc_agency/bloc/search_client_bloc.dart';
import 'package:peaceworc_agency/model/search_client/search_client_response.dart';
import 'package:peaceworc_agency/ui/client_management/search_client_card.dart';
class SearchClientScreen extends StatefulWidget {
  const SearchClientScreen({super.key});

  @override
  State<SearchClientScreen> createState() => _SearchClientScreenState();
}

class _SearchClientScreenState extends State<SearchClientScreen> {
  bool isLoading = false;

  @override
  void initState() {
    searchClient();
    searchClientListener();
    super.initState();
  }
  void searchClient(){
    searchClientBloc.searchClient('');
  }
  void searchClientListener() {
    setState(() {
      isLoading = true;
    });
    searchClientBloc.subject.stream.listen((value) async {
      setState(() {
        isLoading = false;
      });
      if(value.error == null){
        if (value.success == true) {
          /*ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(value.message.toString()),
          ));*/
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
      body: Scaffold(
        appBar: AppBar(
          title: Text("Search Client", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15.0),),
        ),
        body: Column(
          children: [
            StreamBuilder<SearchClientResponse>(
              stream: searchClientBloc.subject.stream,
              builder: (context, snapshot){
                if(snapshot.hasData){
                  print("snapshot error => ${snapshot.error}");
                  return ListView.builder(
                      shrinkWrap: true,
                      itemCount: snapshot.data!.data!.length,
                      itemBuilder: (context, index){
                        Data _data = snapshot.data!.data![index];
                        return SearchClientCard(title: _data.name!,);
                      });
                }else{
                  return _noDataLay();
                }
              },
            ),
          ],
        ),
      )
    );
  }

  Widget _noDataLay() {
    return Center(child: Text("No data found.", style: TextStyle(color: Colors.black),),);
  }

  @override
  void dispose() {
    searchClientBloc.dispose();
    super.dispose();
  }
}
