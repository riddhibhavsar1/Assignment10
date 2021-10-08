import 'package:assignment10/extentions/ScreenSize.dart';
import 'package:assignment10/model/Books.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class BookDetailScreen extends StatefulWidget {
  final CourseData data;
  final int index;

  const BookDetailScreen({Key? key, required this.data, required this.index})
      : super(key: key);

  @override
  _BookDetailScreenState createState() => _BookDetailScreenState(data, index);
}

class _BookDetailScreenState extends State<BookDetailScreen> {
  final CourseData data;
  final int index;

  _BookDetailScreenState(this.data, this.index);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Book details'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Hero(
                    transitionOnUserGestures: true,
                    tag: 'bookImage${index}',
                    child: ClipPath(
                      clipper: MyClipper(),
                      child: Container(
                        color: Colors.grey.withOpacity(0.2),
                        padding: const EdgeInsets.only(top: 10.0, bottom: 50),
                        child: CarouselSlider.builder(
                          itemCount: data.images.length,
                          itemBuilder: (BuildContext context, int itemIndex,
                                  int pageViewIndex) =>
                              Container(
                            width: double.infinity,
                            //  height: 200.0,
                            alignment: Alignment.topCenter,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.vertical(
                                    bottom: Radius.elliptical(
                                        MediaQuery.of(context).size.width,
                                        50.0),
                                    top: Radius.elliptical(
                                        MediaQuery.of(context).size.width,
                                        50.0)),
                                image: DecorationImage(
                                    image: NetworkImage(
                                      data.images[itemIndex],
                                    ),
                                    fit: BoxFit.cover)),
                          ),
                          options: CarouselOptions(
                            height: context.screenHeight(h: 0.3),
                            enlargeCenterPage: true,
                            enableInfiniteScroll: false,
                          ),
                        ),
                      ),
                    )),
              ),
              Text(
                'Book Name',
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              Text('${data.title}',style: TextStyle(color: Colors.grey,fontSize: 18),),
              SizedBox(
                height: 10,
              ),
              Text(
                'Book Author',
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              Text('${data.author}',style: TextStyle(color: Colors.grey,fontSize: 18)),
              SizedBox(
                height: 10,
              ),
              Text(
                'Book Description',
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              Text(
                '${data.description} ',style: TextStyle(color: Colors.grey,fontSize: 18),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ));
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height);

    var firstControlPoint = Offset(size.width / 6, size.height - 40);
    var firstEndPoint = Offset(size.width / 2, size.height - 20);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    var secondControlPoint = Offset(size.width - size.width / 6, size.height);
    var secondEndPoint = Offset(size.width, size.height - 30);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);

    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
