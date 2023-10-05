import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:peaceworc_agency/ui/job_post/data_classes.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class DateTimeBottomSheet extends StatefulWidget {
  const DateTimeBottomSheet({super.key});

  @override
  State<DateTimeBottomSheet> createState() => _DateTimeBottomSheetState();
}

class _DateTimeBottomSheetState extends State<DateTimeBottomSheet> {

  String _selectedStartDate = '';
  String _selectedEndDate = '';

  var _startTime = 'Select start time';
  var _endTime = 'Select end time';
  bool isNextToEndDateTime = false;

  void _onStartDateSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    setState(() {
      if (args.value is DateTime) {
        _selectedStartDate = DateFormat('MM-dd-yyyy').format(args.value).toString();
      }
    });
  }

  void _onEndDateSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    setState(() {
      if (args.value is DateTime) {
        _selectedEndDate = DateFormat('MM-dd-yyyy').format(args.value).toString();
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.6,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: isNextToEndDateTime ? Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(width: 30),
                    Text("Select end date and time", style: TextStyle(fontSize: 14, color: Colors.black, fontWeight: FontWeight.bold),),
                    InkWell(
                        onTap: (){
                          Navigator.of(context).pop();
                        },
                        child: Icon(Icons.clear, color: Colors.black, size: 30)
                    ),
                  ],
                ),
                SizedBox(height: 10.0),
                SfDateRangePicker(
                  onSelectionChanged: _onEndDateSelectionChanged,
                  selectionMode: DateRangePickerSelectionMode.single,
                  selectionColor: Colors.black,
                  minDate: DateTime.now(),
                ),
                SizedBox(height: 10.0),
                GestureDetector(
                  onTap: (){
                    displayEndTimePicker(context);
                  },
                  child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        border: Border.all(),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(_endTime),
                            Icon(Icons.access_time_outlined, color: Colors.black,size: 20.0)
                          ],
                        ),
                      )
                  ),
                ),
                SizedBox(height: 10.0),
                ElevatedButton(
                  onPressed: (){
                    setState(() {

                      final data = DateTimeBottomSheetData(
                          startDate: _selectedStartDate,
                          endDate: _selectedEndDate,
                          startTime: _startTime,
                          endTime: _endTime,
                          isDateTimeAvailAble: true
                      );
                      isNextToEndDateTime = false;
                      Navigator.pop(context, data);
                    });
                  },
                  child: Text("Save", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14.0),),

                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromRGBO(0, 0, 0, 1),
                    minimumSize: const Size.fromHeight(50), // NEW
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0)
                    ),
                  ),
                )
              ],
            ),
          ) :Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(width: 30),
                    Text("Select start date and time", style: TextStyle(fontSize: 14, color: Colors.black, fontWeight: FontWeight.bold),),
                    InkWell(
                      onTap: (){
                        Navigator.of(context).pop();
                      },
                        child: Icon(Icons.clear, color: Colors.black, size: 30)
                    ),
                  ],
                ),
                SizedBox(height: 10.0),
                SfDateRangePicker(
                  onSelectionChanged: _onStartDateSelectionChanged,
                  selectionMode: DateRangePickerSelectionMode.single,
                  selectionColor: Colors.black,
                  minDate: DateTime.now(),
                ),
                SizedBox(height: 10.0),
                GestureDetector(
                  onTap: (){
                    displayStartTimePicker(context);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      border: Border.all(),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(_startTime),
                          Icon(Icons.access_time_outlined, color: Colors.black,size: 20.0)
                        ],
                      ),
                    )
                  ),
                ),
                SizedBox(height: 10.0),
                ElevatedButton(
                    onPressed: (){
                      setState(() {
                        isNextToEndDateTime = true;
                      });
                    },
                    child: Text("Next", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14.0),),

                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromRGBO(0, 0, 0, 1),
                      minimumSize: const Size.fromHeight(50), // NEW
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0)
                      ),
                    ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future displayStartTimePicker(BuildContext context) async {
    var time = await showTimePicker(
        context: context,
        initialTime: TimeOfDay(hour: 12, minute: 00),
    );

    if (time != null) {
      setState(() {
        _startTime = "${time.format(context)}";
      });
    }
  }

  Future displayEndTimePicker(BuildContext context) async {
    var time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay(hour: 12, minute: 00),
    );

    if (time != null) {
      setState(() {
        _endTime = "${time.format(context)}";
      });
    }
  }
}
