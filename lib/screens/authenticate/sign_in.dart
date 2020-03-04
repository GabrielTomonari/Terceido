import 'package:terceido/services/auth.dart';
import 'package:terceido/shared/constants.dart';
import 'package:terceido/shared/loading.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {

  final Function toggleView;
  SignIn({ this.toggleView });

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  String error = '';
  bool loading = false;

  // text field state
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : Container(
      decoration: BoxDecoration(image:DecorationImage(image: AssetImage('lib/assets/images/login.png'), fit:BoxFit.cover)),
      child: Scaffold(
        resizeToAvoidBottomPadding: false,
        backgroundColor: Colors.transparent,
        body: Container(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                SizedBox(height: 250.0),
                TextFormField(
                  decoration: textInputDecoration.copyWith(hintText: 'E-mail'),
                  validator: (val) => val.isEmpty ? 'Insira um email' : null,
                  onChanged: (val) {
                    setState(() => email = val);
                  },
                ),
                SizedBox(height: 40.0),
                TextFormField(
                  obscureText: true,
                  decoration: textInputDecoration.copyWith(hintText: 'Senha'),
                  validator: (val) => val.length < 6 ? 'A senha deve ter mais de 6 caracteres' : null,
                  onChanged: (val) {
                    setState(() => password = val);
                  },
                ),
                SizedBox(height: 40.0),
                RaisedButton(
                  color: Colors.lightBlue,
                  child: Text(
                    'Log In',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () async {
                    if(_formKey.currentState.validate()){
                      setState(() => loading = true);
                      dynamic result = await _auth.signInWithEmailAndPassword(email, password);
                      if(result == null) {
                        setState(() {
                          loading = false;
                          error = 'Não foi possível logar com essas credenciais';
                        });
                      }
                    }
                  }
                ),
                SizedBox(height: 12.0),
                Text(
                  error,
                  style: TextStyle(color: Colors.red, fontSize: 14.0),
                ),
                SizedBox(height: 12.0),
                Text('Ainda não possui uma conta?', style: TextStyle(color:Colors.grey),),
                SizedBox(height: 5.0),
                FlatButton.icon(
                  icon: Icon(Icons.person), 
                  color: Colors.white,
                  label: Text('Criar uma Conta'),
                  onPressed: () => widget.toggleView(),) 

              ],
            ),
          ),
        ),
      ),
    );
  }
}


