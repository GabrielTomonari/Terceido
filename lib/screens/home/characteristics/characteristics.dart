import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:terceido/models/characteristicItem.dart';
import 'package:terceido/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:terceido/screens/home/characteristics/characteristicsEdit.dart';
import 'package:terceido/shared/loading.dart';
import 'package:terceido/shared/constants.dart';
import 'package:flutter_icons/flutter_icons.dart';

class Characteristics extends StatelessWidget {
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
          } else {
            return SingleChildScrollView(
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15),
                  child: Column(
                    children: <Widget>[
                      //Main Header -------------------------------------
                      Padding(
                        padding: const EdgeInsets.only(
                            bottom: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'Características',
                              style: mainHeader,
                            ),
                          ],
                        ),
                      ),
                      // #~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~
                      //Body ----------------------------------------------
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 0),
                        child: Column(
                          children: <Widget>[
                            Padding(padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                            child: Column(children: <Widget>[
                              Row(children: <Widget>[Text('Natureza: ', style: attributeHeader,), Text(snapshot.data['bondade'].toString()), Text('% bom') ]),
                              SizedBox(height:10),
                              LinearProgressIndicator(
                                backgroundColor: Colors.red,
                                valueColor: AlwaysStoppedAnimation(Colors.green),
                                value: snapshot.data['bondade']/100,
                              )
                            ],),),
                            CharacteristicsItem(number: snapshot.data['agilidade'], name: 'Agilidade'),
                            CharacteristicsItem(number: snapshot.data['armas'], name: 'Armas'),
                            CharacteristicsItem(number: snapshot.data['forca'], name: 'Força'),
                            CharacteristicsItem(number: snapshot.data['inteligencia'], name: 'Inteligência'),
                            CharacteristicsItem(number: snapshot.data['luz'], name: 'Luz'),
                            CharacteristicsItem(number: snapshot.data['magica'], name: 'Mágica'),
                            CharacteristicsItem(number: snapshot.data['mente'], name: 'Mente'),
                            CharacteristicsItem(number: snapshot.data['vigor'], name: 'Vigor'),
                            SizedBox(
                        height: 20,
                      ),
                      RaisedButton.icon(
                          color: Colors.white,
                          textColor: Colors.black54,
                          icon: Icon(FontAwesome.edit),
                          label: Text('Editar'),
                          onPressed: ()async {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => CharacteristicsEdit(),
                                ));
                          } )
                          ],
                        ),
                      ),
                      // #~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~
                    ],
                  ),
                ),
              ),
            );
          }
        });
  }
}
