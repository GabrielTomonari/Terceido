import 'package:flutter/material.dart';
import 'package:terceido/models/user.dart';
import 'package:terceido/shared/loading.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:terceido/shared/constants.dart';

class HomeDrawerEdit extends StatefulWidget {
  @override
  _HomeDrawerEditState createState() => _HomeDrawerEditState();
}

class _HomeDrawerEditState extends State<HomeDrawerEdit> {
  final _formKey = GlobalKey<FormState>();

  // form values
  String _currentPlayer;
  String _currentCharacter;
  String _currentDate;
  String _currentLastDate;
  int _currentSessions;

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
            //UserData userData = snapshot.data;
            return Scaffold(
              resizeToAvoidBottomPadding: true,
              appBar: AppBar(
                centerTitle: true,
                title: Text('Editar informações da Conta'),
                backgroundColor: Colors.black,
              ),
              body: Container(
                padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 50.0),
                child: Form(
                  key: _formKey,
                  child: Center(
                    child: ListView(
                      shrinkWrap: true,
                      children: <Widget>[
                        TextFormField(
                          initialValue: snapshot.data['jogador'],
                          decoration: textInputDecoration,
                          validator: (val) =>
                              val.isEmpty ? 'Insira um nome' : null,
                          onChanged: (val) =>
                              setState(() => _currentPlayer = val),
                        ),
                        SizedBox(height: 10),
                        TextFormField(
                          initialValue: snapshot.data['personagem'],
                          decoration: textInputDecoration,
                          validator: (val) =>
                              val.isEmpty ? 'Insira um nome' : null,
                          onChanged: (val) =>
                              setState(() => _currentCharacter = val),
                        ),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'Criado em: ',
                              style: TextStyle(fontSize: 20.0),
                            ),
                            Flexible(
                              child: TextFormField(
                                  initialValue: snapshot.data['data'],
                                  decoration: textInputDecoration,
                                  validator: (val) =>
                                    val.isEmpty ? 'Insira uma data válida' : null,
                                  onChanged: (val) =>
                                    setState(() => _currentDate = val),
                                    ),
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
                            Flexible(
                              child: TextFormField(
                                keyboardType: TextInputType.number,
                                initialValue: snapshot.data['sessoes'].toString(),
                                decoration: textInputDecoration,
                                validator: (val) =>
                                    val.isEmpty ? 'Insira um número' : null,
                                onChanged: (val) =>
                                    setState(() => _currentSessions = int.parse(val)),
                              ),
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
                            Flexible(
                              child: TextFormField(
                                initialValue: snapshot.data['ultimaSessao'],
                                decoration: textInputDecoration,
                                validator: (val) =>
                                    val.isEmpty ? 'Insira uma data' : null,
                                onChanged: (val) =>
                                    setState(() => _currentLastDate = val),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            FlatButton.icon(
                              color: Colors.grey,
                              icon: Icon(
                                Icons.edit,
                                color: Colors.white,
                              ),
                              label: Text(
                                'Salvar',
                                style: TextStyle(color: Colors.white),
                              ),
                              onPressed: () async {
                                if (_formKey.currentState.validate()) {
                                  await Firestore.instance
                                      .collection('characters')
                                      .document(user.uid)
                                      .updateData({
                                    'jogador': _currentPlayer ??
                                        snapshot.data['jogador'],
                                    'personagem': _currentCharacter ??
                                        snapshot.data['personagem'],
                                    'data': _currentDate ?? snapshot.data['data'],
                                    'sessoes': _currentSessions ??
                                        snapshot.data['sessoes'],
                                    'ultimaSessao': _currentLastDate ??
                                        snapshot.data['ultimaSessao'],
                                  });
                                  Navigator.pop(context);
                                }
                              },
                            ),
                          ],
                        ),
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
