import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:terceido/screens/home/drawer.dart';
import 'package:terceido/screens/home/ficha.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static List<Widget> _widgetOptions = <Widget>[
    Ficha(),
    Text(
      'Grimório',
      style: optionStyle,
    ),
    Text(
      'Vitalidade',
      style: optionStyle,
    ),
    Text(
      'Itens',
      style: optionStyle,
    ),
  ];

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: HomeDrawer(),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Text(
          'TERCEIDO',
          style: TextStyle(color: Colors.black),
        ),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.person),
              color: Colors.grey,
              onPressed: () {
                Scaffold.of(context).openDrawer();
              }
            );
          },
        ),
        actions: <Widget>[
          FlatButton.icon(
              onPressed: null, icon: Icon(Icons.menu), label: Text('')),
        ],
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(FontAwesome5Solid.address_card),
            title: Text('Ficha'),
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesome5Solid.book),
            title: Text('Grimório'),
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesome5Solid.heartbeat),
            title: Text('Vitalidade'),
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesome5Solid.box),
            title: Text('Itens'),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}


