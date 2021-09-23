import 'package:flutter/material.dart';

class MyAppBar extends AppBar {
   MyAppBar({
    Key? key,required String title,List<Widget>? actions,Widget? leading,PreferredSizeWidget? bottom
  }) : super(key: key,title: Text('$title'),actions:actions,leading:leading,bottom: bottom );




}