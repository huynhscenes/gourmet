import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:localstorage/localstorage.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:flutter/material.dart';


//var data =[
//    {
//        "id":1,
//        "restaurantPhoto":"assets/resPhoto1.jpeg",
//        "restaurantName":"Nhà hàng A",
//        "voteStar":5,
//        "contentRes":"Nhà hàng được thành lập 1990. Nhà hàng phục vụ hơn 300 món ăn khác nhau. Toạ lạc ở quận sầm uất nhất Hồ Chí Minh",
//        "location":"31 Đường Bạch Đằng, Phường 11, Quận 1, tp. Hồ Chí Minh",
//        "detailRes":{
//            "locationRes":{
//                "idLocal":1,
//                "intLat":21.03618,
//                "intLng":105.84865,
//                "localTitle":"Bún bò Cô Tám",
//                "localSnippet":"Được đánh giá no1 của Hà Thành"
//            },
//            "topReviewDish":{
//                "nameDish":"Bún Bò Huế",
//                "starReview":5,
//                "ReviewNum":236,
//                "newReview":{
//                    "idRe":1,
//                    "nameRe":"Alex",
//                    "contentRe":"recommend cho mọi người đó !!"
//                }
//            },
//            "detailDishes":[
//                {
//                    "idDish":1,
//                    "imageDish":"assets/food1.jpg",
//                    "nameDish":"Bún Bò Huế",
//                    "introDish":"hương vị đậm đà gốc Huế !!",
//                    "priceDish":"50.000",
//                    "amount":0
//                },
//                {
//                    "idDish":2,
//                    "imageDish":"assets/food2.jpg",
//                    "nameDish":"Phở Bò ",
//                    "introDish":"Bò nhập khẩu từ kobe, số 1 Nhật bản !!",
//                    "priceDish":"30.000",
//                    "amount":0
//                },
//                {
//                    "idDish":3,
//                    "imageDish":"assets/food3.jpg",
//                    "nameDish":"Bún Mắm",
//                    "introDish":"Đang làm mưa làm gió ở Tp.Nha Trang !!",
//                    "priceDish":"40.000",
//                    "amount":0
//                }
//            ]
//        }
//    },
//    {
//        "id":2,
//        "restaurantPhoto":"assets/resPhoto2.jpg",
//        "restaurantName":"Nhà hàng B",
//        "voteStar":5,
//        "contentRes":"Nhà hàng được đánh giá tốt Nhất quận Gò Vấp, nhà hàng có rất nhiều đặc sản rừng",
//        "location":"25 Thống Nhất, Phường 11, Quận Gò Vấp, tp. Hồ Chí Minh",
//        "detailRes":{
//            "locationRes":{
//                "idLocal":1,
//                "intLat":21.03618,
//                "intLng":105.84865,
//                "localTitle":"Bún bò Cô Tám",
//                "localSnippet":"Được đánh giá no1 của Hà Thành"
//            },
//            "topReviewDish":{
//                "nameDish":"Bún Bò Huế",
//                "starReview":5,
//                "ReviewNum":236,
//                "newReview":{
//                    "idRe":1,
//                    "nameRe":"Alex",
//                    "contentRe":"recommend cho mọi người đó !!"
//                }
//            },
//            "detailDishes":[
//                {
//                    "idDish":1,
//                    "imageDish":"assets/food1.jpg",
//                    "nameDish":"Bún Bò Huê",
//                    "introDish":"hương vị đậm đà gốc Huế !!",
//                    "priceDish":"50.000",
//                    "amount":0
//                },
//                {
//                    "idDish":2,
//                    "imageDish":"assets/food2.jpg",
//                    "nameDish":"Phở Bò ",
//                    "introDish":"Bò nhập khẩu từ kobe, số 1 Nhật bản !!",
//                    "priceDish":"30.000",
//                    "amount":0
//                },
//                {
//                    "idDish":3,
//                    "imageDish":"assets/food3.jpg",
//                    "nameDish":"Bún Mắm",
//                    "introDish":"Đang làm mưa làm gió ở Tp.Nha Trang !!",
//                    "priceDish":"40.000",
//                    "amount":0
//                }
//            ]
//        }
//    },
//    {
//        "id":3,
//        "restaurantPhoto":"assets/resPhoto3.png",
//        "restaurantName":"Nhà hàng C",
//        "voteStar":5,
//        "contentRes":"Nhà Hàng 5 sao lớn nhất Hồ Chí Minh, toạ lạc ngay trung tâm thành phố ",
//        "location":"10 Đường Phạm Ngũ Lão, Phường 11, Quận 1, tp. Hồ Chí Minh",
//        "detailRes":{
//            "locationRes":{
//                "idLocal":1,
//                "intLat":21.03618,
//                "intLng":105.84865,
//                "localTitle":"Bún bò Cô Tám",
//                "localSnippet":"Được đánh giá no1 của Hà Thành"
//            },
//            "topReviewDish":{
//                "nameDish":"Bún Bò Huế",
//                "starReview":5,
//                "ReviewNum":236,
//                "newReview":{
//                    "idRe":1,
//                    "nameRe":"Alex",
//                    "contentRe":"recommend cho mọi người đó !!"
//                }
//            },
//            "detailDishes":[
//                {
//                    "idDish":1,
//                    "imageDish":"assets/food1.jpg",
//                    "nameDish":"Bún Bò Huê",
//                    "introDish":"hương vị đậm đà gốc Huế !!",
//                    "priceDish":"50.000",
//                    "amount":0
//                },
//                {
//                    "idDish":2,
//                    "imageDish":"assets/food2.jpg",
//                    "nameDish":"Phở Bò ",
//                    "introDish":"Bò nhập khẩu từ kobe, số 1 Nhật bản !!",
//                    "priceDish":"30.000",
//                    "amount":0
//                },
//                {
//                    "idDish":3,
//                    "imageDish":"assets/food3.jpg",
//                    "nameDish":"Bún Mắm",
//                    "introDish":"Đang làm mưa làm gió ở Tp.Nha Trang !!",
//                    "priceDish":"40.000",
//                    "amount":0
//                }
//            ]
//        }
//    }
//];
var getdata;

