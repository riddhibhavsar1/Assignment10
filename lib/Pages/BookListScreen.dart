import 'dart:async';

import 'package:assignment10/Pages/BookdetailScreen.dart';
import 'package:assignment10/model/Books.dart';
import 'package:assignment10/utils/Constants.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:shimmer/shimmer.dart';

class BooklistScreen extends StatefulWidget {
  BooklistScreen({Key? key}) : super(key: key);

  @override
  _BooklistScreenState createState() => _BooklistScreenState();
}

class _BooklistScreenState extends State<BooklistScreen> {
  List<CourseData> bookList = [];
  bool isLoading = true;

  @override
  Widget build(BuildContext context) {
    if (bookList.isEmpty) {
      getBookList().then((value) => {
            setState(() {
              isLoading = false;
              bookList.addAll(value);
            })
          });
    }

    if (!isLoading) {
      return ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: bookList.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              leading: GestureDetector(
                onTap: () {

                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return BookDetailScreen(
                      data: bookList[index],
                      index: index,
                    );
                  }));
                },
                child: Hero(
                  tag: 'bookImage${index}',
                  transitionOnUserGestures: true,
                  child: ClipOval(
                    child: Image.network(
                      bookList[index].images[0],
                      height: 60,
                      width: 60,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),

              title: Text(bookList[index].title),
              subtitle: Text(bookList[index].author),
            );
          });
    } else {
      return ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: 7,
          itemBuilder: (BuildContext context, int index) {
            return buildMovieShimmer();
          });
    }
  }

  Future<List<CourseData>> getBookList() async {
    List<CourseData> bookList = [];
    final dio = Dio();
    dio.options.headers["Authorization"] = Constants.AUTH_KEY;

    try {
      var response = await dio
          .get(Constants.BASE_URL + Constants.GET_ALL_BOOKS);
      BookResponse bookResponse = BookResponse.fromJson(response.data);
      bookList.addAll(bookResponse.data[0].courseData);
      print(response);
    } catch (e) {
      print(e);
    }

    return bookList;
  }

  Widget buildMovieShimmer() => ListTile(
        leading: CustomWidget.circular(height: 60, width: 60),
        title: Align(
          alignment: Alignment.centerLeft,
          child: CustomWidget.rectangular(
            height: 16,
            width: MediaQuery.of(context).size.width * 0.3,
          ),
        ),
        subtitle: CustomWidget.rectangular(height: 14),
      );
}

class CustomWidget extends StatelessWidget {
  final double width;
  final double height;
  final ShapeBorder shapeBorder;

  const CustomWidget.rectangular(
      {this.width = double.infinity, required this.height})
      : this.shapeBorder = const RoundedRectangleBorder();

  const CustomWidget.circular(
      {this.width = double.infinity,
      required this.height,
      this.shapeBorder = const CircleBorder()});

  @override
  Widget build(BuildContext context) => Shimmer.fromColors(
        baseColor: Colors.white10.withOpacity(0.5),
        highlightColor: Colors.grey[300]!,
        child: Container(
          width: width,
          height: height,
          decoration: ShapeDecoration(
            color: Colors.grey[400]!,
            shape: shapeBorder,
          ),
        ),
      );
}
