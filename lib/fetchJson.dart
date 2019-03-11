import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

Future<List<Postdata>> fetchPhotos(http.Client client) async {
    final response =
    await client.get('https://api.myjson.com/bins/nt802');
    String body = utf8.decode(response.bodyBytes);

    // Use the compute function to run parsePhotos in a separate isolate
    return compute(parsePhotos, body);
}

// A function that converts a response body into a List<Photo>
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

    Postdata({this.id, this.restaurantPhoto, this.restaurantName, this.voteStar, this.contentRes, this.location});

    factory Postdata.fromJson(Map<String, dynamic> json) {
        return Postdata(
            id: json['id'] as String,
            restaurantPhoto: json['restaurantPhoto'] as String,
            restaurantName: json['restaurantName'] as String,
            voteStar: json['voteStar'] as int,
            contentRes: json['contentRes'] as String,
            location: json['location'] as String,
        );
    }
}