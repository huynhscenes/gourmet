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


var data =[
    {
        "id":1,
        "restaurantPhoto":"assets/resPhoto1.jpeg",
        "restaurantName":"Nhà hàng A",
        "voteStar":5,
        "contentRes":"Nhà hàng được thành lập 1990. Nhà hàng phục vụ hơn 300 món ăn khác nhau. Toạ lạc ở quận sầm uất nhất Hồ Chí Minh",
        "location":"31 Đường Bạch Đằng, Phường 11, Quận 1, tp. Hồ Chí Minh",
        "detailRes":{
            "locationRes":{
                "idLocal":1,
                "intLat":21.03618,
                "intLng":105.84865,
                "localTitle":"Bún bò Cô Tám",
                "localSnippet":"Được đánh giá no1 của Hà Thành"
            },
            "topReviewDish":{
                "nameDish":"Bún Bò Huế",
                "starReview":5,
                "ReviewNum":236,
                "newReview":{
                    "idRe":1,
                    "nameRe":"Alex",
                    "contentRe":"recommend cho mọi người đó !!"
                }
            },
            "detailDishes":[
                {
                    "idDish":1,
                    "imageDish":"assets/food1.jpg",
                    "nameDish":"Bún Bò Huế",
                    "introDish":"hương vị đậm đà gốc Huế !!",
                    "priceDish":"50.000",
                    "amount":0
                },
                {
                    "idDish":2,
                    "imageDish":"assets/food2.jpg",
                    "nameDish":"Phở Bò ",
                    "introDish":"Bò nhập khẩu từ kobe, số 1 Nhật bản !!",
                    "priceDish":"30.000",
                    "amount":0
                },
                {
                    "idDish":3,
                    "imageDish":"assets/food3.jpg",
                    "nameDish":"Bún Mắm",
                    "introDish":"Đang làm mưa làm gió ở Tp.Nha Trang !!",
                    "priceDish":"40.000",
                    "amount":0
                }
            ]
        }
    },
    {
        "id":2,
        "restaurantPhoto":"assets/resPhoto2.jpg",
        "restaurantName":"Nhà hàng B",
        "voteStar":5,
        "contentRes":"Nhà hàng được đánh giá tốt Nhất quận Gò Vấp, nhà hàng có rất nhiều đặc sản rừng",
        "location":"25 Thống Nhất, Phường 11, Quận Gò Vấp, tp. Hồ Chí Minh",
        "detailRes":{
            "locationRes":{
                "idLocal":1,
                "intLat":21.03618,
                "intLng":105.84865,
                "localTitle":"Bún bò Cô Tám",
                "localSnippet":"Được đánh giá no1 của Hà Thành"
            },
            "topReviewDish":{
                "nameDish":"Bún Bò Huế",
                "starReview":5,
                "ReviewNum":236,
                "newReview":{
                    "idRe":1,
                    "nameRe":"Alex",
                    "contentRe":"recommend cho mọi người đó !!"
                }
            },
            "detailDishes":[
                {
                    "idDish":1,
                    "imageDish":"assets/food1.jpg",
                    "nameDish":"Bún Bò Huê",
                    "introDish":"hương vị đậm đà gốc Huế !!",
                    "priceDish":"50.000",
                    "amount":0
                },
                {
                    "idDish":2,
                    "imageDish":"assets/food2.jpg",
                    "nameDish":"Phở Bò ",
                    "introDish":"Bò nhập khẩu từ kobe, số 1 Nhật bản !!",
                    "priceDish":"30.000",
                    "amount":0
                },
                {
                    "idDish":3,
                    "imageDish":"assets/food3.jpg",
                    "nameDish":"Bún Mắm",
                    "introDish":"Đang làm mưa làm gió ở Tp.Nha Trang !!",
                    "priceDish":"40.000",
                    "amount":0
                }
            ]
        }
    },
    {
        "id":3,
        "restaurantPhoto":"assets/resPhoto3.png",
        "restaurantName":"Nhà hàng C",
        "voteStar":5,
        "contentRes":"Nhà Hàng 5 sao lớn nhất Hồ Chí Minh, toạ lạc ngay trung tâm thành phố ",
        "location":"10 Đường Phạm Ngũ Lão, Phường 11, Quận 1, tp. Hồ Chí Minh",
        "detailRes":{
            "locationRes":{
                "idLocal":1,
                "intLat":21.03618,
                "intLng":105.84865,
                "localTitle":"Bún bò Cô Tám",
                "localSnippet":"Được đánh giá no1 của Hà Thành"
            },
            "topReviewDish":{
                "nameDish":"Bún Bò Huế",
                "starReview":5,
                "ReviewNum":236,
                "newReview":{
                    "idRe":1,
                    "nameRe":"Alex",
                    "contentRe":"recommend cho mọi người đó !!"
                }
            },
            "detailDishes":[
                {
                    "idDish":1,
                    "imageDish":"assets/food1.jpg",
                    "nameDish":"Bún Bò Huê",
                    "introDish":"hương vị đậm đà gốc Huế !!",
                    "priceDish":"50.000",
                    "amount":0
                },
                {
                    "idDish":2,
                    "imageDish":"assets/food2.jpg",
                    "nameDish":"Phở Bò ",
                    "introDish":"Bò nhập khẩu từ kobe, số 1 Nhật bản !!",
                    "priceDish":"30.000",
                    "amount":0
                },
                {
                    "idDish":3,
                    "imageDish":"assets/food3.jpg",
                    "nameDish":"Bún Mắm",
                    "introDish":"Đang làm mưa làm gió ở Tp.Nha Trang !!",
                    "priceDish":"40.000",
                    "amount":0
                }
            ]
        }
    }
];
//Future<List<Postdata>> fetchPhotos() async {
//    final response =
//    await http.get('https://api.myjson.com/bins/9rtpm');
//    String body = utf8.decode(response.bodyBytes);
//
//    return compute(parsePhotos, body);
//}
//
//
//List<Postdata> parsePhotos(String responseBody) {
//    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
//
//    return parsed.map<Postdata>((json) => Postdata.fromJson(json)).toList();
//}

