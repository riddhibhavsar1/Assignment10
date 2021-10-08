
import 'package:assignment10/Pages/Assignment11(6).dart';
import 'package:assignment10/Pages/BookListScreen.dart';
import 'package:assignment10/Pages/MyBookListScreen.dart';
import 'package:assignment10/model/Books.dart';
import 'package:assignment10/utils/Constants.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class Assignment_12 extends StatefulWidget {
  const Assignment_12({Key? key}) : super(key: key);

  @override
  _Assignment_12State createState() => _Assignment_12State();
}

class _Assignment_12State extends State<Assignment_12> {


 int _selectedIndex=0;

   List<Widget> _widgetOptions1 = <Widget>[
    BooklistScreen(),
    MyBooklistScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(title: Text('Assignment 12'),),


      bottomNavigationBar:  BottomNavigationBar(
        selectedFontSize: 9,
        unselectedFontSize: 9,
         backgroundColor: Colors.grey,
        // type: BottomNavigationBarType.fixed,
         unselectedItemColor: Colors.black87,
         selectedItemColor: Colors.white,
        onTap: (index)=>{
        setState(() {
        _selectedIndex = index;
        })
        },
        items:  <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.all(3.0),
              child: Icon(Icons.home),
            ),
            label: 'Home',

          ),
          BottomNavigationBarItem(
            label: 'My Books',
            icon: Padding(
              padding:  EdgeInsets.all(3.0),
              child: Icon(Icons.menu_book_sharp),
            ),
          ),

        ],
        currentIndex: _selectedIndex,


      )
      ,
      body: _widgetOptions1.elementAt(_selectedIndex),
    );
  }



}


