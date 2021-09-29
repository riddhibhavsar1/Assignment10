
import 'package:assignment10/model/CustomButton.dart';
import 'package:flutter/material.dart';

class CustomButtonList extends StatefulWidget {
   late List<String> names;
    bool horizontalScroll;
    bool roundedBorder;
   CustomButtonList({Key? key,required this.names,this.horizontalScroll=false,this.roundedBorder=false}) : super(key: key);
   @override
  State<CustomButtonList> createState() => _CustomButtonListState(names,horizontalScroll,roundedBorder);
}

class _CustomButtonListState extends State<CustomButtonList> {
  List<CustomButton> value=[] ;
  late List<String> names ;
  bool horizontalScroll;
  bool roundedBorder;
  _CustomButtonListState(this.names, this.horizontalScroll, this.roundedBorder);

  @override
  void initState() {
    names.forEach((element) {
      value.add(CustomButton(name: element, state: false));
    });
    value[0].state=true;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
       scrollDirection: horizontalScroll? Axis.horizontal: Axis.vertical,
        itemCount: value.length,
        itemBuilder: (context, index) {
          return ElevatedButton(
             style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(value[index].state? Colors.white : Colors.pink),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: roundedBorder?BorderRadius.circular(18.0):BorderRadius.zero,
                          side: BorderSide(color: Colors.pink)
                      )
                  )
              ),

            onPressed: () { setState(() {
              value[index].state =  !value[index].state;
            });  },

            child: Text(value[index].name,style: TextStyle(color:value[index].state? Colors.pink : Colors.white, ),),
          );
        });
  }
}

