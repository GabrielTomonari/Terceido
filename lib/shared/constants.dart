import 'package:flutter/material.dart';

const textInputDecoration = InputDecoration(
  fillColor: Colors.white54,
  filled: true,
  contentPadding: EdgeInsets.all(12.0),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.white, width: 2.0),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.lightBlueAccent, width: 2.0),
  ),
);

const attributeHeader = TextStyle(
  fontSize: 15,
  fontWeight: FontWeight.bold,
);

const biggerAttribute = TextStyle(
  fontSize: 18,
  height: 1.5,
);

const biggerAttributeHeader = TextStyle(
  fontSize: 20,
  fontWeight: FontWeight.bold,
  height: 1.5,
);