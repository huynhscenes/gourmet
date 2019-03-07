import 'package:flutter/material.dart';

class LocationPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return LocationState();
  }
}

class LocationState extends State<LocationPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        decoration: new BoxDecoration(
          image: new DecorationImage(
              image: new ExactAssetImage('assets/contentbg.jpg'),
              fit: BoxFit.fill),
        ),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
//          TopContent(),
//          CenterContent(),
              Container(
                height: MediaQuery.of(context).size.height,

                child: ListView(
                  children: <Widget>[
                    Listitems('Bún Bò Huế', context),
                    SizedBox(height: 10.0,),
                    Listitems('Phở Bò', context),
                    SizedBox(height: 10.0,),
                    Listitems('Bún Mắm', context),
                    SizedBox(height: 10.0,),
                    Listitems('Bánh Xèo', context),
                    SizedBox(height: 10.0,),
                    Listitems('Bún Thịt Nướng', context),
                    SizedBox(height: 10.0,),
                    Listitems('Bún Chả', context),
                    SizedBox(height: 10.0,)

                  ],
                ),
              ),
            ]
        ),
      ),
    );
  }
}


Listitems(String namefood, context){
    return Stack(
      children: <Widget>[
        Container(
          height: 150.0,
          width: 180.0,
          decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20.0),
                          bottomLeft: Radius.circular(20.0)),
                  image: DecorationImage(
                          image: ExactAssetImage('assets/foodnew1.jpg'),
                          fit: BoxFit.cover)),
        ),
        Positioned(
                width: MediaQuery
                        .of(context)
                        .size
                        .width - 180.0,
                height: 150.0,
                left: 150.0,
                child: Container(
                  decoration: BoxDecoration(
                          color: Color(0xFFF9F7EB),
                          borderRadius: BorderRadius.circular(10.0)),
                  child: Column(
                    children: <Widget>[
                      Text(
                        namefood,
                        style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18.0),
                      ),
                      SizedBox(height: 10.0),
                      Text('hương vị đậm đà gốc Huế  !!'),
                      SizedBox(height: 10.0),
                      Container(
                        width: MediaQuery
                                .of(context)
                                .size
                                .width - 210.0,
                        height: 1.5,
                        color: Colors.red,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text('Giá : ',
                                  style: TextStyle(
                                          color: Colors.deepOrange,
                                          fontWeight: FontWeight.bold)),
                          SizedBox(width: 10.0),
                          Text(
                            '50.000 vnd',
                            style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0,
                                    color: Colors.deepOrange),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                    color: Colors.green),
                            width: 100.0,
                            height: 40.0,
                            child: FlatButton(
                              onPressed: null,
                              child: Row(
                                children: <Widget>[
                                  Icon(Icons.shopping_cart,color: Colors.white,),
                                  SizedBox(width: 2.0,),
                                  Text('  Add',style: TextStyle(color: Colors.white),),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                    color: Colors.green),
                            width: 50.0,
                            height: 40.0,
                            child: FlatButton(
                              onPressed: null,
                              child: Icon(Icons.add,color: Colors.white),

                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.only(left: 10.0),
                            child: Icon(Icons.add_location),
                          ),
                          Container(
                            width: MediaQuery
                                    .of(context)
                                    .size
                                    .width-270.0,
                            child: Text('31 Đường Bạch Đằng, Phường 11, Quận 1, tp. Hồ Chí Minh',overflow: TextOverflow.ellipsis,),
                          )
                        ],
                      )
                    ],
                  ),
                )),
      ],
    );
  }
