
import 'package:assignment10/model/CustomButton.dart';
import 'package:flutter/material.dart';

class CustomButtonRadioList extends StatefulWidget {
  late List<String> names;
  bool horizontalScroll;
  bool roundedBorder;
  CustomButtonRadioList({Key? key,required this.names,this.horizontalScroll=false,this.roundedBorder=false}) : super(key: key);
  @override
  State<CustomButtonRadioList> createState() => _CustomButtonRadioListState(names,horizontalScroll,roundedBorder);
}

class _CustomButtonRadioListState extends State<CustomButtonRadioList> {
  late List<String> names ;
  bool horizontalScroll;
  bool roundedBorder;
  int selectedPosition=0;
  _CustomButtonRadioListState(this.names, this.horizontalScroll, this.roundedBorder);


  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        scrollDirection: horizontalScroll? Axis.horizontal: Axis.vertical,
        itemCount: names.length,
        itemBuilder: (context, index) {
          return ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(selectedPosition==index? Colors.white : Colors.pink),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: roundedBorder?BorderRadius.circular(18.0):BorderRadius.zero,
                        side: BorderSide(color: Colors.pink)
                    )
                )
            ),

            onPressed: () { setState(() {
            selectedPosition = index;
            });  },

            child: Text(names[index],style: TextStyle(color:selectedPosition==index? Colors.pink : Colors.white, ),),
          );
        });
  }
}