import 'package:assignment10/widgets/textbox.dart';
import 'package:flutter/material.dart';


class wrapText extends StatefulWidget {
  const wrapText({Key? key}) : super(key: key);

  @override
  _wrapTextState createState() => _wrapTextState();
}

class _wrapTextState extends State<wrapText> {
  final List<String> entries = <String>[
    'Dhruv Vaghela',
    'Jaydeep ',
    'Jigar Pandya',
    'Riddhi Bhavsar',
    'Ankit Jadav',
    'Jayesh Gurudayalani',
    'Charmi Goswami',
    'Charmi Goswami',
    'Charmi Goswami',
    'Charmi Goswami',

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home'),
        centerTitle: true,
      ),
      body:
      Wrap(
          spacing: 8.0, // gap between adjacent chips
          runSpacing: 14.0,
        children: [
            for(int i = 0; i < entries.length; i++)
             textbox(title: '${entries[i]}'),

          ]
      )
      ,
    );
  }
}


