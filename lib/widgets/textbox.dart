import 'package:flutter/material.dart';
class textbox extends StatelessWidget {

  final String title;
  const textbox({
    Key? key,required String this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.contain,
      child: Container(
        padding: EdgeInsets.fromLTRB(10.0,10.0,40.0,10.0),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black,
          ),
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Center(
          child: Text(title),
        ),
      ),
    );
  }
}