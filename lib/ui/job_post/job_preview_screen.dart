import 'package:flutter/material.dart';
import 'package:peaceworc_agency/ui/components/address_botto_sheet.dart';
import 'package:peaceworc_agency/ui/components/date_time_bottom_sheet.dart';
import 'package:peaceworc_agency/ui/job_post/MandatorySceen.dart';
import 'package:peaceworc_agency/ui/job_post/client_select_dialoge.dart';
import 'package:peaceworc_agency/ui/location/search_location_screen.dart';
import 'package:peaceworc_agency/ui/job_post/data_classes.dart';
import 'package:peaceworc_agency/model/search_client/search_client_response.dart' as seachClient;
import '../components/type_of_care_bottomsheet.dart';

class JobPreviewScreen extends StatefulWidget {
  const JobPreviewScreen({super.key});

  @override
  State<JobPreviewScreen> createState() => _JobPreviewScreenState();
}

class _JobPreviewScreenState extends State<JobPreviewScreen> with jobMendatoryValidationMixin{
  late TextEditingController jobTitle;
  TextEditingController jobDesc = TextEditingController();
  TextEditingController remittance = TextEditingController();

  bool isAddressAvail = false;
  bool? isCareTypeAvailable = false;
  bool isDateTimeAvailable = false;
  bool? isClientDetailsAvailable = false;


  static String prevStreet = "";
  static String prevDescription = "";
  static String prevPlace = "";
  static String prevCity = "";
  static String prevState = "";
  static String? prevCareType = "";
  static String prevCareTypeTxt = "Select Care Type";
  static String prevShowDateRange = '';
  static String prevShowTimeRange = '';
  static String prevTitle = "";
  static String prevDesc = "";
  static String prevJobRemittanceText = "";

