import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        body: Container(
          child: MyHomePage(),
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyHomePageState();
  }
}

class MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            TopContent(),
            CenterContent(),
            BottomContent(),
          ],
        ),
      ),
    );
  }
}

class TopContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        child: Row(
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 130,
              width: 130,
              decoration: new BoxDecoration(
                shape: BoxShape.circle,
                image: new DecorationImage(
                    image: new ExactAssetImage('assets/avatar.jpg'),
                    fit: BoxFit.cover),
              ),
            )
          ],
        ),
        Column(
          children: <Widget>[
            Container(
              child: Text(
                'Hư Trúc Hoà Thượng',
                style: TextStyle(fontSize: 16.0, color: Colors.blueAccent),
              ),
            ),
            Container(
              child: Text(
                'Đây là app review về các địa điểm ăn uống !!!!',
                style: TextStyle(fontSize: 12.0, color: Colors.black),
              ),
            )
          ],
        ),
      ],
    ));
  }
}

class CenterContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        child: DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(tabs: [
            Tab(
              text: 'Địa Điểm',
              icon: Icon(Icons.local_taxi),
            ),
            Tab(
              text: 'Tin Tức',
              icon: Icon(Icons.book),
            ),
            Tab(
              text: 'Khuyến Mãi',
              icon: Icon(Icons.watch),
            ),
          ]),
        ),
      ),
    ));
  }
}

class BottomContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container();
  }
}
//Column(
//children: <Widget>[
//Container(
//child: Text('Tin Tức'),
//),
//Container(
//child: Icon(Icons.book),
//)
//],
//),
//Column(
//children: <Widget>[
//Container(
//child: Text('Khuyến Mãi'),
//),
//Container(
//child: Icon(Icons.alarm),
//)
//],
//),