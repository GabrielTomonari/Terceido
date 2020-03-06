import 'package:flutter/material.dart';


class CharacteristicsItem extends StatefulWidget {
  
  CharacteristicsItem({Key key, @required 
  this.number = 0, 
  this.name}) : super (key:key);

  int number = 0;
  String name;


  @override
  _CharacteristicsItemState createState() => _CharacteristicsItemState();
}

class _CharacteristicsItemState extends State<CharacteristicsItem> {

    Color color = Colors.lightBlue[100];

    double v1=0, v2=0, v3=0, v4=0, v5=0, v6=0, v7=0;

  @override
  Widget build(BuildContext context) {
    

    if (widget.number == 0) {
      color = Colors.lightBlue[100];  
       v1=0; v2=0; v3=0; v4=0; v5=0; v6=0; v7=0;
    } else if (widget.number == 1) {
      color = Colors.lightBlue[200];  
       v1=1.0; v2=0; v3=0; v4=0; v5=0; v6=0; v7=0;
    }else if (widget.number == 2) {
      color = Colors.lightBlue[300];  
       v1=1.0; v2=1.0; v3=0; v4=0; v5=0; v6=0; v7=0;
    }else if (widget.number == 3) {
      color = Colors.lightBlue[400];  
       v1=1.0; v2=1.0; v3=1.0; v4=0; v5=0; v6=0; v7=0;
    }else if (widget.number == 4) {
      color = Colors.lightBlue[500];  
       v1=1.0; v2=1.0; v3=1.0; v4=1.0; v5=0; v6=0; v7=0;
    }else if (widget.number == 5) {
      color = Colors.lightBlue[600];  
       v1=1.0; v2=1.0; v3=1.0; v4=1.0; v5=1.0; v6=0; v7=0;
    }else if (widget.number == 6) {
      color = Colors.lightBlue[700];  
       v1=1.0; v2=1.0; v3=1.0; v4=1.0; v5=1.0; v6=1.0; v7=0;
    }else if (widget.number == 7) {
      color = Colors.orange[800];  
       v1=1.0; v2=1.0; v3=1.0; v4=1.0; v5=1.0; v6=1.0; v7=1.0;
    }

    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 10, 20, 10),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Column(
              children: <Widget>[
                Text(widget.number.toString(), style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
              ],
            ),
          ),
          Expanded(
            flex: 8,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
              Text(widget.name, style: TextStyle(fontWeight: FontWeight.bold)),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Flexible(
                    child: LinearProgressIndicator(
                    value: v1,
                    valueColor: AlwaysStoppedAnimation(color),
                    backgroundColor: Colors.lightBlue[50], 
                    ),
                  ),
                  Text(' '),
                  Flexible(
                    child: LinearProgressIndicator(
                    value: v2,
                    valueColor: AlwaysStoppedAnimation(color),
                    backgroundColor: Colors.lightBlue[50], 
                    ),
                  ),
                  Text(' '),
                  Flexible(
                    child: LinearProgressIndicator(
                    value: v3,
                    valueColor: AlwaysStoppedAnimation(color),
                    backgroundColor: Colors.lightBlue[50], 
                    ),
                  ),
                  Text(' '),
                  Flexible(
                    child: LinearProgressIndicator(
                    value: v4,
                    valueColor: AlwaysStoppedAnimation(color),
                    backgroundColor: Colors.lightBlue[50], 
                    ),
                  ),
                  Text(' '),
                  Flexible(
                    child: LinearProgressIndicator(
                    value: v5,
                    valueColor: AlwaysStoppedAnimation(color),
                    backgroundColor: Colors.lightBlue[50], 
                    ),
                  ),
                  Text(' '),
                  Flexible(
                    child: LinearProgressIndicator(
                    value: v6,
                    valueColor: AlwaysStoppedAnimation(color),
                    backgroundColor: Colors.lightBlue[50], 
                    ),
                  ),
                  Text(' '),
                  Flexible(
                    child: LinearProgressIndicator(
                    value: v7,
                    valueColor: AlwaysStoppedAnimation(color),
                    backgroundColor: Colors.lightBlue[50], 
                    ),
                  ),
                ],
              ),
            ],),
          )
        ],
      ),
    );
  }
}