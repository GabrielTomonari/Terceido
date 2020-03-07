import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:provider/provider.dart';
import 'package:terceido/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:terceido/screens/home/character/characterEdit.dart';
import 'package:terceido/shared/loading.dart';
import 'package:terceido/shared/constants.dart';

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
          } else {
            return Scaffold(
                          body: Container(
                child: Column(
                  
                  children: <Widget>[
                    SizedBox(height: 30),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          snapshot.data['personagem'],
                          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                      
                    SizedBox(height: 3),
                    Text(
                      snapshot.data['jogador'],
                      style: TextStyle(fontSize: 18),
                    ),
                    ],
                    ),
                    SizedBox(height: 30),
                    Padding(
                      padding: const EdgeInsets.only(left: 50),
                      child: Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Icon(
                                FontAwesome.level_up,
                                color: Colors.black,
                              ),
                              Text('Nível: ', style: biggerAttributeHeader),
                              Text(
                                snapshot.data['nivel'].toString(),
                                style: biggerAttribute,
                              ),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Icon(
                                FontAwesome.signal,
                                color: Colors.black,
                              ),
                              Text(' Experiência: ',
                                  style: biggerAttributeHeader),
                              Text(
                                (snapshot.data['nivel'] * 1000).toString(),
                                style: biggerAttribute,
                              ),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Icon(
                                FontAwesome.star,
                                color: Colors.black,
                              ),
                              Text(' Classe: ', style: biggerAttributeHeader),
                              Text(
                                snapshot.data['classe'],
                                style: biggerAttribute,
                              ),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Icon(
                                FontAwesome.star_o,
                                color: Colors.black,
                              ),
                              Text(' Classe Favorecida: ',
                                  style: biggerAttributeHeader),
                              Text(
                                snapshot.data['classeFavorecida'],
                                style: biggerAttribute,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(50, 0, 0, 0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Expanded(
                            flex: 4,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Text(
                                      'Personalidade: ',
                                      style: attributeHeader,
                                    ),
                                    Text(
                                      snapshot.data['personalidade'],
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      'Comportamentos: ',
                                      style: attributeHeader,
                                    ),
                                    Text(
                                      snapshot.data['comportamentos'],
                                    ),
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    Text(
                                      'Raça: ',
                                      style: attributeHeader,
                                    ),
                                    Text(
                                      snapshot.data['raca'],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 4,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Text(
                                      'Idade: ',
                                      style: attributeHeader,
                                    ),
                                    Text(snapshot.data['idade'].toString()),
                                    Text(' anos')
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    Text(
                                      'Peso: ',
                                      style: attributeHeader,
                                    ),
                                    Text(snapshot.data['peso'].toString()),
                                    Text('kg'),
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    Text(
                                      'Altura: ',
                                      style: attributeHeader,
                                    ),
                                    Text(snapshot.data['altura'].toString()),
                                    Text('m'),
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    Text(
                                      'Pele: ',
                                      style: attributeHeader,
                                    ),
                                    Text(snapshot.data['pele']),
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    Text(
                                      'Olhos: ',
                                      style: attributeHeader,
                                    ),
                                    Text(snapshot.data['olhos']),
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    Text(
                                      'Cabelo: ',
                                      style: attributeHeader,
                                    ),
                                    Text(snapshot.data['cabelo']),
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(50, 0, 0, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          Text(
                            'Outros: ',
                            style: attributeHeader,
                          ),
                          Text(
                            snapshot.data['outros'],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20,),
                    RaisedButton.icon(
                      color: Colors.white,
                      textColor: Colors.black54,
                      icon: Icon(FontAwesome.edit),
                      label: Text('Editar'),
                      onPressed: ()async {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => CharacterEdit(),
                                ));
                          })
                  ],
                ),
              ),
            );
          }
        });
  }
}
