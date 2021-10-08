
import 'package:assignment10/model/Books.dart';
import 'package:assignment10/utils/Constants.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import 'BookdetailScreen.dart';

class MyBooklistScreen extends StatefulWidget {
  const MyBooklistScreen({Key? key}) : super(key: key);

  @override
  _MyBooklistScreenState createState() => _MyBooklistScreenState();
}

class _MyBooklistScreenState extends State<MyBooklistScreen> {
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
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.count(
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            crossAxisCount: 2,
            shrinkWrap: true,
            children: List.generate(bookList.length, (index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return BookDetailScreen(
                  data: bookList[index],
                  index: index,
                );
              }));
            },
            child: Stack(
              children: [
                Hero(

                  transitionOnUserGestures: true,
                  tag: 'bookImage${index}',
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(bookList[index].images[0]),
                        fit: BoxFit.cover,
                      ),
                      borderRadius:
                      BorderRadius.all(Radius.circular(20.0),),
                    ),
                  ),
                ),

                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius:
                      BorderRadius.only(bottomLeft: Radius.circular(20.0),bottomRight: Radius.circular(20.0)),
                      color: Colors.white12.withOpacity(0.5),
                    ),
                    child: Text('${bookList[index].title}',textAlign: TextAlign.center,),
                  ),
                )
              ],
            ),
          );
        },),),
      );
    }
    else{
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.count(
          crossAxisCount: 2,
          shrinkWrap: true,
          children: List.generate(8, (index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 5.0,horizontal: 5),
              child: buildMovieShimmer()
              ,);},),),
      );
    }
  }


  Future<List<CourseData>> getBookList() async {
    List<CourseData> bookList = [];
    final dio = Dio();
    dio.options.headers["Authorization"] = Constants.AUTH_KEY;

    try {
      var response = await dio.post(Constants.BASE_URL + Constants.GET_POSTED_BOOKS);
      BookResponse bookResponse = BookResponse.fromJsonBook(response.data);

      bookList.addAll(bookResponse.myData.booksData);
      print(response);
    } catch (e) {
      print(e);
    }

    return bookList;
  }

  Widget buildMovieShimmer() => Container(child:CustomWidget.rectangular(height: 50,width: 50,), );
}


class CustomWidget extends StatelessWidget {
  final double width;
  final double height;
  final ShapeBorder shapeBorder;

  const CustomWidget.rectangular(
      {required this.width, required this.height})
      : this.shapeBorder = const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20)));

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

