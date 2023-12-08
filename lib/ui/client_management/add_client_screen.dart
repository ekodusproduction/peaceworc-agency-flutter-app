import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:peaceworc_agency/bloc/create_client_bloc.dart';
import 'package:peaceworc_agency/ui/components/address_botto_sheet.dart';
import 'package:peaceworc_agency/ui/location/search_location_screen.dart';
import 'package:peaceworc_agency/utils/validator.dart';
import 'package:permission_handler/permission_handler.dart';

import '../job_post/data_classes.dart';
class AddClientScreen extends StatefulWidget {
  const AddClientScreen({super.key});

  @override
  State<AddClientScreen> createState() => _AddClientScreenState();
}

class _AddClientScreenState extends State<AddClientScreen> with AddClientValidationMixin {
  File? _image;
  final _picker = ImagePicker();
  bool isLoading = false;

  var fullNameController = TextEditingController();
  var mobileController = TextEditingController();
  var emailController = TextEditingController();
  var ageController = TextEditingController();
  final formGlobalKey = GlobalKey < FormState > ();


  String dropdownValue = 'Select gender';
  List <String> spinnerItems = [
    'Select gender',
    'Male',
    'Female',
    'Other',
  ];

  String street = "";
  String description = "";
  String place = "";
  String city = "";
  String state = "";
  bool isAddressAvail = false;

  @override
  void initState() {
    createClientListener();
    super.initState();
  }

  void createClient(File empFace, String empCode){
    createClientBloc.createClient(
      empFace,
      empCode,
      emailController.text,
      fullNameController.text,
      mobileController.text,
      '${street}, ${place}',
      place,
      street,
      'apartment or unit 1',
      '1',
      'boston',
      '12345',
      'state',
      'usa',
      '40.7128',
      '74.0060',
      ageController.text,
      dropdownValue
    );
  }

