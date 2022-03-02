import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:rm_api_teste/model/personagem.dart';
import '../data/dadosApi.dart';

class ListaEpisodios extends StatefulWidget {
  Personagem lista;

  ListaEpisodios(this.lista);

  @override
  State<StatefulWidget> createState() {
    return ListaDeEpisodiosState();
  }
}

class ListaDeEpisodiosState extends State<ListaEpisodios> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xdd364047),
      appBar: AppBar(
        title: Text('Lista de Episódios',
          style: TextStyle(
            color: Color(0xffffffff),
          ),
        ),
        centerTitle: true,
        backgroundColor: Color(0xff364047),
      ),
      body: Container(
          child: ListView.builder(
            itemCount: widget.lista.epsodios.length,
            itemBuilder: (context, index){
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 15.0, 0, 5.0),
                        child: Text("Episódio: ",
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(0xff46ffab),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Text(widget.lista.epsodios[index], style: TextStyle(
                        fontSize: 12,
                        color: Color(0xffffffff),
                        fontWeight: FontWeight.normal,
                      )),
                    ],
                  ),
                ),
              );
            }
          )
        ),
    );
  }
}