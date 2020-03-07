import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:terceido/models/characteristicItem.dart';
import 'package:terceido/models/characteristicItemEdit.dart';
import 'package:terceido/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:terceido/shared/loading.dart';
import 'package:terceido/shared/constants.dart';

class CharacteristicsEdit extends StatefulWidget {
  @override
  _CharacteristicsEditState createState() => _CharacteristicsEditState();
}

class _CharacteristicsEditState extends State<CharacteristicsEdit> {
  double _bondadeAtual;

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
            Future<void> checkCounter() async {
              if (snapshot.data['contadorCaracteristicas'] >= 10) {
                return await Firestore.instance
                    .collection('characters')
                    .document(user.uid)
                    .updateData({
                  'saldoCaracteristicas': FieldValue.increment(1),
                  'contadorCaracteristicas': FieldValue.increment(-10),
                });
              } else if (snapshot.data['contadorCaracteristicas'] >= 20) {
                return await Firestore.instance
                    .collection('characters')
                    .document(user.uid)
                    .updateData({
                  'saldoCaracteristicas': FieldValue.increment(2),
                  'contadorCaracteristicas': FieldValue.increment(-20),
                });
              } else if (snapshot.data['contadorCaracteristicas'] >= 30) {
                return await Firestore.instance
                    .collection('characters')
                    .document(user.uid)
                    .updateData({
                  'saldoCaracteristicas': FieldValue.increment(3),
                  'contadorCaracteristicas': FieldValue.increment(-30),
                });
              } else if (snapshot.data['contadorCaracteristicas'] >= 40) {
                return await Firestore.instance
                    .collection('characters')
                    .document(user.uid)
                    .updateData({
                  'saldoCaracteristicas': FieldValue.increment(4),
                  'contadorCaracteristicas': FieldValue.increment(-40),
                });
              } else if (snapshot.data['contadorCaracteristicas'] >= 50) {
                return await Firestore.instance
                    .collection('characters')
                    .document(user.uid)
                    .updateData({
                  'saldoCaracteristicas': FieldValue.increment(5),
                  'contadorCaracteristicas': FieldValue.increment(-50),
                });
              } else if (snapshot.data['contadorCaracteristicas'] >= 60) {
                return await Firestore.instance
                    .collection('characters')
                    .document(user.uid)
                    .updateData({
                  'saldoCaracteristicas': FieldValue.increment(6),
                  'contadorCaracteristicas': FieldValue.increment(-60),
                });
              } else if (snapshot.data['contadorCaracteristicas'] >= 70) {
                return await Firestore.instance
                    .collection('characters')
                    .document(user.uid)
                    .updateData({
                  'saldoCaracteristicas': FieldValue.increment(7),
                  'contadorCaracteristicas': FieldValue.increment(-70),
                });
              } else if (snapshot.data['contadorCaracteristicas'] >= 80) {
                return await Firestore.instance
                    .collection('characters')
                    .document(user.uid)
                    .updateData({
                  'saldoCaracteristicas': FieldValue.increment(8),
                  'contadorCaracteristicas': FieldValue.increment(-80),
                });
              } else if (snapshot.data['contadorCaracteristicas'] >= 90) {
                return await Firestore.instance
                    .collection('characters')
                    .document(user.uid)
                    .updateData({
                  'saldoCaracteristicas': FieldValue.increment(9),
                  'contadorCaracteristicas': FieldValue.increment(-90),
                });
              } else if (snapshot.data['contadorCaracteristicas'] >= 100) {
                return await Firestore.instance
                    .collection('characters')
                    .document(user.uid)
                    .updateData({
                  'saldoCaracteristicas': FieldValue.increment(10),
                  'contadorCaracteristicas': FieldValue.increment(-100),
                });
              }
            }

            checkCounter();

            if (_bondadeAtual == null) {
              _bondadeAtual = (snapshot.data['bondade'] / 10);
            }

            return Scaffold(
              body: SingleChildScrollView(
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 15),
                    child: Column(
                      children: <Widget>[
                        //Main Header -------------------------------------
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 30, 0, 15),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                'Características',
                                style: mainHeader,
                              ),
                              SizedBox(height: 10),
                              Text(
                                'Modo de edição',
                                style: TextStyle(
                                    fontSize: 24, fontWeight: FontWeight.w300),
                              ),
                              SizedBox(height: 10),
                              Text(
                                'Saldo de pontos: ${snapshot.data['saldoCaracteristicas'].toString()}',
                                style: biggerAttributeHeader,
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
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 10),
                                child: Column(
                                  children: <Widget>[
                                    Row(children: <Widget>[
                                      Text(
                                        'Natureza: ',
                                        style: attributeHeader,
                                      ),
                                      Text(snapshot.data['bondade'].toString()),
                                      Text('% bom')
                                    ]),
                                    SizedBox(height: 10),
                                    Slider(
                                        min: 0.0,
                                        max: 10.0,
                                        divisions: 20,
                                        activeColor: Colors.green,
                                        inactiveColor: Colors.red,
                                        value: _bondadeAtual,
                                        onChanged: (double newValue) {
                                          setState(() {
                                            _bondadeAtual = newValue;
                                          });
                                          Firestore.instance
                                              .collection('characters')
                                              .document(user.uid)
                                              .updateData({
                                            'bondade':
                                                _bondadeAtual * 10.toInt()
                                          });
                                        })
                                  ],
                                ),
                              ),
                              CharacteristicsItemEdit(
                                number: snapshot.data['agilidade'],
                                name: 'Agilidade',
                                fieldName: 'agilidade',
                              ),
                              CharacteristicsItemEdit(
                                number: snapshot.data['armas'],
                                name: 'Armas',
                                fieldName: 'armas',
                              ),
                              CharacteristicsItemEdit(
                                number: snapshot.data['forca'],
                                name: 'Força',
                                fieldName: 'forca',
                              ),
                              CharacteristicsItemEdit(
                                number: snapshot.data['inteligencia'],
                                name: 'Inteligência',
                                fieldName: 'inteligencia',
                              ),
                              CharacteristicsItemEdit(
                                number: snapshot.data['luz'],
                                name: 'Luz',
                                fieldName: 'luz',
                              ),
                              CharacteristicsItemEdit(
                                number: snapshot.data['magica'],
                                name: 'Mágica',
                                fieldName: 'magica',
                              ),
                              CharacteristicsItemEdit(
                                number: snapshot.data['mente'],
                                name: 'Mente',
                                fieldName: 'mente',
                              ),
                              CharacteristicsItemEdit(
                                number: snapshot.data['vigor'],
                                name: 'Vigor',
                                fieldName: 'vigor',
                              ),
                            ],
                          ),
                        ),
                        // #~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~
                      ],
                    ),
                  ),
                ),
              ),
            );
          }
        });
  }
}
