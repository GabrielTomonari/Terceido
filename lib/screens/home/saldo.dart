import 'package:flutter/material.dart';
import 'package:terceido/models/user.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Saldo extends StatelessWidget {
    
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
     return StreamBuilder(
          stream: Firestore.instance
              .collection('characters')
              .document(user.uid)
              .snapshots(),
          builder: (context, snapshot) {
            return null;
          });
  }
}