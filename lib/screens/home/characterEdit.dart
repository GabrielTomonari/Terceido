import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:provider/provider.dart';
import 'package:terceido/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:terceido/shared/loading.dart';
import '../../shared/constants.dart';

class CharacterEdit extends StatefulWidget {
  @override
  _CharacterEditState createState() => _CharacterEditState();
}

class _CharacterEditState extends State<CharacterEdit> {
  final _formKey = GlobalKey<FormState>();

  //Form values
  int _idadeAtual;
  String _classeAtual,
      _classeFavorecidaAtual,
      _personalidadeAtual,
      _comportamentosAtual,
      _racaAtual,
      _peleAtual,
      _olhosAtual,
      _cabeloAtual,
      _outrosAtual,
      erro = '';
  double _pesoAtual, _alturaAtual;

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
              if (_classeAtual == null) {
                _classeAtual = snapshot.data['classe'];
              }
              if (_classeFavorecidaAtual == null) {
                _classeFavorecidaAtual = snapshot.data['classeFavorecida'];
              }
              if (_classeAtual == _classeFavorecidaAtual) {
                erro = 'As classes não podem ser iguais';
                _classeFavorecidaAtual = null;
              }

              //Increment One
              Future<void> incrementOne() async {
                if (snapshot.data['nivel'] < 100) {
                  return await Firestore.instance
                      .collection('characters')
                      .document(user.uid)
                      .updateData({
                    'nivel': FieldValue.increment(1),
                    'saldoHabilidades': FieldValue.increment(1),
                  });
                }else{
                  return await Firestore.instance
                      .collection('characters')
                      .document(user.uid)
                      .updateData({
                    'nivel': FieldValue.increment(1),
                  });
                }
              }

              //Increment Five
              Future<void> incrementFive() async {
                if (snapshot.data['nivel'] < 100) {
                  return await Firestore.instance
                      .collection('characters')
                      .document(user.uid)
                      .updateData({
                    'nivel': FieldValue.increment(5),
                    'saldoHabilidades': FieldValue.increment(5),
                  });
                }else{
                  return await Firestore.instance
                      .collection('characters')
                      .document(user.uid)
                      .updateData({
                    'nivel': FieldValue.increment(5),
                  });
                }
              }

              //Increment Ten
              Future<void> incrementTen() async {
                if (snapshot.data['nivel'] < 100) {
                  return await Firestore.instance
                      .collection('characters')
                      .document(user.uid)
                      .updateData({
                    'nivel': FieldValue.increment(10),
                    'saldoHabilidades': FieldValue.increment(10) 
                  });      
                }
                else{
                  return await Firestore.instance
                      .collection('characters')
                      .document(user.uid)
                      .updateData({
                    'nivel': FieldValue.increment(10),
                  });
                }
              }


