import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:goutmer_flutter/Localtion.dart';
import 'package:goutmer_flutter/fetchJson.dart';
import 'package:http/http.dart' as http;

class GuessYouLikePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _GuessYouLikePageState();
  }
}

class _GuessYouLikePageState extends State<GuessYouLikePage> {
    Future<List<Postdata>> postdata;
    @override
    void initState() {
        super.initState();
        postdata = fetchPhotos();
    }


    @override
  Widget build(BuildContext context) {
      return FutureBuilder <List<Postdata>>(
          future: postdata,
          builder: (context, snapshot) {
              if (snapshot.hasData) {
                  return ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (context, index) {
                          return getFoodItem(
                                  snapshot.data[index].restaurantName,
                                  snapshot.data[index].restaurantPhoto,
                                  snapshot.data[index].contentRes,
                                  snapshot.data[index].location,
                                  snapshot.data[index].voteStar, context
                          );
                      },
                  );
              } else if (snapshot.hasError) {
                  return Text("${snapshot.error}");
              }

              // By default, show a loading spinner
              return CircularProgressIndicator();
          },
      );
  }
}

  getFoodItem(String dishName, String imgPath, String description,String localitem, int rating,context) {
    return Padding(
        padding: EdgeInsets.only(left: 15.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 100.0,
              width: 100.0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50.0),
                  image: DecorationImage(
                      image: AssetImage(imgPath), fit: BoxFit.cover)),
              child: GestureDetector(onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) {
                  return LocationPage();
                }));
              }),
            ),
            SizedBox(width: 10.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                    width: MediaQuery.of(context).size.width - 125.0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          dishName,
                          style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF950D0D)),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 5.0),
                          height: 40.0,
                          width: 50.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20.0),
                                bottomLeft: Radius.circular(20.0)),
                            color: Color(0xFFF76765),
                          ),
                          child: Center(
                            child: Icon(
                              Icons.favorite_border,
                              color: Colors.white,
                            ),
                          ),
                        )
                      ],
                    )),
                Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    getRatedStar(rating, 1),
                    getRatedStar(rating, 2),
                    getRatedStar(rating, 3),
                    getRatedStar(rating, 4),
                    getRatedStar(rating, 5),
                    SizedBox(width: 7.0),
                    Text(
                      rating.toString(),
                      style:
                          TextStyle(color: Colors.yellow[800], fontSize: 17.0),
                    )
                  ],
                ),
                SizedBox(height: 10.0),
                Container(
                  width: MediaQuery.of(context).size.width - 130.0,
                  child: Text(
                    description,
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(height: 10.0),
                Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(left: 10.0),
                      child: Icon(Icons.add_location,color: Color(0xFF950D0D),),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width - 200.0,
                      child: Text(
                        localitem,
                        overflow: TextOverflow.ellipsis,
                      ),
                    )
                  ],
                )
              ],
            ),
          ],
        ));
  }

  getRatedStar(int rating, int index) {
    if (index <= rating) {
      return Icon(Icons.star, color: Colors.yellow[600]);
    } else {
      return Icon(Icons.star, color: Colors.grey);
    }
  }