  //client details
  static String prevClientName = '';
  static String prevClientAge = '';
  static String prevClientGender = '';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    setState(() {
      prevTitle = MandatoryScreenState.jobTitleText;
      jobTitle = new TextEditingController(text: prevTitle);
    });
    return Flex(
      direction: Axis.vertical,
      children: [
        Align(alignment: Alignment.centerLeft,child: Text("Job Information ${prevTitle}", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 14),)),
        SizedBox(height: 8.0,),
        TextFormField(
          controller: jobTitle,
          onChanged: (content){
            prevTitle = content;
            print(prevTitle);
          },
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Job Title',
          ),
          validator: (String? value) {
            if(isTitleValidate(value!).length != 0){
              return isTitleValidate(value!);
            }
            return null;
          },
          autovalidateMode: AutovalidateMode.onUserInteraction,
        ),
        const SizedBox(
          height: 8,
        ),
        TextFormField(
          controller: jobDesc,
          onChanged: (content){
            prevDesc = content;
          },
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Job description & responsibilities',
          ),
          validator: (String? value) {
            if(isDescValidate(value!).length != 0){
              return isDescValidate(value!);
            }
            return null;
          },
          autovalidateMode: AutovalidateMode.onUserInteraction,
        ),
        const SizedBox(
          height: 8,
        ),
        GestureDetector(
          onTap: (){
            _navigateToTypeOfCare(context);
          },
          child: Container(
              decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(5)
              ),
              child: Padding(
                padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 20.0, bottom: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.add_circle_outline_outlined, color: Colors.white,),
                        SizedBox(width: 10.0,),
                        Text(prevCareTypeTxt, style: TextStyle(color: Colors.white, fontSize: 14,fontWeight: FontWeight.bold),),
                      ],
                    ),
                    Icon(Icons.arrow_forward_ios, color: Colors.white,)
                  ],
                ),
              )
          ),
        ),
        Visibility(
          visible: isCareTypeAvailable!,
          child: const SizedBox(
            height: 8,
          ),
        ),
        Visibility(
          visible: isCareTypeAvailable!,
          child: GestureDetector(
            onTap: (){
              _navigateToClientSelectDialog(context);
            },
            child: Container(
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(5)
                ),
                child: const Padding(
                  padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 20.0, bottom: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.add_circle_outline_outlined, color: Colors.white,),
                          SizedBox(width: 10.0,),
                          Text('Add Client Details', style: TextStyle(color: Colors.white, fontSize: 14,fontWeight: FontWeight.bold),),
                        ],
                      ),
                      Icon(Icons.arrow_forward_ios, color: Colors.white,)
                    ],
                  ),
                )
            ),
          ),
        ),
        Visibility(
          visible: isClientDetailsAvailable!,
          child: const SizedBox(
            height: 8,
          ),
        ),
        Visibility(
          visible: isClientDetailsAvailable!,
          child: GestureDetector(
            onTap: (){
              _navigateToClientSelectDialog(context);
            },
            child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(5)
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0, bottom: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(prevClientName, style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
                            SizedBox(width: 10,),
                            Text('age: ${prevClientAge} years', style: TextStyle(color: Colors.black),)
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(prevCareType!, style: TextStyle(color: Colors.black),),
                            SizedBox(width: 10,),
                            Text(prevClientGender, style: TextStyle(color: Colors.black),),
                          ],
                        )
                      ],
                    ),
                      InkWell(
                          onTap: (){
                            setState(() {
                              isClientDetailsAvailable = false;
                              isCareTypeAvailable = true;
                            });
                          },
                          child: Icon(Icons.cancel_outlined, color: Colors.black,)
                      )
                    ],
                  ),
                )
            ),
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        GestureDetector(
          onTap: (){
            _navigateToDateTimeBottomSheet(context);
          },
          child: Container(
              decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(5)
              ),
              child: isDateTimeAvailable?
              Padding(
                  padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0, bottom: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.date_range_outlined, color: Colors.black,),
                          SizedBox(width: 10.0,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(prevShowDateRange, style: TextStyle(color: Colors.black, fontSize: 13,fontWeight: FontWeight.bold),),
                              SizedBox(height: 5),
                              Text(prevShowTimeRange, style: TextStyle(color: Colors.black, fontSize: 13,fontWeight: FontWeight.bold),),
                            ],
                          )
                        ],
                      ),
                      Icon(Icons.arrow_forward_ios, color: Colors.black,)
                    ],
                  )
              ) : Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 20.0, bottom: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.add_circle_outline_outlined, color: Colors.black,),
                        SizedBox(width: 10.0,),
                        Text('Add Time & Date', style: TextStyle(color: Colors.black, fontSize: 14,fontWeight: FontWeight.bold),),
                      ],
                    ),
                    Icon(Icons.arrow_forward_ios, color: Colors.black,)
                  ],
                ),
              )
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        TextFormField(
          controller: remittance,
          onChanged: (content){
            prevJobRemittanceText = content;
          },
          decoration: InputDecoration(
            contentPadding: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
            hintText: 'Remittance',
            fillColor: Colors.grey.shade300,
            filled: true,
            hintStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            prefixIcon: Icon(Icons.attach_money_outlined, color: Colors.black),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade300, width: 3.0),
              borderRadius: BorderRadius.circular(5.0),
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(5.0),
            ),
          ),
          maxLines: 1,
          validator: (String? value) {
          },
          autovalidateMode: AutovalidateMode.onUserInteraction,
        ),
        const SizedBox(
          height: 8,
        ),
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
        SizedBox(height: 8),
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
                  Text(prevPlace, style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 13),),
                  Text(prevDescription, style: TextStyle(fontSize: 13, color: Colors.grey[800]),),
                  Divider(
                    thickness: 0.5,
                    color: Colors.grey[600],
                  ),
                  Text("Street name/number:", style: TextStyle(fontSize: 13, color: Colors.grey[800]),),
                  Text(prevStreet, style: TextStyle(fontSize: 13, color: Colors.black, fontWeight: FontWeight.bold),),
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
        const SizedBox(
            height: 20
        ),
      ],
    );
  }

  Future<void> _navigateToSearchLocation(BuildContext context) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const SearchLocationScreen()),
    ) as Data;

    if (!mounted) return;

    if(result != null){
      prevStreet = result.street!;
      prevDescription = result.description!;
      prevPlace = result.place!;
      prevCity = result.city!;
      prevState = result.state!;
    }
    _navigateToBottomSheet(context, prevStreet, prevCity, prevState);
  }

  Future<void> _navigateToTypeOfCare(BuildContext context) async {
    final result = await showModalBottomSheet<void>(
      isScrollControlled: true,
      useSafeArea: true,
      context: context,
      builder: (BuildContext context) {
        return TypeOfCareBottomSheet();
      },
    ) as CareTypeData?;

    if(result != null){
      setState(() {
        prevCareType = result?.careType;
        if(result?.isClientVisible != null){
          isCareTypeAvailable = result?.isClientVisible;
        }else{
          isCareTypeAvailable = false;
        }
        if(prevCareType != null){
          if(prevCareType!.isNotEmpty){
            prevCareTypeTxt = prevCareType!;
          }
        }
      });
    }
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
    if(result != null){
      setState(() {
        isAddressAvail = result;
      });
    }
  }

  Future<void> _navigateToDateTimeBottomSheet(BuildContext context) async {
    final result = await showModalBottomSheet<void>(
      isScrollControlled: true,
      useSafeArea: true,
      context: context,
      builder: (BuildContext context) {
        return DateTimeBottomSheet();
      },
    ) as DateTimeBottomSheetData?;

    if(result != null){
      setState(() {
        prevShowDateRange = "${result.startDate} To ${result.endDate}";
        prevShowTimeRange = "${result.startTime} To ${result.endTime}";
        isDateTimeAvailable = result.isDateTimeAvailAble!;
      });
    }
  }

  Future<void> _navigateToClientSelectDialog(BuildContext context) async {

    final result = await showDialog(context: context,
        builder: (BuildContext context){
          return ClientSelectDialoge();
        }
    ) as seachClient.Data?;

    if(result != null){
      setState(() {
        isClientDetailsAvailable = true;
        isCareTypeAvailable = false;
        prevClientName = result.name!;
        prevClientGender = result.gender!;
        prevClientAge = result.age!;
      });
    }
  }
}
