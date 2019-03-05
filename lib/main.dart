import 'package:flutter/material.dart';
import 'package:goutmer_flutter/Localtion.dart';
import 'package:goutmer_flutter/guess_you_like.dart';
import 'package:goutmer_flutter/news.dart';
import 'package:goutmer_flutter/saleinfor.dart';

void main() => runApp(MyApp());
TabController tabController;

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

class MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Container(
        decoration: new BoxDecoration(
          image: new DecorationImage(
                  image: new ExactAssetImage('assets/contentbg.jpg'),
                  fit: BoxFit.fill),
        ),
//        margin: const EdgeInsets.all(10.0),
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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(10.0),
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
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Container(
              width: 250.0,
              child: Text(
                'Hư Trúc Hoà Thượng',
                style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.blueAccent,
                    fontWeight: FontWeight.bold),textAlign: TextAlign.center,
              ),
            ),
            Container(
              width: 250.0,
              child: Text(
                'Đây là app review các địa điểm ăn uống Đây là app review các địa điểm ăn uống Đây là app review các địa điểm ăn uống !!!! ',
                style: TextStyle(fontSize: 12.0, color: Colors.black),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              alignment: Alignment.bottomRight,
              height: 40.0,
              width: 90.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.pinkAccent
              ),
              child: FlatButton(
                      onPressed: null,
                      child: Row(
                        children: <Widget>[
                          Icon(Icons.shopping_cart,color: Colors.white,),
                          SizedBox(width: 5.0,),
                          Text(' 18 ',style: TextStyle(color: Colors.white),)
                        ],
                      ),)
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
      child: TabBar(
          indicatorColor: Colors.deepOrange,
          indicatorSize: TabBarIndicatorSize.label,
          labelColor: Colors.deepOrange,
          unselectedLabelColor: Colors.grey,
          controller: tabController,
          tabs: <Widget>[
            Tab(
              child: Column(
                children: <Widget>[
                  Container(
                    child: Icon(Icons.home),
                  ),
                  Container(
                    child: Text(
                      'localtion',
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ),
            Tab(
              child: Column(
                children: <Widget>[
                  Container(
                    child: Icon(Icons.trending_up),
                  ),
                  Container(
                    child: Text(
                      'information',
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ),
            Tab(
              child: Column(
                children: <Widget>[
                  Container(
                    child: Icon(Icons.money_off),
                  ),
                  Container(
                    child: Text(
                      'Sale Off',
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ),
          ]),
    );
  }
}

class BottomContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: <Widget>[
        SizedBox(height: 15.0,),
        Container(
          width: MediaQuery
                  .of(context)
                  .size
                  .width -150.0,
          height: 5.0,
          color: Color(0xFFF9F7EB),
        ),
    Container(
    padding: EdgeInsets.only(top: 20.0),
    height: MediaQuery.of(context).size.height - 220.0,
    child: TabBarView(
    controller: tabController,
    children: <Widget>[
    new GuessYouLikePage(),
    new NewPage(),
    new saleinfor(),
    ],
    ),
    ),
      ],
    );
  }
}
