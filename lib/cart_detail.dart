import 'package:flutter/material.dart';
import 'package:goutmer_flutter/fetchJson.dart';

class CartDetail extends StatefulWidget {
    int numcartshop;
    int sendidDish;
    CartDetail({Key key, this.numcartshop, this.sendidDish}) : super(key: key);

  @override
  _CartDetailState createState() => _CartDetailState();
}

class _CartDetailState extends State<CartDetail> {
    Future<List<Postdata>> postdata;
    @override
    void initState() {
        super.initState();
        postdata = fetchPhotos();
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
                child: FutureBuilder <List<Postdata>>(
                    future: postdata,
                    builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Tabbar(context),
                             Container(
                               child: cartItems(
                                             snapshot.data[widget.sendidDish-1].detailRes.detailDishes[widget.sendidDish-1].idDish,
                                             snapshot.data[widget.sendidDish-1].detailRes.detailDishes[widget.sendidDish-1].nameDish,
                                             snapshot.data[widget.sendidDish-1].detailRes.detailDishes[widget.sendidDish-1].imageDish,
                                             snapshot.data[widget.sendidDish-1].detailRes.detailDishes[widget.sendidDish-1].introDish,
                                             widget.numcartshop,
                                             100000,
                                             context),
                             )
                            ],
                          );
                        }else if (snapshot.hasError) {
                          return Text("${snapshot.error}");
                        }
                        // By default, show a loading spinner
                        return CircularProgressIndicator();
                    },
                )
      )
    );

  }
}

Tabbar(context){
    return Container(
        height: MediaQuery
                .of(context)
                .size
                .height - 650.0,
        color: Colors.white,
        child: Container(
            child: GestureDetector(
                    child: Container(
                        padding: EdgeInsets.only(left: 10.0),
                        child: Image.asset('assets/icon-arrow-left.jpeg'),
                    ),
                    onTap: () {
                        Navigator.pop(context);
                    },
                ),
        ),
    );
}

cartItems(int idDish,String nameDish, String imageDish, String introDish, int numcart, int total,
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
                                                    Text('Sô lượng đặt : ',
                                                        style: TextStyle(
                                                                color: Colors.black,
                                                                fontWeight: FontWeight.bold),),
                                                    SizedBox(width: 10.0),
                                                    Text(
                                                        numcart.toString(),
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
                                                    Text('Tổng tiền : ',
                                                            style: TextStyle(
                                                                    color: Colors.deepOrange,
                                                                    fontWeight: FontWeight.bold)),
                                                    SizedBox(width: 10.0),
                                                    Text(
                                                        total.toString(),
                                                        style: TextStyle(
                                                                fontWeight: FontWeight.bold,
                                                                fontSize: 20.0,
                                                                color: Colors.deepOrange),
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
}