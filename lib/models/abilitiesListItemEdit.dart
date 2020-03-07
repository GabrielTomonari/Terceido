import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:terceido/models/user.dart';
import 'package:provider/provider.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:terceido/shared/loading.dart';

class AbilitiesListItemEdit extends StatefulWidget {
  AbilitiesListItemEdit({
    Key key,
    @required this.number,
    this.name,
  }) : super(key: key);

  final int number;
  final String name;

  @override
  _AbilitiesListItemEditState createState() => _AbilitiesListItemEditState();
}

class _AbilitiesListItemEditState extends State<AbilitiesListItemEdit> {
  Color color = Colors.lightBlue[100];

  double v1 = 0, v2 = 0, v3 = 0, v4 = 0, v5 = 0, v6 = 0, v7 = 0;

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    if (widget.number == 0) {
      color = Colors.lightBlue[100];
      v1 = 0;
      v2 = 0;
      v3 = 0;
      v4 = 0;
      v5 = 0;
      v6 = 0;
      v7 = 0;
    } else if (widget.number == 1) {
      color = Colors.lightBlue[200];
      v1 = 1.0;
      v2 = 0;
      v3 = 0;
      v4 = 0;
      v5 = 0;
      v6 = 0;
      v7 = 0;
    } else if (widget.number == 2) {
      color = Colors.lightBlue[300];
      v1 = 1.0;
      v2 = 1.0;
      v3 = 0;
      v4 = 0;
      v5 = 0;
      v6 = 0;
      v7 = 0;
    } else if (widget.number == 3) {
      color = Colors.lightBlue[400];
      v1 = 1.0;
      v2 = 1.0;
      v3 = 1.0;
      v4 = 0;
      v5 = 0;
      v6 = 0;
      v7 = 0;
    } else if (widget.number == 4) {
      color = Colors.lightBlue[500];
      v1 = 1.0;
      v2 = 1.0;
      v3 = 1.0;
      v4 = 1.0;
      v5 = 0;
      v6 = 0;
      v7 = 0;
    } else if (widget.number == 5) {
      color = Colors.lightBlue[600];
      v1 = 1.0;
      v2 = 1.0;
      v3 = 1.0;
      v4 = 1.0;
      v5 = 1.0;
      v6 = 0;
      v7 = 0;
    } else if (widget.number == 6) {
      color = Colors.lightBlue[700];
      v1 = 1.0;
      v2 = 1.0;
      v3 = 1.0;
      v4 = 1.0;
      v5 = 1.0;
      v6 = 1.0;
      v7 = 0;
    } else if (widget.number == 7) {
      color = Colors.orange[800];
      v1 = 1.0;
      v2 = 1.0;
      v3 = 1.0;
      v4 = 1.0;
      v5 = 1.0;
      v6 = 1.0;
      v7 = 1.0;
    }

    return StreamBuilder(
        stream: Firestore.instance
            .collection('characters')
            .document(user.uid)
            .collection('Habilidades')
            .snapshots(),
        builder: (context, snapshot1) {
          if (!snapshot1.hasData) {
            return Loading();
          } else {
            return StreamBuilder(
                stream: Firestore.instance
                    .collection('characters')
                    .document(user.uid)
                    .snapshots(),
                builder: (context, snapshot2) {
                  if (!snapshot2.hasData) {
                    return Loading();
                  } else {
                    //Aumenta o valor da Habilidade em uma unidade e diminui o saldo
                    Future<void> increase() async {
                      if (snapshot2.data['saldoHabilidades'] > 0 &&
                          widget.number < 7) {
                        await Firestore.instance
                            .collection('characters')
                            .document(user.uid)
                            .collection('Habilidades')
                            .document(widget.name)
                            .updateData({
                          'Valor': FieldValue.increment(1),
                        });
                        await Firestore.instance
                            .collection('characters')
                            .document(user.uid)
                            .updateData(
                                {'saldoHabilidades': FieldValue.increment(-1)});
                      }
                    }

                    return Padding(
                      padding: const EdgeInsets.fromLTRB(0, 10, 20, 10),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            flex: 4,
                            child: Column(
                              children: <Widget>[
                                Text(widget.name,
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 8,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    Flexible(
                                      child: LinearProgressIndicator(
                                        value: v1,
                                        valueColor:
                                            AlwaysStoppedAnimation(color),
                                        backgroundColor: Colors.lightBlue[50],
                                      ),
                                    ),
                                    Text(' '),
                                    Flexible(
                                      child: LinearProgressIndicator(
                                        value: v2,
                                        valueColor:
                                            AlwaysStoppedAnimation(color),
                                        backgroundColor: Colors.lightBlue[50],
                                      ),
                                    ),
                                    Text(' '),
                                    Flexible(
                                      child: LinearProgressIndicator(
                                        value: v3,
                                        valueColor:
                                            AlwaysStoppedAnimation(color),
                                        backgroundColor: Colors.lightBlue[50],
                                      ),
                                    ),
                                    Text(' '),
                                    Flexible(
                                      child: LinearProgressIndicator(
                                        value: v4,
                                        valueColor:
                                            AlwaysStoppedAnimation(color),
                                        backgroundColor: Colors.lightBlue[50],
                                      ),
                                    ),
                                    Text(' '),
                                    Flexible(
                                      child: LinearProgressIndicator(
                                        value: v5,
                                        valueColor:
                                            AlwaysStoppedAnimation(color),
                                        backgroundColor: Colors.lightBlue[50],
                                      ),
                                    ),
                                    Text(' '),
                                    Flexible(
                                      child: LinearProgressIndicator(
                                        value: v6,
                                        valueColor:
                                            AlwaysStoppedAnimation(color),
                                        backgroundColor: Colors.lightBlue[50],
                                      ),
                                    ),
                                    Text(' '),
                                    Flexible(
                                      child: LinearProgressIndicator(
                                        value: v7,
                                        valueColor:
                                            AlwaysStoppedAnimation(color),
                                        backgroundColor: Colors.lightBlue[50],
                                      ),
                                    ),
                                    Spacer(
                                      flex: 1,
                                    ),
                                    Text(
                                      widget.number.toString(),
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Spacer(
                                      flex: 1,
                                    ),
                                    IconButton(
                                        icon: Icon(Entypo.squared_plus),
                                        onPressed: () => increase()),
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  }
                });
          }
        });
  }
}
