import 'package:flutter/material.dart';

class ExtraAbilitiesItem extends StatefulWidget {

ExtraAbilitiesItem({Key key, 
  this.number = 0, 
  this.name,
  this.description}) : super (key:key);

  final int number;
  final String name;
  final String description;

  @override
  _ExtraAbilitiesItemState createState() => _ExtraAbilitiesItemState();
}

class _ExtraAbilitiesItemState extends State<ExtraAbilitiesItem> {



  @override
  Widget build(BuildContext context) {

     

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Card(
        child: Column(children: <Widget>[
          ListTile(
            title: Text(widget.name),
            subtitle: Text(widget.description),
          ),
          ButtonBar(children: <Widget>[
            FlatButton(onPressed: null, child: Text('Adicionar'))
          ],)
        ],),
      ),
    );
  }
}