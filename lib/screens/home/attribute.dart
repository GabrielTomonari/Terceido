import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';


// The base class for the different types of items the list can contain.
abstract class ListItem {}

// A ListItem that contains data to display a heading.
class AttributeName implements ListItem {
  final String name;

  AttributeName(this.name);
}

// A ListItem that contains data to display a message.
class AttributeValue implements ListItem {
  final int value;

  AttributeValue(this.value);
}

class Attribute extends StatelessWidget {
  final List items;

  Attribute({Key key, @required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.all(50.0),
      child: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index){
            final item = items[index];
            
            if (item is AttributeName) {
             return Text(item.name, style: TextStyle(color:Colors.black),);
            }else if (item is AttributeValue) {
             return Text(item.value.toString());
            }
            return null;
          },
        ),
    );
      
  }
}