  void createClientListener() {
    setState(() {
      isLoading = true;
    });
    createClientBloc.subject.stream.listen((value) async {
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
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Create Client Profile", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 15),),
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top:10.0, left: 20.0, right: 20.0),
            child: SingleChildScrollView(
              child: Form(
                key: formGlobalKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(
                      controller: fullNameController,
                      style: TextStyle(color: Colors.black),
                      obscureText: false,
                      decoration: InputDecoration(
                          hintStyle: TextStyle(color: Colors.black),
                          labelText: 'Full name',
                          labelStyle: TextStyle(color: Colors.black)
                      ),
                      validator: (String? value) {
                        if(isNameValid(value!).length != 0){
                          return isNameValid(value!);
                        }
                        return null;
                      },
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                    ),
                    SizedBox(height: 10,),
                    TextFormField(
                      controller: mobileController,
                      style: TextStyle(color: Colors.black),
                      obscureText: false,
                      decoration: InputDecoration(
                          hintStyle: TextStyle(color: Colors.black),
                          labelText: 'Mobile number',
                          labelStyle: TextStyle(color: Colors.black)
                      ),
                      maxLength: 10,
                      keyboardType: TextInputType.number,
                      validator: (String? value) {
                        if(isNumberValid(value!).length != 0){
                          return isNumberValid(value!);
                        }
                        return null;
                      },
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                    ),
                    TextFormField(
                      controller: emailController,
                      style: TextStyle(color: Colors.black),
                      obscureText: false,
                      decoration: InputDecoration(
                          hintStyle: TextStyle(color: Colors.black),
                          labelText: 'Email Address',
                          labelStyle: TextStyle(color: Colors.black)
                      ),
                      validator: (String? value) {
                        if(!isEmailValidate(value!)){
                          return 'Invalid email address';
                        }
                        return null;
                      },
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: emailController,
                            style: TextStyle(color: Colors.black),
                            obscureText: false,
                            decoration: InputDecoration(
                                hintStyle: TextStyle(color: Colors.black),
                                labelText: 'Age',
                                labelStyle: TextStyle(color: Colors.black)
                            ),
                            validator: (String? value) {
                              if(isAgeValid(value!).length != 0){
                                return isAgeValid(value!);
                              }
                              return null;
                            },
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                          ),
                        ),
                        SizedBox(width: 10,),
                        Expanded(
                          child: Column(
                            children: [
                              SizedBox(height: 5,),
                              DropdownButton<String>(
                                value: dropdownValue,
                                icon: Icon(Icons.arrow_drop_down),
                                iconSize: 24,
                                elevation: 16,
                                style: TextStyle(color: Colors.black, fontSize: 18),
                                underline: Container(
                                  height: 2,
                                  color: Colors.white,
                                ),
                                onChanged: (String? data) {
                                  setState(() {
                                    dropdownValue = data!;
                                  });
                                },
                                items: spinnerItems.map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                              ),
                              SizedBox(height: 11,),
                              Divider(height: 3,color: Colors.grey.shade500,)
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10,),
                    GestureDetector(
                      onTap: (){
                        //Navigator.push(context, MaterialPageRoute(builder: (context) => SearchLocationScreen()));
                        _navigateToSearchLocation(context);
                      },
                      child: Container(
                          decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(5)
                          ),
                          child: const Padding(
                            padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 15.0, bottom: 15.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(Icons.search, color: Colors.grey,),
                                SizedBox(width: 10.0,),
                                Text('Search Address', style: TextStyle(color: Colors.grey, fontSize: 13,fontWeight: FontWeight.bold),),
                              ],
                            ),
                          )
                      ),
                    ),
                    SizedBox(height: 8,),
                    Visibility(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey[300],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(place, style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 13),),
                              Text(description, style: TextStyle(fontSize: 13, color: Colors.grey[800]),),
                              Divider(
                                thickness: 0.5,
                                color: Colors.grey[600],
                              ),
                              Text("Street name/number:", style: TextStyle(fontSize: 13, color: Colors.grey[800]),),
                              Text(street, style: TextStyle(fontSize: 13, color: Colors.black, fontWeight: FontWeight.bold),),
                              SizedBox(height: 4,),
                              Text("Apartment name/number:", style: TextStyle(fontSize: 13, color: Colors.grey[800]),),
                              Text("", style: TextStyle(fontSize: 13, color: Colors.grey[800]),),
                              SizedBox(height: 4,),
                            ],
                          ),
                        ),
                      ),
                      visible: isAddressAvail,
                    ),
                    SizedBox(height: 8.0,),
                    GestureDetector(
                      onTap: (){
                        requestPermission();
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.0),
                            border: Border.all()
                        ),
                        child: _image != null?
                          Expanded(child: Container(
                              height:100,
                              width: 100,
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(100)),
                              child: Image.file(File(_image!.path), fit: BoxFit.cover,))
                          ):
                        Padding(
                          padding: const EdgeInsets.all(30.0),
                          child: Icon(Icons.person_outline, color: Colors.black, size: 60,),
                        )
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(right:15.0, left:15.0, bottom: 30.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromRGBO(0, 0, 0, 1),
                    minimumSize: const Size.fromHeight(50), // NEW
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0)
                    ),
                  ),
                  onPressed: () {
                    if(formGlobalKey.currentState!.validate()){
                      formGlobalKey.currentState!.save();
                      createClient(_image!, _image!.path.split('/').last);
                    }
                  },
                  child: const Text(
                    'Update',
                    style: TextStyle(fontSize: 16,
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ),
        ],
      )
    );
  }

  Future<void> _navigateToSearchLocation(BuildContext context) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const SearchLocationScreen()),
    ) as Data;

    if (!mounted) return;

    street = result.street!;
    description = result.description!;
    place = result.place!;
    city = result.city!;
    state = result.state!;

    _navigateToBottomSheet(context, street, city, state);
  }

  Future<void> _navigateToBottomSheet(BuildContext context, String _street, String _city, String _state) async {
    final result = await showModalBottomSheet<void>(
      isScrollControlled: true,
      useSafeArea: true,
      context: context,
      builder: (BuildContext context) {
        return AddressBottomSheet(street: _street, city: _city, state: _state, zipcode: "12345",);
      },
    ) as bool;
    setState(() {
      isAddressAvail = result;
    });
  }

  // Implementing the image picker
  Future<void> _openImagePicker() async {
    final XFile? pickedImage =
    await _picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        _image = File(pickedImage.path);
      });
    }
  }

  void openSettings(){
    openAppSettings();
  }

  Future<void> requestPermission() async{
    Map<Permission, PermissionStatus> statuses = await [
      Permission.storage,
      Permission.photos,
    ].request();
    if (statuses[Permission.storage]!.isDenied) {
      // Camera permission is denied
      print("storage permission denied");
    }
    if(statuses[Permission.storage]!.isPermanentlyDenied){
      print("Permanently Denied");
      openSettings();
    }
    if(statuses[Permission.photos]!.isDenied){
      print("Permission Denied for photos ${statuses[Permission.photos]!.isGranted}");
      openSettings();
    }
    if(statuses[Permission.photos]!.isPermanentlyDenied){
      print("Permanently Denied photos");
      openSettings();
    }
    if(Platform.isAndroid){
      if(statuses[Permission.storage]!.isGranted){
        print("permission grantedssss ${statuses[Permission.storage]!.isGranted}");
        _openImagePicker();
        // openSettings();
      }
    }else{
      if(statuses[Permission.photos]!.isGranted){
        print("permission granted for photos ${statuses[Permission.photos]!.isGranted}");
        _openImagePicker();
        // openSettings();
      }
    }
  }
}

