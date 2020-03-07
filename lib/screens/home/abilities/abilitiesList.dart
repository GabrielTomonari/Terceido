import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:terceido/models/user.dart';
import 'package:terceido/screens/home/abilities/abilitiesItem.dart';

class Abilitie {
  final String name;
  final String description;
  final int value;

  Abilitie({this.name, this.description, this.value});
}

class AbilitiesList extends StatefulWidget {
  @override
  _AbilitiesListState createState() => _AbilitiesListState();
}

class _AbilitiesListState extends State<AbilitiesList> {
  
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('characters').document(user.uid).collection('Habilidades').snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
        if (!snapshot.hasData) {
          return Text('Você não possui habilidades extras');
        } else {
          return ListView(physics: NeverScrollableScrollPhysics(),shrinkWrap: true, children: getAbilities(snapshot));
        }
      },
    );

    
  }
  getAbilities(AsyncSnapshot<QuerySnapshot> snapshot){
    return snapshot.data.documents.map((doc) => AbilitiesItem(number: doc.data['Valor'], name: doc.data['Nome'])).toList();
  }
}