              return Form(
                key: _formKey,
                child: Scaffold(
                  body: SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        SizedBox(height: 50),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              snapshot.data['personagem'],
                              style: TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 3),
                            Text(
                              snapshot.data['jogador'],
                              style: TextStyle(fontSize: 18),
                            ),
                            SizedBox(height: 20),
                            Text(
                              'Modo de edição',
                              style: TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.w300),
                            ),
                          ],
                        ),
                        SizedBox(height: 30),
                        Padding(
                          padding: const EdgeInsets.only(left: 50),
                          child: Column(
                            children: <Widget>[
                              // Nivel -----------------------------------------------------------
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
                                  Spacer(flex: 1),
                                  SizedBox(
                                    width: 50,
                                    child: RaisedButton(
                                        child: Text('+1'),
                                        onPressed: () => [incrementOne()]),
                                  ),
                                  Spacer(flex: 1),
                                  SizedBox(
                                    width: 50,
                                    child: RaisedButton(
                                        child: Text('+5'),
                                        onPressed: () => {incrementFive()}),
                                  ),
                                  Spacer(flex: 1),
                                  SizedBox(
                                    width: 60,
                                    child: RaisedButton(
                                        child: Text('+10'),
                                        onPressed: () => [incrementTen()]),
                                  ),
                                  Spacer(flex: 2),
                                ],
                              ),
                              // Classe --------------------------------------------------
                              SizedBox(height: 20),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Icon(
                                        FontAwesome.star,
                                        color: Colors.black,
                                      ),
                                      Text(' Classe: ',
                                          style: biggerAttributeHeader),
                                    ],
                                  ),
                                  DropdownButton<String>(
                                    onChanged: (String newValue) {
                                      setState(() {
                                        _classeAtual = newValue;
                                        erro = '';
                                      });
                                    },
                                    value: _classeAtual,
                                    items: <String>[
                                      'Mago Abolidor',
                                      'Mago Conector',
                                      'Mago Curandeiro',
                                      'Mago Elemental',
                                      'Mago Estrategista',
                                      'Mago da Luz',
                                      'Mago Natural',
                                      'Mago Orador',
                                      'Mago Telepata',
                                    ].map<DropdownMenuItem<String>>(
                                        (String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value),
                                      );
                                    }).toList(),
                                  ),
                                ],
                              ),
                              // Classe Favorecida -------------------------------------
                              SizedBox(height: 20),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Icon(
                                        FontAwesome.star_o,
                                        color: Colors.black,
                                      ),
                                      Text(' Classe Favorecida: ',
                                          style: biggerAttributeHeader),
                                    ],
                                  ),
                                  DropdownButton<String>(
                                    onChanged: (String otherValue) {
                                      setState(() {
                                        _classeFavorecidaAtual = otherValue;
                                        erro = '';
                                      });
                                    },
                                    value: _classeFavorecidaAtual,
                                    items: <String>[
                                      'Mago Abolidor',
                                      'Mago Conector',
                                      'Mago Curandeiro',
                                      'Mago Elemental',
                                      'Mago Estrategista',
                                      'Mago da Luz',
                                      'Mago Natural',
                                      'Mago Orador',
                                      'Mago Telepata',
                                    ].map<DropdownMenuItem<String>>(
                                        (String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value),
                                      );
                                    }).toList(),
                                  ),
                                  Text(
                                    erro,
                                    style: TextStyle(color: Colors.red),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        // Text Forms Inputs --------------------------------------------
                        Padding(
                          padding: const EdgeInsets.fromLTRB(50, 0, 50, 0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              // Personalidade --------------------------------
                              Text(
                                'Personalidade',
                                style: attributeHeader,
                              ),
                              TextFormField(
                                initialValue: snapshot.data['personalidade'],
                                decoration: textInputDecoration,
                                validator: (val) => val.isEmpty
                                    ? 'Insira uma personalidade'
                                    : null,
                                onChanged: (val) =>
                                    setState(() => _personalidadeAtual = val),
                              ),
                              SizedBox(height: 10),
                              // Comportamento --------------------------------
                              Text(
                                'Comportamentos (separados por vírgula)',
                                style: attributeHeader,
                              ),
                              TextFormField(
                                initialValue: snapshot.data['comportamentos'],
                                decoration: textInputDecoration,
                                validator: (val) => val.isEmpty
                                    ? 'Insira ao menos um comportamento'
                                    : null,
                                onChanged: (val) =>
                                    setState(() => _comportamentosAtual = val),
                              ),
                              SizedBox(height: 10),
                              // Raça --------------------------------
                              Text(
                                'Raça',
                                style: attributeHeader,
                              ),
                              TextFormField(
                                initialValue: snapshot.data['raca'],
                                decoration: textInputDecoration,
                                validator: (val) =>
                                    val.isEmpty ? 'Insira uma raça' : null,
                                onChanged: (val) =>
                                    setState(() => _racaAtual = val),
                              ),
                              SizedBox(height: 10),
                              // Raça --------------------------------
                              Text(
                                'Idade',
                                style: attributeHeader,
                              ),
                              TextFormField(
                                keyboardType: TextInputType.number,
                                initialValue: snapshot.data['idade'].toString(),
                                decoration: textInputDecoration,
                                validator: (val) =>
                                    val.isEmpty ? 'Insira uma idade' : null,
                                onChanged: (val) => setState(
                                    () => _idadeAtual = int.parse(val)),
                              ),
                              SizedBox(height: 10),
                              // Peso --------------------------------
                              Text(
                                'Peso',
                                style: attributeHeader,
                              ),
                              Row(
                                children: <Widget>[
                                  Expanded(
                                    flex: 1,
                                    child: TextFormField(
                                      keyboardType: TextInputType.number,
                                      initialValue:
                                          snapshot.data['peso'].toString(),
                                      decoration: textInputDecoration,
                                      validator: (val) => val.isEmpty
                                          ? 'Insira uma peso'
                                          : null,
                                      onChanged: (val) => setState(
                                          () => _pesoAtual = double.parse(val)),
                                    ),
                                  ),
                                  Expanded(flex: 5, child: Text(' kg')),
                                ],
                              ),
                              SizedBox(height: 10),
                              // Altura --------------------------------
                              Text(
                                'Altura (decimais dividos por ponto . )',
                                style: attributeHeader,
                              ),
                              Row(
                                children: <Widget>[
                                  Expanded(
                                    flex: 1,
                                    child: TextFormField(
                                      keyboardType: TextInputType.number,
                                      initialValue:
                                          snapshot.data['altura'].toString(),
                                      decoration: textInputDecoration,
                                      validator: (val) => val.isEmpty
                                          ? 'Insira uma altura'
                                          : null,
                                      onChanged: (val) => setState(() =>
                                          _alturaAtual = double.parse(val)),
                                    ),
                                  ),
                                  Expanded(flex: 5, child: Text(' m')),
                                ],
                              ),
                              SizedBox(height: 10),
                              // Pele --------------------------------
                              Text(
                                'Pele',
                                style: attributeHeader,
                              ),
                              TextFormField(
                                initialValue: snapshot.data['pele'],
                                decoration: textInputDecoration,
                                validator: (val) => val.isEmpty
                                    ? 'Insira uma cor de pele'
                                    : null,
                                onChanged: (val) =>
                                    setState(() => _peleAtual = val),
                              ),
                              SizedBox(height: 10),
                              // Olhos --------------------------------
                              Text(
                                'Olhos',
                                style: attributeHeader,
                              ),
                              TextFormField(
                                initialValue: snapshot.data['olhos'],
                                decoration: textInputDecoration,
                                validator: (val) => val.isEmpty
                                    ? 'Insira uma cor de olhos'
                                    : null,
                                onChanged: (val) =>
                                    setState(() => _olhosAtual = val),
                              ),
                              SizedBox(height: 10),
                              // Cabelo --------------------------------
                              Text(
                                'Cabelo',
                                style: attributeHeader,
                              ),
                              TextFormField(
                                initialValue: snapshot.data['cabelo'],
                                decoration: textInputDecoration,
                                validator: (val) => val.isEmpty
                                    ? 'Insira uma cor de cabelo'
                                    : null,
                                onChanged: (val) =>
                                    setState(() => _cabeloAtual = val),
                              ),
                              SizedBox(height: 10),
                              // Outros --------------------------------
                              Text(
                                'Outros',
                                style: attributeHeader,
                              ),
                              TextFormField(
                                initialValue: snapshot.data['outros'],
                                decoration: textInputDecoration,
                                onChanged: (val) =>
                                    setState(() => _outrosAtual = val),
                              ),
                              SizedBox(height: 10),
                            ],
                          ),
                        ),
                        // ------------------------------------------------------------------
                        SizedBox(height: 20),
                        RaisedButton.icon(
                          color: Colors.white,
                          textColor: Colors.black54,
                          icon: Icon(FontAwesome.save),
                          label: Text('Salvar'),
                          onPressed: () async {
                            if (_formKey.currentState.validate()) {
                              await Firestore.instance
                                  .collection('characters')
                                  .document(user.uid)
                                  .updateData({
                                'classe':
                                    _classeAtual ?? snapshot.data['classe'],
                                'classeFavorecida': _classeFavorecidaAtual ??
                                    snapshot.data['classeFavorecida'],
                                'personalidade': _personalidadeAtual ??
                                    snapshot.data['personalidade'],
                                'comportamentos': _comportamentosAtual ??
                                    snapshot.data['comportamentos'],
                                'raca': _racaAtual ?? snapshot.data['raca'],
                                'idade': _idadeAtual ?? snapshot.data['idade'],
                                'peso': _pesoAtual ?? snapshot.data['peso'],
                                'altura':
                                    _alturaAtual ?? snapshot.data['altura'],
                                'pele': _peleAtual ?? snapshot.data['pele'],
                                'olhos': _olhosAtual ?? snapshot.data['olhos'],
                                'cabelo':
                                    _cabeloAtual ?? snapshot.data['cabelo'],
                                'outros':
                                    _outrosAtual ?? snapshot.data['outros'],
                              });
                              Navigator.pop(context);
                            } else {
                              print("não valido");
                            }
                          },
                        ),
                        SizedBox(height: 50),
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
