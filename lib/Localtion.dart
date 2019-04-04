import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:goutmer_flutter/cart_detail.dart';
import 'package:goutmer_flutter/fetchJson.dart';
import "package:scoped_model/scoped_model.dart";
int numcart =0;
int numcart1 =0;
int numcart2 =0;
int idDishpass =0;
List listiddish = new List();
class LocationPage extends StatefulWidget {
    @override
    State<StatefulWidget> createState() {
        // TODO: implement createState
        return LocationState();
    }
}
class Cartlist {
    final int idDishcart;
    final int amountcart;

    Cartlist({this.idDishcart, this.amountcart});
}

class LocationState extends State<LocationPage> {
    Future<List<Postdata>> postdata;

    void setnumcart(idDish,amount){
        setState(() {
            idDishpass = idDish;
            listiddish.add(idDish);
            var kCartlist;
//          for(var i= 1; i<listiddish.length;i++){
//              print('this is i : ' + i.toString());
//              print('this is listid.length : ' + listiddish.length.toString());
//              if(idDishpass ==1){
//                  int numcart1 =0;
//                  numcart1+=1;
//                  kCartlist = <Cartlist>[
//                      Cartlist(
//                              idDishcart: idDishpass,
//                              amountcart:numcart1
//                      )
//                  ];
//                  print(kCartlist[0].idDishcart);
//                  print(kCartlist[0].amountcart);
//              }
//              if(idDishpass ==2){
//                  int numcart1 =0;
//                  numcart1+=1;
//                  kCartlist = <Cartlist>[
//                      Cartlist(
//                              idDishcart: idDishpass,
//                              amountcart:numcart1
//                      )
//                  ];
//                  print(kCartlist[0].idDishcart);
//                  print(kCartlist[0].amountcart);
//              }
//              break;
//
//          }
            if(idDishpass == 1){
                kCartlist = <Cartlist>[
                    Cartlist(
                            idDishcart: idDishpass,
                            amountcart:numcart1 +=1
                    )
                ];
                print(kCartlist[0].idDishcart);
                print(kCartlist[0].amountcart);
                print('this is id ' + idDish.toString());
            }
            if(idDishpass == 2){
                kCartlist = <Cartlist>[
                    Cartlist(
                            idDishcart: idDishpass,
                            amountcart:numcart2 +=1
                    )
                ];
                print(kCartlist[0].idDishcart);
                print(kCartlist[0].amountcart);
                print('this is id ' + idDish.toString());
            }
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
                                Tabbar(context,''),
                                Container(
                                        padding: EdgeInsets.only(left: 20.0, bottom: 10.0),
                                        height: MediaQuery
                                                .of(context)
                                                .size
                                                .height - 430.0,
                                        child:ScopedModel<AppModel>(
                                            model: AppModel(),
                                            child:  ScopedModelDescendant<AppModel>(
                                                builder: (context,child,model){
                                                    return ListAxisItems(model.itemDetail);
                                                },
                                            ),
                                        )
                                ),
                                Container(
                                        child:ScopedModel<AppModel>(
                                            model: AppModel(),
                                            child:  ScopedModelDescendant<AppModel>(
                                                builder: (context,child,model){
                                                    return mapControllerState(model.itemDetail,context);
                                                },
                                            ),
                                        )
                                ),

                                Container(
                                        height: MediaQuery
                                                .of(context)
                                                .size
                                                .height - 373.0,
                                        child:ScopedModel<AppModel>(
                                            model: AppModel(),
                                            child:  ScopedModelDescendant<AppModel>(
                                                builder: (context,child,model){
                                                    return Listitems(model.itemDetail);
                                                },
                                            ),
                                        )
                                ),
                            ]
                    )



            ),
        );
    }
}


