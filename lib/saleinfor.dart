import 'package:flutter/material.dart';

class saleinfor extends StatefulWidget {
    @override
    _saleinforState createState() => _saleinforState();
}

class _saleinforState extends State<saleinfor> {
    @override
    Widget build(BuildContext context) {
        return Container(
            decoration: new BoxDecoration(
                image: new DecorationImage(
                        image: new ExactAssetImage('assets/saleinfo.jpeg'),
                        fit: BoxFit.fill),
            ),

        );
    }
}