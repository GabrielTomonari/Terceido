import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Abilitie {
  final String name;
  final String description;
  final int value;

  Abilitie({this.name, this.description, this.value});
}

class AbilitiesList extends StatefulWidget {
  @override
  _AbilitiesListState createState() => _AbilitiesListState();
}

class _AbilitiesListState extends State<AbilitiesList> {
  @override
  Widget build(BuildContext context) {
    final abilities = Provider.of<List<Abilitie>>(context) ?? [];

    return ListView.builder(
      
    );
  }
}

