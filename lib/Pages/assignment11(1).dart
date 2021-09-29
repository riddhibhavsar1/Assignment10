import 'package:flutter/material.dart';

class Assignment11_1 extends StatefulWidget {
  const Assignment11_1({Key? key}) : super(key: key);

  @override
  _Assignment11_1State createState() => _Assignment11_1State();
}

class _Assignment11_1State extends State<Assignment11_1> with TickerProviderStateMixin{
  int _selectedIndex = 0;
 late TabController _controller;
  @override
  void initState() {
    _controller =
        TabController(vsync: this, length: 4, initialIndex: _selectedIndex);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          bottom: TabBar(
            controller: _controller,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.black,
            isScrollable: true,
            indicatorColor: Colors.transparent,
              onTap: (index) => setState(() => _selectedIndex = index),
          tabs:_tabScroll())
      ),
      body: TabBarView(
      controller: _controller,
      children: [
          Container(
          alignment: Alignment.center,
          color: Colors.white,
          child: Icon(Icons.directions_car),
          ),
        Container(
          alignment: Alignment.center,
          color: Colors.white,
          child: Icon(Icons.directions_bus_rounded),
        ),
        Container(
          alignment: Alignment.center,
          color: Colors.white,
          child: Icon(Icons.electric_bike),
        ),
        Container(
          alignment: Alignment.center,
          color: Colors.white,
          child: Icon(Icons.directions_bike_sharp),
        ),

      ]

    ),
    );
  }

  List<Widget> _tabScroll() => [
    Tab(
      child: Container(
         padding: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
            color: (0 == _selectedIndex) ? Colors.orange : Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10))
        ),
        alignment: Alignment.center,

        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [Text("Car"),Icon(Icons.directions_car)],),
      ),
    ),
    Tab(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
            color: 1 == _selectedIndex ? Colors.orange : Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10))
        ),
        alignment: Alignment.center,

        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [Text("Bus"),Icon(Icons.directions_bus_rounded)],),
      ),
    ),
    Tab(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
            color: 2 == _selectedIndex ? Colors.orange : Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10))
        ),
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [Icon(Icons.motorcycle_rounded)],),
      ),
    ),
    Tab(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
            color: 3 == _selectedIndex ? Colors.orange : Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10))
        ),
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [Icon(Icons.directions_bike)],),
      ),
    ),

  ];
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
