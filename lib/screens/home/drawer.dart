import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:terceido/screens/home/drawerEdit.dart';
import 'package:terceido/screens/home/reauthenticade.dart';
import 'package:terceido/services/auth.dart';
import 'package:terceido/models/user.dart';
import 'package:terceido/shared/loading.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:firebase_auth/firebase_auth.dart';


class HomeDrawer extends StatefulWidget {
  @override
  _HomeDrawerState createState() => _HomeDrawerState();
}

class _HomeDrawerState extends State<HomeDrawer> {
  final AuthService _auth = AuthService();
  var now = DateTime.now();

  @override
  Widget build(BuildContext context) {
    //Already fresh data alert
    Future<void> _alreadyFresh() async {
      return showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Dados já atualizados'),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text('A data da Última Sessão já está atualizada'),
                ],
              ),
            ),
            actions: <Widget>[
              FlatButton(
                color: Colors.blue,
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }

    final user = Provider.of<User>(context);

    //Update Sessions
    Future<void> updateSessions() async {
      return await Firestore.instance
          .collection('characters')
          .document(user.uid)
          .updateData({
        'sessoes': FieldValue.increment(1),
        'ultimaSessao': DateFormat("dd-MM-yyyy").format(now),
      });
    }

    //Refresh Alert
    Future<void> _refreshData() async {
      return showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Atualizar sessões?'),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text(
                      'Isso atualizará a Última Sessão para a data atual e adicionará mais uma sessão à contagem total.'),
                  SizedBox(height: 20),
                  Text('Deseja continuar?'),
                ],
              ),
            ),
            actions: <Widget>[
              FlatButton(
                child: Text('Cancelar'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              FlatButton(
                color: Colors.blue,
                child: Text('Sim'),
                onPressed: () {
                  updateSessions();
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }

    return StreamBuilder(
        stream: Firestore.instance
            .collection('characters')
            .document(user.uid)
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Loading();
          } else {
            //UserData userData = snapshot.data;
            return Container(
                child: Scaffold(
              appBar: AppBar(
                centerTitle: true,
                title: Text('Conta'),
                backgroundColor: Colors.black,
              ),
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      snapshot.data['jogador'],
                      style: TextStyle(fontSize: 30.0),
                    ),
                    SizedBox(height: 10),
                    Text(
                      snapshot.data['personagem'],
                      style: TextStyle(fontSize: 20.0),
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Criado em: ',
                          style: TextStyle(fontSize: 20.0),
                        ),
                        Text(
                          snapshot.data['data'],
                          style: TextStyle(fontSize: 20.0),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Número de sessões: ',
                          style: TextStyle(fontSize: 20.0),
                        ),
                        Text(
                          snapshot.data['sessoes'].toString(),
                          style: TextStyle(fontSize: 20.0),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Última sessão: ',
                          style: TextStyle(fontSize: 20.0),
                        ),
                        Text(
                          snapshot.data['ultimaSessao'],
                          style: TextStyle(fontSize: 20.0),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: FlatButton.icon(
                            color: Colors.blue,
                            icon: Icon(
                              Icons.refresh,
                              color: Colors.white,
                            ),
                            label: Text(
                              'Atualizar sessões',
                              style: TextStyle(color: Colors.white),
                            ),
                            onPressed: () {
                              if (snapshot.data['ultimaSessao'] ==
                                  DateFormat("dd-MM-yyyy").format(now)) {
                                _alreadyFresh();
                              } else {
                                _refreshData();
                              }
                            },
                          ),
                        ),
                        FlatButton.icon(
                          color: Colors.grey,
                          icon: Icon(
                            Icons.edit,
                            color: Colors.white,
                          ),
                          label: Text(
                            'Editar',
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: () async {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => HomeDrawerEdit(),
                                ));
                          },
                        ),
                        
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        FlatButton.icon(
                          color: Colors.red,
                          icon: Icon(
                            Icons.person,
                            color: Colors.white,
                          ),
                          label: Text(
                            'Sair',
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: () async {
                            await _auth.signOut();
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: 50),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        FlatButton.icon(
                          color: Colors.redAccent,
                          icon: Icon(
                            FontAwesome5Solid.skull_crossbones,
                            color: Colors.white,
                          ),
                          label: Text(
                            'Declarar Morte',
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: () async {
                            return showDialog<void>(
                              context: context,
                              barrierDismissible:
                                  false, // user must tap button!
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text('Declarar morte?'),
                                  content: SingleChildScrollView(
                                    child: ListBody(
                                      children: <Widget>[
                                        Text(
                                            'Isso deletará a sua conta e seu personagem para sempre! Deseja continuar?'),
                                      ],
                                    ),
                                  ),
                                  actions: <Widget>[
                                    FlatButton(
                                      child: Text('Cancelar'),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                    FlatButton(
                                      color: Colors.red,
                                      child: Text('Continuar'),
                                      onPressed: () async{
                                        Navigator.pop(context);
                                           Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Reauthenticate(),
                                ));                                                                                                                             
                                      },
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ));
          }
        });
  }
}
