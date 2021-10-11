import 'dart:io';
import 'dart:typed_data';

import 'package:assignment10/Pages/Assignment11(4).dart';
import 'package:assignment10/Pages/Assignment12.dart';
import 'package:assignment10/Pages/assignment11(1).dart';
import 'package:assignment10/Pages/assignment9(2).dart';
import 'package:assignment10/extentions/ScreenSize.dart';
import 'package:assignment10/main.dart';
import 'package:assignment10/widgets/MyAppbar.dart';
import 'package:dio/dio.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'Assignment11(2).dart';
import 'Assignment11(6).dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late FirebaseMessaging messaging;
  String? notificationText;
  var _scaffoldKey = GlobalKey<ScaffoldState>();
  List<int> value = [100, 200, 300, 400, 500, 600, 700, 800];

  @override
  void initState() {
    super.initState();

    messaging = FirebaseMessaging.instance;
    messaging.subscribeToTopic("messaging");
    messaging.getToken().then((value) {
      print(value);
    });
    FirebaseMessaging.onMessage.listen((RemoteMessage event) {
      print("message recieved");
      print(event.notification!.body);
      print(event.data.values);
/*    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Notification"),
            content: Text(event.notification!.body!),
            actions: [
              TextButton(
                child: Text("Ok"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });*/
      RemoteNotification? notification = event.notification;
      AndroidNotification? android = event.notification?.android;
      if (notification != null && android != null) {
        flutterLocalNotificationsPlugin.show(
            notification.hashCode,
            notification.title,
            notification.body,
            NotificationDetails(
                android: AndroidNotificationDetails(channel.id, channel.name,
                    channelDescription: channel.description,
                    color: Colors.black,
                    playSound: true,
                    icon: '@mipmap/ic_launcher')));

      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((event) {
      print('Message clicked!');
      RemoteNotification? notification = event.notification;
      AndroidNotification? android = event.notification?.android;
      if (notification != null && android != null) {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text(notification.title!),
                content: Text(notification.body!),
                actions: [
                  TextButton(
                    child: Text("Ok"),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  )
                ],
              );
            });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        key: _scaffoldKey,
        appBar: MyAppBar(
          title: 'Home',
          leading: IconButton(
            icon: Icon(Icons.assessment),
            onPressed: () => _scaffoldKey.currentState?.openDrawer(),
          ),
          actions: [
            IconButton(
                icon: Icon(Icons.send),
                onPressed: () => {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => alignStack()),
                      )
                    }),
          ],
          bottom: TabBar(
            isScrollable: true,
            indicatorColor: Colors.white,
            tabs: [
              Tab(text: 'Assignment 11-1', icon: Icon(Icons.pages_rounded)),
              Tab(text: 'Assignment 11-2', icon: Icon(Icons.sports_tennis)),
              Tab(text: 'Assignment 11-6', icon: Icon(Icons.sports_soccer)),
              Tab(text: 'Assignment 11-4', icon: Icon(Icons.sports_basketball)),
              Tab(text: 'Assignment 12', icon: Icon(Icons.sports_basketball)),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            InkWell(
              child: Center(
                child: Text('Assignment 11(1)'),
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Assignment11_1()));
              },
            ),
            InkWell(
              child: Center(child: Text('Assignment 11(2)')),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Assignment11_2()));
              },
            ),
            InkWell(
                child: Center(child: Text('Assignment 11(6)')),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Assignment11_6()));
                }),
            InkWell(
                child: Center(child: Text('Assignment 11(4)')),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Assignment11_4()));
                }),
            InkWell(
                child: Center(child: Text('Assignment 12')),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Assignment_12()));
                }),
          ],
        ),
        drawer: Container(
            color: Colors.white,
            width: context.screenWidth(w: 0.7),
            child: ListView.builder(
                itemCount: value.length,
                itemBuilder: (context, index) {
                  return Container(
                    height: context.screenHeight(h: 0.122),
                    color: Colors.red[value[index]],
                  );
                })),
      ),
    );
  }


}
