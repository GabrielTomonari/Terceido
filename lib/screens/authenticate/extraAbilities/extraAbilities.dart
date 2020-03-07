import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:terceido/models/extraAbilitiesItem.dart';
import 'package:terceido/models/user.dart';
import 'package:terceido/models/abilitiesItem.dart';

class ExtraAbilitie {
  final String name;
  final String description;
  final int value;

  ExtraAbilitie({this.name, this.description, this.value});
}

class ExtraAbilitiesList extends StatefulWidget {
  @override
  _ExtraAbilitiesListState createState() => _ExtraAbilitiesListState();
}

class _ExtraAbilitiesListState extends State<ExtraAbilitiesList> {
  
  @override
  Widget build(BuildContext context) {
    //final user = Provider.of<User>(context);

    return Scaffold(
          body: SingleChildScrollView(
                      child: StreamBuilder<QuerySnapshot>(
        stream: Firestore.instance.collection('Habilidades').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
            if (!snapshot.hasData) {
              return Text('Não há Habilidades Extras cadastradas no sistema');
            } else {
              return ListView(physics: NeverScrollableScrollPhysics(),shrinkWrap: true, children: getAbilities(snapshot));
            }
        },
      ),
          ),
    );

    
  }
  getAbilities(AsyncSnapshot<QuerySnapshot> snapshot){
    return snapshot.data.documents.map((doc) => ExtraAbilitiesItem(number: doc.data['Valor'], name: doc.data['Nome'], description: doc.data['Descrição'],)).toList();
  }
}

