import 'package:assignment10/widgets/CustomButtonRadio.dart';
import 'package:assignment10/widgets/CutomButtonList.dart';
import 'package:flutter/material.dart';

class Assignment11_2 extends StatefulWidget {
  const Assignment11_2({Key? key}) : super(key: key);

  @override
  _Assignment11_2State createState() => _Assignment11_2State();
}

class _Assignment11_2State extends State<Assignment11_2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        Text('Horizontal', style: TextStyle(fontSize: 18)),
        Row(
          children: [
            Expanded(
                flex: 1,
                child: Text(
                  'Shape Disable',
                  textAlign: TextAlign.center,
                )),
            Expanded(
                flex: 1,
                child: Text(
                  'Shape enable',
                  textAlign: TextAlign.center,
                )),
          ],
        ),
        GridView.count(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          childAspectRatio: 9 / 11,
          children: [
            CustomButtonList(
              names: ['one', 'two', 'three', 'Four'],
            ),
            CustomButtonList(
              names: ['one', 'two', 'three', 'Four'],
              roundedBorder: true,
            ),
          ],
        ),
        Text(
          'Vertical',
          style: TextStyle(fontSize: 18),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text('Shape Disable')],
        ),
        SizedBox(
          height: 30,
          child: CustomButtonList(
            names: ['one', 'two', 'three', 'Four'],
            horizontalScroll: true,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text('Shape enable')],
        ),
        SizedBox(
          height: 30,
          child: CustomButtonList(
            names: ['one', 'two', 'three', 'Four'],
            horizontalScroll: true,
            roundedBorder: true,
          ),
        ),
      ]),
    );
  }
}
