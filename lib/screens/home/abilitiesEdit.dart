import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:terceido/models/abilitiesItem.dart';
import 'package:terceido/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:terceido/screens/home/abilitiesList.dart';
import 'package:terceido/shared/loading.dart';

import '../../shared/constants.dart';

class EditAbilities extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    int saldo;
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
              if (snapshot.data['nivel'] > 100) {
                saldo = 0;
              } else {
                saldo = snapshot.data['nivel'] -
                    (snapshot.data['acrobacia'] +
                        snapshot.data['aura'] +
                        snapshot.data['bloqueio'] +
                        snapshot.data['briga'] +
                        snapshot.data['conhecimento'] +
                        snapshot.data['concentracao'] +
                        snapshot.data['dialetos'] +
                        snapshot.data['diglade'] +
                        snapshot.data['equilibrio'] +
                        snapshot.data['escalar'] +
                        snapshot.data['esquiva'] +
                        snapshot.data['mergulhar'] +
                        snapshot.data['nadar'] +
                        snapshot.data['potencia'] +
                        snapshot.data['resistencia'] +
                        snapshot.data['saltar'] +
                        snapshot.data['sobrevivencia'] +
                        snapshot.data['velocidade'] +
                        snapshot.data['vontade']);
              }
              return SingleChildScrollView(
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 15),
                    child: Column(
                      children: <Widget>[
                        //Main Header -------------------------------------
                        Padding(
                          padding: const EdgeInsets.only(bottom: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                'Habilidades',
                                style: mainHeader,
                              ),
                              Text(saldo.toString()),
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
                              AbilitiesItem(
                                  number: snapshot.data['acrobacia'],
                                  name: 'Acrobacia'),
                              AbilitiesItem(
                                  number: snapshot.data['aura'], name: 'Aura'),
                              AbilitiesItem(
                                  number: snapshot.data['bloqueio'],
                                  name: 'Bloqueio'),
                              AbilitiesItem(
                                  number: snapshot.data['briga'],
                                  name: 'Briga'),
                              AbilitiesItem(
                                  number: snapshot.data['conhecimento'],
                                  name: 'Conhecimento'),
                              AbilitiesItem(
                                  number: snapshot.data['concentracao'],
                                  name: 'Concentração'),
                              AbilitiesItem(
                                  number: snapshot.data['dialetos'],
                                  name: 'Dialetos'),
                              AbilitiesItem(
                                  number: snapshot.data['diglade'],
                                  name: 'Díglade'),
                              AbilitiesItem(
                                  number: snapshot.data['equilibrio'],
                                  name: 'Equilíbrio'),
                              AbilitiesItem(
                                  number: snapshot.data['escalar'],
                                  name: 'Escalar'),
                              AbilitiesItem(
                                  number: snapshot.data['esquiva'],
                                  name: 'Esquiva'),
                              AbilitiesItem(
                                  number: snapshot.data['mergulhar'],
                                  name: 'Mergulhar'),
                              AbilitiesItem(
                                  number: snapshot.data['nadar'],
                                  name: 'Nadar'),
                              AbilitiesItem(
                                  number: snapshot.data['potencia'],
                                  name: 'Potência'),
                              AbilitiesItem(
                                  number: snapshot.data['resistencia'],
                                  name: 'Resistência'),
                              AbilitiesItem(
                                  number: snapshot.data['saltar'],
                                  name: 'Saltar'),
                              AbilitiesItem(
                                  number: snapshot.data['sobrevivencia'],
                                  name: 'Sobrevivência'),
                              AbilitiesItem(
                                  number: snapshot.data['velocidade'],
                                  name: 'Velocidade'),
                              AbilitiesItem(
                                  number: snapshot.data['vontade'],
                                  name: 'Vontade'),
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
                            child: Column(children: <Widget>[AbilitiesList()]))
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
