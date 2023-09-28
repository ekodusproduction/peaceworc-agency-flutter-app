import 'package:flutter/material.dart';
class TypeOfCareBottomSheet extends StatefulWidget {
  const TypeOfCareBottomSheet({super.key});

  @override
  State<TypeOfCareBottomSheet> createState() => _TypeOfCareBottomSheetState();
}

class _TypeOfCareBottomSheetState extends State<TypeOfCareBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.25,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(width: 30,),
                Text("Type of care", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18.0),),
                Icon(Icons.clear, color: Colors.black, size: 30,)
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 100,
                  height: 100,
                  color: Colors.grey,
                ),
                Container(
                  width: 100,
                  height: 100,
                  color: Colors.grey,
                ),                Container(
                  width: 100,
                  height: 100,
                  color: Colors.grey,
                ),              ],
            ),
          ],
        ),
      ),
    );
  }
}