class Postdata {
    int id;
     String restaurantPhoto;
     String restaurantName;
     int voteStar;
     String contentRes;
     String location;
     Property detailRes;

//    Postdata({this.id, this.restaurantPhoto, this.restaurantName, this.voteStar, this.contentRes, this.location,this.detailRes});
//
//    factory Postdata.fromJson(Map<String, dynamic> json) {
//        return Postdata(
//            id: json['id'] as int,
//            restaurantPhoto: json['restaurantPhoto'] as String,
//            restaurantName: json['restaurantName'] as String,
//            voteStar: json['voteStar'] as int,
//            contentRes: json['contentRes'] as String,
//            location: json['location'] as String,
//            detailRes : Property.fromJson(json['detailRes'])
//        );
//    }

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
class AppModel extends Model {
    List<Postdata> _data = [];
    String cartMsg = "";
    bool success = false;
    Database _db;
    Directory tempDir;
    String tempPath;
    final LocalStorage storage = new LocalStorage('app_data');

    AppModel() {
        // Create DB Instance & Create Table
        createDB();
    }

    deleteDB() async {
        String tempPath = tempDir.path + "/cart.db";
        await deleteDatabase(tempPath);
        if (storage.getItem("isFirst") != null) {
            print("NOT NUKK");
            await storage.deleteItem("isFirst");
        }
    }

    createDB() async {
        this.tempDir = await getTemporaryDirectory();
        this.tempPath = tempDir.path + "/cart.db";
        await this.deleteDB();

        var database = await openDatabase(this.tempPath,
                version: 1,
                onOpen: (Database db) {
                    this._db = db;
                    print("OPEN DBV");
                    this.createTable();
                },
                onCreate: (Database db, int version) async {
                    this._db = db;
                    print("DB Crated");
                }
        );
    }

    createTable() async {
        try {
            var qry = "CREATE TABLE IF NOT EXISTS shopping ( "
                    "id INTEGER PRIMARY KEY,"
                    "restaurantPhoto TEXT,"
                    "restaurantName Text,"
                    "voteStar INTEGER,"
                    "contentRes TEXT,"
                    "location TEXT)";
            await this._db.execute(qry);
            qry = "CREATE TABLE IF NOT EXISTS location ( "
                    "id INTEGER PRIMARY KEY,"
                    "intLat INTEGER,"
                    "intLng INTEGER,"
                    "localTitle Text,"
                    "localSnippet Text)";
            await this._db.execute(qry);
            qry = "CREATE TABLE IF NOT EXISTS detail_list ( "
                    "idDish INTEGER PRIMARY KEY,"
                    "imageDish TEXT,"
                    "nameDish Text,"
                    "introDish INTEGER,"
                    "priceDish TEXT)";
            await this._db.execute(qry);
            qry = "CREATE TABLE IF NOT EXISTS cart_list ( "
                    "idDish INTEGER PRIMARY KEY,"
                    "imageDish TEXT,"
                    "nameDish Text,"
                    "introDish TEXT,"
                    "total TEXT,"
                    "quality int)";
            await this._db.execute(qry);

            var _flag = storage.getItem("isFirst");
            print(_flag);
            if (_flag == "true") {
                this.FetchShopping();
            } else {
                this.InsertInShopping();
            }
        } catch (e) {
            print('this is create table '+ e.toString());
        }
    }

    FetchShopping()async{
        try{
            // Get the records
            List<Map> list = await this._db.rawQuery('SELECT * FROM shopping');
            list.map((dd){
                Postdata d = new Postdata();
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
                Postdata d = new Postdata();
                d.id = i+1;
                d.restaurantPhoto = data[i]["restaurantPhoto"];
                d.restaurantName = data[i]["restaurantName"];
                d.voteStar = data[i]["voteStar"];
                d.contentRes = data[i]["contentRes"];
                d.location = data[i]["location"];
                try{
                    var qry = 'INSERT INTO shopping(restaurantPhoto, restaurantName, voteStar,contentRes,location) VALUES("${d.restaurantPhoto}","${d.restaurantName}", "${d.voteStar}","${d.contentRes}","${d.location}")';
                    var _res = await tx.execute(qry);
                }catch(e){
                    print('this is insert '+ e.toString());
                }
                _data.add(d);
                notifyListeners();
            }
            storage.setItem("isFirst", "true");
        });
    }

    // Item List
    List<Postdata> get itemListing => _data;
}