mapControllerState( List<getdetail> data,context){
    print('this is test heloooooooooo ' + data[0].intLat.toString());
                GoogleMapController mapController;
                final LatLng _center = LatLng(data[1].intLat,data[1].intLng);
                void _onMapCreated(GoogleMapController controller) {
                    mapController = controller;
                    var options = MarkerOptions(
                            position: LatLng(data[1].intLat,data[1].intLng),
                            infoWindowText: InfoWindowText(
                                    "Bún bò Cô Tám ", "Được đánh giá no1 của Hà Thành")
                    );
                    mapController.addMarker(options);
                }
                return Stack(
                    children: <Widget>[
                        new Container(
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
                        )
                    ],
                );

//            });
}

Tabbar(context, senddata){
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
                                onPressed: (){
                                    Navigator.push(
                                            context,
                                            new MaterialPageRoute(
                                                    builder: (__) => new CartDetail(numcartshop: numcart,numcart1: numcart1,numcart2:numcart2,sendidDish:idDishpass)));
                                },
                                child: Row(
                                    children: <Widget>[
                                        Icon(Icons.shopping_cart, color: Colors.white,),
                                        SizedBox(width: 5.0,),
                                        Text(numcart.toString(), style: TextStyle(color: Colors.white),)
                                    ],
                                ),)
                    ),
                )
            ],
        ),
    );
}

getRatedStar(int rating, int index) {
    if (index <= rating) {
        return Icon(Icons.star, color: Colors.yellow[600], size: 20.0,);
    } else {
        return Icon(Icons.star, color: Colors.grey, size: 20.0,);
    }
}

ListAxisItems(List<getdetail> data) {
    return ListView.builder(
            itemCount: data.length,
            itemBuilder: (BuildContext context, int index){
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
                                            image: ExactAssetImage(data[index].imageDish),
                                            fit: BoxFit.cover)),
                            child: Container(
                                padding: EdgeInsets.only(left: 40.0, right: 40.0, top: 140.0),
                                child: Container(
                                    decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(10.0),
                                            color: Colors.white),
                                    child: Column(
                                        children: <Widget>[
                                            Text(data[index].nameDish, style: TextStyle(
                                                fontSize: 20.0, fontWeight: FontWeight.bold,),
                                                textAlign: TextAlign.center,),
                                            Row(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: <Widget>[
                                                    getRatedStar(data[index].starReview, 1),
                                                    getRatedStar(data[index].starReview, 1),
                                                    getRatedStar(data[index].starReview, 1),
                                                    getRatedStar(data[index].starReview, 1),
                                                    getRatedStar(data[index].starReview, 1)

                                                ],
                                            ),
                                            Text('Review (' + data[index].ReviewNum.toString() + ')', style: TextStyle(
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
                                                    Text(data[index].nameRe, style: TextStyle(fontWeight: FontWeight.bold)),
                                                    Container(
                                                            width: MediaQuery
                                                                    .of(context)
                                                                    .size
                                                                    .width - 300.0,
                                                            child: Text(data[index].contentRe, overflow: TextOverflow.ellipsis)
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
    );

}

Listitems(List<getdetail> data) {
    return ListView.builder(
                itemCount: data.length,
                itemBuilder: (BuildContext context, int index){
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
                                                            image: ExactAssetImage(data[index].imageDish),
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
                                                                data[index].nameDishDe,
                                                                style: TextStyle(
                                                                        fontWeight: FontWeight.bold, fontSize: 18.0),
                                                            ),
                                                            SizedBox(height: 5.0),
                                                            Text(data[index].introDish),
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
                                                                        data[index].priceDish,
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
                                                                            onPressed: (){
//                                                                          setnumcart(idDish,amount);
                                                                            },
                                                                            child: Row(
                                                                                children: <Widget>[
                                                                                    Icon(
                                                                                        Icons.shopping_cart, color: Colors.white,),
                                                                                    SizedBox(width: 2.0,),
                                                                                    Text('  Add',
                                                                                        style: TextStyle(color: Colors.white),)
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
                                                        ],
                                                    ),
                                                )),
                                    ],
                                ),
                            ),
                            SizedBox(height: 5.0,)
                        ],
                    );

                });
}
