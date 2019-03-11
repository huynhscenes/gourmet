import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

Future<List<Postdata>> fetchPhotos(http.Client client) async {
    final response =
    await client.get('https://api.myjson.com/bins/nt802');
    String body = utf8.decode(response.bodyBytes);
    
    return compute(parsePhotos, body);
}


List<Postdata> parsePhotos(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();

    return parsed.map<Postdata>((json) => Postdata.fromJson(json)).toList();
}

class Postdata {
    final String id;
    final String restaurantPhoto;
    final String restaurantName;
    final int voteStar;
    final String contentRes;
    final String location;
    final Property detailRes;

    Postdata({this.id, this.restaurantPhoto, this.restaurantName, this.voteStar, this.contentRes, this.location,this.detailRes});

    factory Postdata.fromJson(Map<String, dynamic> json) {
        return Postdata(
            id: json['id'] as String,
            restaurantPhoto: json['restaurantPhoto'] as String,
            restaurantName: json['restaurantName'] as String,
            voteStar: json['voteStar'] as int,
            contentRes: json['contentRes'] as String,
            location: json['location'] as String,
            detailRes : Property.fromJson(json['detailRes'])
        );
    }

}

class Property{
    final LocationRes locationRes;
    final TopReviewDish topReviewDish;
    List<Detail> detailDishes;
    Property({
        this.locationRes,
        this.topReviewDish,this.detailDishes
    });
    factory Property.fromJson(Map<String, dynamic> json) {
        var list = json['detailDishes'] as List;
        print(list.runtimeType); //returns List<dynamic>
        List<Detail> imagesList = list.map((i) => Detail.fromJson(i)).toList();
        return Property(
            locationRes: LocationRes.fromJson(json['locationRes']),
            topReviewDish: TopReviewDish.fromJson(json['topReviewDish']),
            detailDishes: imagesList
        );
    }
}
class LocationRes{
    String latLng;
    String localTitle;
    String localSnippet;
    LocationRes({
        this.latLng,this.localTitle,this.localSnippet
    });
    factory LocationRes.fromJson(Map<String, dynamic> json) {
        return LocationRes(
            latLng: json['latLng'],
            localTitle: json['localTitle'],
            localSnippet: json['localSnippet'],
        );
    }
}
class TopReviewDish{
    String nameDish;
    int starReview;
    int ReviewNum;
    NewReview newReview;
    TopReviewDish({
        this.nameDish,
        this.starReview,this.ReviewNum,this.newReview
    });
    factory TopReviewDish.fromJson(Map<String, dynamic> json) {
        return TopReviewDish(
            nameDish: json['nameDish'],
            starReview: json['starReview'],
            ReviewNum: json['ReviewNum'],
            newReview: NewReview.fromJson(json['newReview'])
        );
    }
}
class NewReview{
    String nameRe;
    String contentRe;
    NewReview({
        this.nameRe,this.contentRe
    });
    factory NewReview.fromJson(Map<String, dynamic> json) {
        return NewReview(
            nameRe: json['nameRe'],
            contentRe: json['contentRe'],
        );
    }
}

class Detail{
    String imageDish;
    String nameDish;
    String introDish;
    String priceDish;
    Detail({this.imageDish,this.nameDish,this.introDish,this.priceDish});
    factory Detail.fromJson(Map<String, dynamic> json) {
        return Detail(
            imageDish: json['imageDish'] as String,
            nameDish: json['nameDish'] as String,
            introDish: json['introDish'] as String,
            priceDish: json['priceDish'] as String
        );
    }
}
