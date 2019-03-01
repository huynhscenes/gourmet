import 'package:flutter/material.dart';

class NewPage extends StatefulWidget {
  @override
  _NewPageState createState() => _NewPageState();
}

class _NewPageState extends State<NewPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin : EdgeInsets.only(left: 10.0, right: 10.0),
      decoration: BoxDecoration(
          color: Color(0xFFF9F7EB),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10.0), topRight: Radius.circular(10.0))),
      child: ListView(
        children: <Widget>[
          ListViewNews(context),
            SizedBox(height: 15.0,),
          underline(context),
          ListViewNews(context),
          SizedBox(height: 15.0,),
          underline(context),
          ListViewNews(context),
          SizedBox(height: 15.0,),
          underline(context),
          ListViewNews(context),
          SizedBox(height: 15.0,),
          underline(context),
          ListViewNews(context),
          SizedBox(height: 15.0,),
          underline(context),
          ListViewNews(context),
          SizedBox(height: 15.0,),
          underline(context),

        ],
      ),
    );
  }
}
ListViewNews(context){
  return Container(

    padding: EdgeInsets.only(left: 10.0,right: 10.0),
    width: MediaQuery.of(context).size.width,
    child: Row(
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width -130.0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                height: 30.0,
                width: 80.0,
                decoration: BoxDecoration(
                        image: DecorationImage(
                                image: ExactAssetImage('assets/iconnews.png'),
                                fit: BoxFit.cover)),
              ),
              Container(
                child: Text('7 quán sushi các food blogger review bạn nên ăn thử ăn một lần ',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18.0),),
              ),
              SizedBox(height: 10.0,),
              Container(
                child: Text('5 hours ago'),
              )
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 20.0),
          height: 100.0,
          width: 90.0,
          decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  image: DecorationImage(
                          image: ExactAssetImage('assets/foodnew1.jpg'),
                          fit: BoxFit.cover)),
        ),
      ],
    ),
  );
}
underline(context){
  return Container(
    margin: EdgeInsets.only(left: 30.0,right: 30.0),
    width: 100.0,
    height: 1.5,
    color: Colors.grey,
  );
}