class Postdata {
    int id;
     String restaurantPhoto;
     String restaurantName;
     int voteStar;
     String contentRes;
     String location;
     Property detailRes;

    Postdata({this.id, this.restaurantPhoto, this.restaurantName, this.voteStar, this.contentRes, this.location,this.detailRes});

    factory Postdata.fromJson(Map<String, dynamic> json) {
        return Postdata(
            id: json['id'] as int,
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
     LocationRes locationRes;
     TopReviewDish topReviewDish;
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
    double intLat;
    double intLng;
    String localTitle;
    String localSnippet;
    LocationRes({
        this.intLat,this.intLng,this.localTitle,this.localSnippet
    });
    factory LocationRes.fromJson(Map<String, dynamic> json) {
        return LocationRes(
            intLat: json['intLat'],
            intLng: json['intLng'],
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
    int idDish;
    String imageDish;
    String nameDish;
    String introDish;
    String priceDish;
    int amount;
    Detail({this.idDish,this.imageDish,this.nameDish,this.introDish,this.priceDish,this.amount});
    factory Detail.fromJson(Map<String, dynamic> json) {
        return Detail(
            idDish: json['idDish'] as int,
            imageDish: json['imageDish'] as String,
            nameDish: json['nameDish'] as String,
            introDish: json['introDish'] as String,
            priceDish: json['priceDish'] as String,
            amount : json['amount'] as int,
        );
    }
}
class getpostdata{
    int id;
    String restaurantPhoto;
    String restaurantName;
    int voteStar;
    String contentRes;
    String location;

}
class getdetail{
    int id;
    double intLat;
    double intLng;
    String localTitle;
    String localSnippet;

    String nameDish;
    int starReview;
    int ReviewNum;

    String nameRe;
    String contentRe;

    String imageDish;
    String nameDishDe;
    String introDish;
    String priceDish;

}
class AppModel extends Model {
    var data;
    List<getpostdata> _data=[];
    List<getdetail> _datadetail=[];
    List<LocationRes> datalocal;
    List<TopReviewDish> datareview;
    List<NewReview> datanewre;
    List<Detail> datadetail;
    String cartMsg = "";
    bool success = false;
    Database _db;
    Directory tempDir;
    String tempPath;
    final LocalStorage storage = new LocalStorage('app_data');
    Future<List<Postdata>> fetchPhotos() async {
        final response =
        await http.get('https://api.myjson.com/bins/9rtpm');
        String body = utf8.decode(response.bodyBytes);
        getdata =body;
        createDB();
//        return compute(parsePhotos, body);
    }

    List<Postdata> parsePhotos(getdata) {
        final parsed = json.decode(getdata).cast<Map<String, dynamic>>();

        return parsed.map<Postdata>((json) => Postdata.fromJson(json)).toList();
    }
    AppModel() {
        Future<List<Postdata>> list =  fetchPhotos();
        // Create DB Instance & Create Table
    }

//
//    deleteDB() async {
//        String tempPath = tempDir.path + "/cart.db";
//        await deleteDatabase(tempPath);
//        if (storage.getItem("isFirst") != null) {
//            print("NOT NUKK");
//            await storage.deleteItem("isFirst");
//        }
//    }

    createDB() async {
        if( await getdata!=null){
            var dbDir = await getDatabasesPath();
            var dbPath = join(dbDir, "dbtest15.db");
            data = parsePhotos(getdata.toString());
            _db = await openDatabase(dbPath, version: 1, onCreate: createTable);
            if(_db !=null){
                this.FetchShopping();
                this.FetchDetail();
            }
            return _db;
        }
    }

    createTable(Database database, int version) async {
        this._db=database;
        try {
            var qry = "CREATE TABLE IF NOT EXISTS shopping ( "
                    "id INTEGER PRIMARY KEY,"
                    "restaurantPhoto TEXT,"
                    "restaurantName Text,"
                    "voteStar INTEGER,"
                    "contentRes TEXT,"
                    "location TEXT)";
            await this._db.execute(qry);
            qry = "CREATE TABLE IF NOT EXISTS detail ( "
                    "id INTEGER PRIMARY KEY,"
                    "intLat double,"
                    "intLng double,"
                    "localTitle TEXT,"
                    "localSnippet TEXT,"
                    "nameDish TEXT,"
                    "starReview INTEGER,"
                    "ReviewNum INTEGER,"
                    "nameRe TEXT,"
                    "contentRe TEXT,"
                    "imageDish TEXT,"
                    "nameDishDe TEXT,"
                    "introDish TEXT,"
                    "priceDish TEXT)";
            await this._db.execute(qry);

            this.InsertInDetail();
            this.InsertInShopping();
        } catch (e) {
            print('this is create table '+ e.toString());
        }
    }

    FetchShopping()async{
        try{
            // Get the records
            var list = await this._db.rawQuery('SELECT * FROM shopping');
            list.map((dd){
                getpostdata d = new getpostdata();
                d.id = dd["id"];
                d.restaurantPhoto = dd["restaurantPhoto"];
                d.restaurantName = dd["restaurantName"];
                d.voteStar = dd["voteStar"];
                d.contentRes = dd["contentRes"];
                d.location = dd["location"];
                _data.add(d);
            }).toList();
            notifyListeners();
        }catch(e){
            print('this is select ' + e.toString());
        }
    }

    InsertInShopping() async {
        this._db.transaction((tx)async{
            for(var i=0; i<data.length; i++){
                getpostdata d = new getpostdata();
                d.id = i+1;
                d.restaurantPhoto = data[i].restaurantPhoto;
                d.restaurantName = data[i].restaurantName;
                d.voteStar = data[i].voteStar;
                d.contentRes = data[i].contentRes;
                d.location = data[i].location;
                try{
                    var qry = 'INSERT INTO shopping(id,restaurantPhoto, restaurantName, voteStar,contentRes,location)'
                            'VALUES(${d.id},"${d.restaurantPhoto}","${d.restaurantName}", ${d.voteStar},"${d.contentRes}","${d.location}");';
                    var _res = await tx.execute(qry);
                }catch(e){
                    print('this is insert '+ e.toString());
                }
                _data.add(d);
                notifyListeners();
            }
        });
    }

    // Item List
    List<getpostdata> get itemListing => _data;

    FetchDetail()async{
        try{
            // Get the records
            var list = await this._db.rawQuery('SELECT * FROM detail');
            list.map((dd){
                getdetail d = new getdetail();
                d.id = dd["id"];
                d.intLat = dd["intLat"];
                d.intLng = dd["intLng"];
                d.localTitle = dd["localTitle"];
                d.localSnippet = dd["localSnippet"];
                d.nameDish = dd["nameDish"];
                d.starReview = dd["starReview"];
                d.ReviewNum = dd["ReviewNum"];
                d.nameRe = dd["nameRe"];
                d.contentRe = dd["contentRe"];
                d.imageDish = dd["imageDish"];
                d.nameDishDe = dd["nameDishDe"];
                d.introDish = dd["introDish"];
                d.priceDish = dd["priceDish"];
                _datadetail.add(d);
            }).toList();
            notifyListeners();
        }catch(e){
            print('this is select ' + e.toString());
        }
    }

    InsertInDetail() async {
        this._db.transaction((tx)async{
            for(var i=0; i<data.length; i++){
                getdetail d = new getdetail();
                d.id = i+1;
                d.intLat = data[i].detailRes.locationRes.intLat;
                d.intLng = data[i].detailRes.locationRes.intLng;
                d.localTitle = data[i].detailRes.locationRes.localTitle;
                d.localSnippet = data[i].detailRes.locationRes.localSnippet;
                d.nameDish = data[i].detailRes.topReviewDish.nameDish;
                d.starReview = data[i].detailRes.topReviewDish.starReview;
                d.ReviewNum = data[i].detailRes.topReviewDish.ReviewNum;
                d.nameRe = data[i].detailRes.topReviewDish.newReview.nameRe;
                d.contentRe = data[i].detailRes.topReviewDish.newReview.contentRe;
                d.imageDish = data[i].detailRes.detailDishes[i].imageDish;
                d.nameDishDe = data[i].detailRes.detailDishes[i].nameDish;
                d.introDish = data[i].detailRes.detailDishes[i].introDish;
                d.priceDish = data[i].detailRes.detailDishes[i].priceDish;
                try{
                    var qry = 'INSERT INTO detail(id,intLat, intLng, localTitle,localSnippet,nameDish,starReview,ReviewNum,nameRe,contentRe,imageDish,nameDishDe,introDish,priceDish)'
                            'VALUES(${d.id},"${d.intLat}","${d.intLng}", "${d.localTitle}","${d.localSnippet}","${d.nameDish}"'
                            ',"${d.starReview}","${d.ReviewNum}","${d.nameRe}","${d.contentRe}","${d.imageDish}","${d.nameDishDe}","${d.introDish}"'
                            ',"${d.priceDish}");';
                    var _res = await tx.execute(qry);
                }catch(e){
                    print('this is insert '+ e.toString());
                }
                _datadetail.add(d);
                notifyListeners();
            }
        });
    }

    // Item List
    List<getdetail> get itemDetail => _datadetail;
}