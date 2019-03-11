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
  GoogleMapController mapController;
  final LatLng _center = const LatLng(21.036180,105.848650);
  void _onMapCreated(GoogleMapController controller){
    setState(() {
      mapController = controller;
      var options = MarkerOptions(
              position: LatLng(21.036180,105.848650),
              infoWindowText: InfoWindowText("Bún bò Cô Tám ", "Được đánh giá no1 của Hà Thành")
      );
      mapController.addMarker(options);
    });
  }

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
                padding: EdgeInsets.only(left: 20.0,bottom: 10.0),
                height: MediaQuery.of(context).size.height -430.0,
                child: Stack(
                  children: <Widget>[
                    ListView(
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        ListAxisItems(context),
                        SizedBox(width: 10.0,),
                        ListAxisItems(context),
                        SizedBox(width: 10.0,),
                        ListAxisItems(context),
                        SizedBox(width: 10.0,),
                        ListAxisItems(context),
                        SizedBox(width: 10.0,),
                        ListAxisItems(context),

                      ],
                    ),
                  ],

                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height -600.0,
                width: MediaQuery.of(context).size.width -50.0,
                child: GoogleMap(
                  onMapCreated: _onMapCreated,
                  options: GoogleMapOptions(
                    cameraPosition: CameraPosition(
                      target: _center,
                      zoom: 11.0,
                    ),
                  ),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height -373.0,
                child: ListView(
                  children: <Widget>[
                    Listitems('Bún Bò Huế', context),
                    SizedBox(height: 5.0,),
                    Listitems('Phở Bò', context),
                    SizedBox(height: 5.0,),
                    Listitems('Bún Mắm', context),
                    SizedBox(height: 5.0,),
                    Listitems('Bánh Xèo', context),
                    SizedBox(height: 5.0,),
                    Listitems('Bún Thịt Nướng', context),
                    SizedBox(height: 5.0,),
                    Listitems('Bún Chả', context),
                    SizedBox(height: 5.0,)
                  ],
                ),
              ),
            ]
        ),
      ),
    );
  }
}
class Tabbar extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: MediaQuery.of(context).size.height -650.0,
      color: Colors.white,
      child: Stack(
        children: <Widget>[
          GestureDetector(
            child: Container(
              padding: EdgeInsets.only(left: 10.0),
              child: Image.asset('assets/icon-arrow-left.jpeg'),
            ),
            onTap: (){
              Navigator.pop(context);
            },
          ),
          Align(
            alignment: Alignment.topRight,
            child:Container(
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
            ),
          )
        ],
      ),
    );
  }
}
getRatedStar(int rating, int index) {
    if (index <= rating) {
      return Icon(Icons.star, color: Colors.yellow[600],size: 20.0,);
    } else {
      return Icon(Icons.star, color: Colors.grey,size: 20.0,);
    }
}
ListAxisItems(context){
  return Container(
    height: MediaQuery.of(context).size.height -400.0,
    width: MediaQuery.of(context).size.width -50.0,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        image: DecorationImage(
            image: ExactAssetImage('assets/foodho1.jpg'),
            fit: BoxFit.cover)),
    child:Container(
      padding: EdgeInsets.only(left: 40.0,right: 40.0,top: 140.0),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: Colors.white),
        child: Column(
          children: <Widget>[
            Text('Bún Bò Huế', style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold,),textAlign: TextAlign.center,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                getRatedStar(1, 1),
                getRatedStar(1, 1),
                getRatedStar(1, 1),
                getRatedStar(1, 1),
                getRatedStar(1, 1)

              ],
            ),
            Text('Review (236)', style: TextStyle(fontSize: 15.0,fontWeight: FontWeight.bold,color: Color(0xFFF76765),fontStyle: FontStyle.italic,decoration: TextDecoration.underline),textAlign: TextAlign.center,),
            SizedBox(height: 5.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('Alex : ',style: TextStyle(fontWeight: FontWeight.bold)),
                Container(
                    width: MediaQuery.of(context).size.width - 300.0,
                    child: Text('recommend cho mọi người đó !!',overflow: TextOverflow.ellipsis)
                ),
                Text('More',style: TextStyle(fontWeight: FontWeight.bold,color: Color(0xFFF76765),decoration: TextDecoration.underline),),
              ],
            )
          ],
        ),
      ),
    ),
  );
}
Listitems(String namefood, context){
    return Stack(
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
                          image: ExactAssetImage('assets/foodnew1.jpg'),
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
                        namefood,
                        style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18.0),
                      ),
                      SizedBox(height: 5.0),
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
    );
  }
