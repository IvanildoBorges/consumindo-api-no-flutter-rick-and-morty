import 'package:flutter/material.dart';
import 'telas/listaPersonagem.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Api Rick & Morty',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ListaPersonagem(),
    );
  }
}