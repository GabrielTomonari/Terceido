import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:terceido/screens/home/character.dart';
import 'package:terceido/screens/home/characteristics.dart';

class Ficha extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child:
      DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: TabBar(
            tabs: <Widget>[
              Tab(icon: Icon(Entypo.man, color: Colors.black,)),
              Tab(icon: Icon(Entypo.line_graph, color: Colors.black)),
              Tab(icon: Icon(Entypo.bar_graph, color: Colors.black)),
              Tab(icon: Icon(Entypo.flash, color: Colors.black)),
            ],
          ),
          body: TabBarView(children: [
                Character(),
                Characteristics(),
                Icon(Icons.directions_car, color: Colors.black,),
                Icon(Icons.directions_car, color: Colors.black,)
          ]),
        ),
      )
    );
  }
}