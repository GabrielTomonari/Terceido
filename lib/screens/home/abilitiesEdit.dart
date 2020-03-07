import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'abilitiesItemEdit.dart';
import 'package:terceido/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:terceido/screens/home/abilitiesListEdit.dart';
import 'package:terceido/shared/loading.dart';

import '../../shared/constants.dart';

class EditAbilities extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    return Scaffold(
      body: StreamBuilder(
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
                                'Habilidades',
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
                                'Saldo de pontos: ${snapshot.data['saldoHabilidades'].toString()}',
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
                              AbilitiesItemEdit(
                                number: snapshot.data['acrobacia'],
                                name: 'Acrobacia',
                                fieldName: 'acrobacia',
                              ),
                              AbilitiesItemEdit(
                                number: snapshot.data['aura'],
                                name: 'Aura',
                                fieldName: 'aura',
                              ),
                              AbilitiesItemEdit(
                                  number: snapshot.data['bloqueio'],
                                  name: 'Bloqueio',
                                fieldName: 'bloqueio'),
                              AbilitiesItemEdit(
                                  number: snapshot.data['briga'],
                                  name: 'Briga',
                                fieldName: 'briga'),
                              AbilitiesItemEdit(
                                  number: snapshot.data['conhecimento'],
                                  name: 'Conhecimento',
                                fieldName: 'conhecimento'),
                              AbilitiesItemEdit(
                                  number: snapshot.data['concentracao'],
                                  name: 'Concentração',
                                fieldName: 'concentracao'),
                              AbilitiesItemEdit(
                                  number: snapshot.data['dialetos'],
                                  name: 'Dialetos',
                                fieldName: 'dialetos'),
                              AbilitiesItemEdit(
                                  number: snapshot.data['diglade'],
                                  name: 'Díglade',
                                fieldName: 'diglade'),
                              AbilitiesItemEdit(
                                  number: snapshot.data['equilibrio'],
                                  name: 'Equilíbrio',
                                fieldName: 'equilibrio'),
                              AbilitiesItemEdit(
                                  number: snapshot.data['escalar'],
                                  name: 'Escalar',
                                fieldName: 'escalar'),
                              AbilitiesItemEdit(
                                  number: snapshot.data['esquiva'],
                                  name: 'Esquiva',
                                fieldName: 'esquiva'),
                              AbilitiesItemEdit(
                                  number: snapshot.data['mergulhar'],
                                  name: 'Mergulhar',
                                fieldName: 'mergulhar'),
                              AbilitiesItemEdit(
                                  number: snapshot.data['nadar'],
                                  name: 'Nadar',
                                fieldName: 'nadar'),
                              AbilitiesItemEdit(
                                  number: snapshot.data['potencia'],
                                  name: 'Potência',
                                fieldName: 'potencia'),
                              AbilitiesItemEdit(
                                  number: snapshot.data['resistencia'],
                                  name: 'Resistência',
                                fieldName: 'resistencia'),
                              AbilitiesItemEdit(
                                  number: snapshot.data['saltar'],
                                  name: 'Saltar',
                                fieldName: 'saltar'),
                              AbilitiesItemEdit(
                                  number: snapshot.data['sobrevivencia'],
                                  name: 'Sobrevivência',
                                fieldName: 'sobrevivencia'),
                              AbilitiesItemEdit(
                                  number: snapshot.data['velocidade'],
                                  name: 'Velocidade',
                                fieldName: 'velocidade'),
                              AbilitiesItemEdit(
                                  number: snapshot.data['vontade'],
                                  name: 'Vontade',
                                fieldName: 'vontade'),
                            ],
                          ),
                        ),
                        // #~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~
                        //Secondary Header -------------------------------------
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                'Habilidades Extras',
                                style: mainHeader,
                              ),
                            ],
                          ),
                        ),
                        // #~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~
                        //Secondary Body -------------------------------------
                        Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 30, vertical: 0),
                            child:
                                Column(children: <Widget>[AbilitiesListEdit()]))
                        // #~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~
                      ],
                    ),
                  ),
                ),
              );
            }
          }),
    );
  }
}
