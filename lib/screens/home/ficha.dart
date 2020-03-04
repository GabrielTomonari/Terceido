import 'package:flutter/material.dart';
import 'package:terceido/screens/home/character.dart';

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
              Tab(icon: Icon(Icons.directions_car, color: Colors.black,)),
              Tab(icon: Icon(Icons.directions_transit, color: Colors.black)),
              Tab(icon: Icon(Icons.directions_bike, color: Colors.black)),
              Tab(icon: Icon(Icons.directions_car, color: Colors.black)),
            ],
          ),
          body: TabBarView(children: [
                Character(),
                Icon(Icons.directions_car, color: Colors.black,),
                Icon(Icons.directions_car, color: Colors.black,),
                Icon(Icons.directions_car, color: Colors.black,)
          ]),
        ),
      )
    );
  }
}