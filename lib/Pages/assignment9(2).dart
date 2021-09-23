import 'package:assignment10/widgets/MyAppbar.dart';
import 'package:flutter/material.dart';
import 'package:assignment10/extentions/ScreenSize.dart';
class alignStack extends StatefulWidget {
  const alignStack({Key? key}) : super(key: key);

  @override
  _alignStackState createState() => _alignStackState();
}

class _alignStackState extends State<alignStack> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: 'Assignment 9(2)',),
      body:Stack(
        children: [
          Align(
              alignment: Alignment.topRight,
              child: buildContainerWithText(context, context.screenHeight(h:0.15), context.screenWidth(w:0.7), Colors.teal,'Riddhi bhavsar')),
          Positioned(
              top: context.screenHeight(h: 0.25),
              left: context.screenWidth(w: 0.4),
                child: buildContainer(context, context.screenHeight(h:0.17), context.screenWidth(w:0.3), Colors.red)),

          Positioned(
              top: context.screenHeight(h: 0.17),
              left: context.screenWidth(w: 0.2),
              child: buildContainer(context, context.screenHeight(h:0.17), context.screenWidth(w:0.3), Colors.blue)),
          Positioned(
              top: context.screenHeight(h: 0.05),
              left: context.screenWidth(w: 0.05),
              child: buildContainer(context, context.screenHeight(h:0.17), context.screenWidth(w:0.3), Colors.amber)),

          Align(
              alignment: Alignment.centerRight,
              child: buildContainer(context, context.screenHeight(h:0.2), context.screenWidth(w:0.35), Colors.deepPurple)),

          Positioned(
              top: context.screenHeight(h: 0.50),
              right: context.screenWidth(w: 0.3),
              child: buildContainer(context, context.screenHeight(h:0.17), context.screenWidth(w:0.3), Colors.pinkAccent)),

          Positioned(
              top: context.screenHeight(h: 0.65),
              left: context.screenWidth(w: 0.05),
              child: buildContainer(context, context.screenHeight(h:0.15), context.screenWidth(w:0.3),Colors.lime)),

          Positioned(
              top: context.screenHeight(h: 0.58),
              left: context.screenWidth(w: 0.2),
              child: buildContainer(context,context.screenHeight(h:0.15), context.screenWidth(w:0.3), Colors.blueGrey)),
        ],
        clipBehavior: Clip.none,
        ),

    );
  }

  Container buildContainer(BuildContext context,double height,double width,Color color) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
    );
  }

  Container buildContainerWithText(BuildContext context,double height,double width ,Color color,String text) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text('Riddhi Bhavsar',style: TextStyle(color: Colors.black,fontSize: 20),textAlign: TextAlign.right,
        ),
      ),
    );
  }


}
