import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:goutmer_flutter/fetchJson.dart';
import 'package:http/http.dart' as http;

class LocationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Postdata>>(
      future: fetchPhotos(http.Client()),
      builder: (context, snapshot) {
        if (snapshot.hasError) print(snapshot.error);

        return snapshot.hasData
            ? LocationState(postdata: snapshot.data)
            : Center(child: CircularProgressIndicator());
      },
    );
  }
}


class LocationState extends StatelessWidget {
  final List<Postdata> postdata;

  const LocationState({Key key, this.postdata}) : super(key: key);

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
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Tabbar(),
              Container(
                padding: EdgeInsets.only(left: 20.0, bottom: 10.0),
                height: MediaQuery
                    .of(context)
                    .size
                    .height - 430.0,
                child: Stack(
                  children: <Widget>[
                    ListView.builder(
                      itemCount: postdata.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return ListAxisItems(
                            postdata[index].detailRes.detailDishes[index]
                                .imageDish,
                            postdata[index].detailRes.detailDishes[index]
                                .nameDish,
                            postdata[index].detailRes.topReviewDish.starReview,
                            postdata[index].detailRes.topReviewDish.ReviewNum,
                            postdata[index].detailRes.topReviewDish.newReview
                                .nameRe,
                            postdata[index].detailRes.topReviewDish.newReview
                                .contentRe
                            ,
                            context);
                      },
                    ),

                  ],

                ),
              ),
              mapController(),
              Container(
                height: MediaQuery
                    .of(context)
                    .size
                    .height - 373.0,
                child:
                ListView.builder(
                  itemCount: postdata.length,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    return Listitems(
                        postdata[index].detailRes.detailDishes[index].nameDish,
                        postdata[index].detailRes.detailDishes[index].imageDish,
                        postdata[index].detailRes.detailDishes[index].introDish,
                        postdata[index].detailRes.detailDishes[index].priceDish
                        , context);
                  },
                ),
              ),
            ]
        ),
      ),
    );
  }
}

class mapController extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return mapControllerState();
  }
}

class mapControllerState extends State<mapController> {
  GoogleMapController mapController;
  final LatLng _center = const LatLng(21.036180, 105.848650);

  void _onMapCreated(GoogleMapController controller) {
    setState(() {
      mapController = controller;
      var options = MarkerOptions(
          position: LatLng(21.036180, 105.848650),
          infoWindowText: InfoWindowText(
              "Bún bò Cô Tám ", "Được đánh giá no1 của Hà Thành")
      );
      mapController.addMarker(options);
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: MediaQuery
          .of(context)
          .size
          .height - 600.0,
      width: MediaQuery
          .of(context)
          .size
          .width - 50.0,
      child: GoogleMap(
        onMapCreated: _onMapCreated,
        options: GoogleMapOptions(
          cameraPosition: CameraPosition(
            target: _center,
            zoom: 11.0,
          ),
        ),
      ),
    );
  }
}

class Tabbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: MediaQuery
          .of(context)
          .size
          .height - 650.0,
      color: Colors.white,
      child: Stack(
        children: <Widget>[
          GestureDetector(
            child: Container(
              padding: EdgeInsets.only(left: 10.0),
              child: Image.asset('assets/icon-arrow-left.jpeg'),
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          Align(
            alignment: Alignment.topRight,
            child: Container(
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
                      Icon(Icons.shopping_cart, color: Colors.white,),
                      SizedBox(width: 5.0,),
                      Text(' 18 ', style: TextStyle(color: Colors.white),)
                    ],
                  ),)
            ),
          )
        ],
      ),
    );
  }
}

getRatedStar(int rating, int index) {
  if (index <= rating) {
    return Icon(Icons.star, color: Colors.yellow[600], size: 20.0,);
  } else {
    return Icon(Icons.star, color: Colors.grey, size: 20.0,);
  }
}

ListAxisItems(String imageDish, String nameDish, int starReview, int ReviewNum,
    String nameRe, String contentRe, context) {
  return Row(
    children: <Widget>[
      Container(
        height: MediaQuery
            .of(context)
            .size
            .height - 400.0,
        width: MediaQuery
            .of(context)
            .size
            .width - 50.0,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            image: DecorationImage(
                image: ExactAssetImage(imageDish),
                fit: BoxFit.cover)),
        child: Container(
          padding: EdgeInsets.only(left: 40.0, right: 40.0, top: 140.0),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.white),
            child: Column(
              children: <Widget>[
                Text(nameDish, style: TextStyle(
                  fontSize: 20.0, fontWeight: FontWeight.bold,),
                  textAlign: TextAlign.center,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    getRatedStar(starReview, 1),
                    getRatedStar(starReview, 1),
                    getRatedStar(starReview, 1),
                    getRatedStar(starReview, 1),
                    getRatedStar(starReview, 1)

                  ],
                ),
                Text('Review (' + ReviewNum.toString() + ')', style: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFF76765),
                    fontStyle: FontStyle.italic,
                    decoration: TextDecoration.underline),
                  textAlign: TextAlign.center,),
                SizedBox(height: 5.0,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(nameRe, style: TextStyle(fontWeight: FontWeight.bold)),
                    Container(
                        width: MediaQuery
                            .of(context)
                            .size
                            .width - 300.0,
                        child: Text(contentRe, overflow: TextOverflow.ellipsis)
                    ),
                    Text('More', style: TextStyle(fontWeight: FontWeight.bold,
                        color: Color(0xFFF76765),
                        decoration: TextDecoration.underline),),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
      SizedBox(width: 10.0,)
    ],
  );
}

Listitems(String nameDish, String imageDish, String introDish, String priceDish,
    context) {
  return Column(
    children: <Widget>[
      Container(
        width: MediaQuery
            .of(context)
            .size
            .width,
        child: Stack(
          children: <Widget>[
            Container(
              height: MediaQuery
                  .of(context)
                  .size
                  .height - 560.0,
              width: 180.0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      bottomLeft: Radius.circular(20.0)),
                  image: DecorationImage(
                      image: ExactAssetImage(imageDish),
                      fit: BoxFit.cover)),
            ),
            Positioned(
                width: MediaQuery
                    .of(context)
                    .size
                    .width - 150.0,
                height: 150.0,
                left: 150.0,
                child: Container(
                  decoration: BoxDecoration(
                      color: Color(0xFFF9F7EB),
                      borderRadius: BorderRadius.circular(10.0)),
                  child: Column(
                    children: <Widget>[
                      Text(
                        nameDish,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18.0),
                      ),
                      SizedBox(height: 5.0),
                      Text(introDish),
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
                            priceDish,
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
                                  Icon(
                                    Icons.shopping_cart, color: Colors.white,),
                                  SizedBox(width: 2.0,),
                                  Text('  Add',
                                    style: TextStyle(color: Colors.white),),
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
                              child: Icon(Icons.add, color: Colors.white),

                            ),
                          ),
                        ],
                      ),
//                      Row(
//                        children: <Widget>[
//                          Container(
//                            padding: EdgeInsets.only(left: 10.0),
//                            child: Icon(Icons.add_location),
//                          ),
//                          Container(
//                            width: MediaQuery
//                                    .of(context)
//                                    .size
//                                    .width-270.0,
//                            child: Text('31 Đường Bạch Đằng, Phường 11, Quận 1, tp. Hồ Chí Minh',overflow: TextOverflow.ellipsis,),
//                          )
//                        ],
//                      )
                    ],
                  ),
                )),
          ],
        ),
      ),
      SizedBox(height: 5.0,)
    ],
  );
}
