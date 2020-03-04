import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:terceido/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:terceido/screens/home/attribute.dart';
import 'package:terceido/shared/loading.dart';

class Character extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    return StreamBuilder(
      stream: Firestore.instance
            .collection('characters')
            .document(user.uid)
            .snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Loading();
        }else{
        return Container(
          child: Column(
            children: <Widget>[
              Expanded(child: Attribute(items: [AttributeName('Agilidade'), AttributeValue(snapshot.data['agilidade'])])),
            ],
          ),
        );
        }
      }
    );
  }
}