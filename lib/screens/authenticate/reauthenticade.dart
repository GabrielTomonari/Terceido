import 'package:terceido/services/auth.dart';
import 'package:terceido/shared/constants.dart';
import 'package:terceido/shared/loading.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Reauthenticate extends StatefulWidget {
  final Function toggleView;
  Reauthenticate({this.toggleView});

  @override
  _ReauthenticateState createState() => _ReauthenticateState();
}

class _ReauthenticateState extends State<Reauthenticate> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  String error = '';
  bool loading = false;

  // text field state
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Container(
            child: Scaffold(
              resizeToAvoidBottomPadding: false,
              backgroundColor: Colors.transparent,
              body: Container(
                color: Colors.white,
                padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 250.0),
                      Text('Faça login novamente para confirmar a ação'),
                      TextFormField(
                        decoration:
                            textInputDecoration.copyWith(hintText: 'E-mail'),
                        validator: (val) =>
                            val.isEmpty ? 'Insira um email' : null,
                        onChanged: (val) {
                          setState(() => email = val);
                        },
                      ),
                      SizedBox(height: 40.0),
                      TextFormField(
                        obscureText: true,
                        decoration:
                            textInputDecoration.copyWith(hintText: 'Senha'),
                        validator: (val) =>
                            val.length < 6 ? 'A senha não é valida' : null,
                        onChanged: (val) {
                          setState(() => password = val);
                        },
                      ),
                      SizedBox(height: 40.0),
                      RaisedButton(
                          color: Colors.red,
                          child: Text(
                            'Confirmar Morte',
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: () async {
                            if (_formKey.currentState.validate()) {
                              setState(() => loading = true);
                              dynamic result = await _auth.reauthenticateWithEmailAndPassword(email, password);
                              Navigator.pop(context);
                              if (result == null) {
                                setState(() {
                                  loading = false;
                                  error =
                                      'Não foi possível logar com essas credenciais';
                                });
                              }
                            }
                          }),
                      SizedBox(height: 12.0),
                      Text(
                        error,
                        style: TextStyle(color: Colors.red, fontSize: 14.0),
                      ),
                      SizedBox(height: 12.0),
                    ],
                  ),
                ),
              ),
            ),
          );
  }
}
