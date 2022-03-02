import 'package:flutter/material.dart';
import 'package:rm_api_teste/model/personagem.dart';
import 'package:rm_api_teste/telas/infoEpisode.dart';

class ListaEpisodios extends StatefulWidget {
  Personagem lista;

  ListaEpisodios(this.lista);

  @override
  State<StatefulWidget> createState() {
    return ListaDeEpisodiosState();
  }
}

class ListaDeEpisodiosState extends State<ListaEpisodios> {

  int getId(String ep){
    int aux = 0;
    String aux2 = '';

    aux2 = '${ep.length}';
    aux2 = ep.substring(ep.length-2);

    if(aux2 != "/${aux2.substring(1)}") {
      aux = int.parse(aux2);
    } else {
      aux = int.parse(aux2.substring(1));
    }

    return aux;
  }

  String getString(int numero) {
    String numberAtZero = '';

    numberAtZero = numero.toString().padLeft(2, '0');

    return numberAtZero;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xdd364047), //Cor de fundo do aplicativo
      appBar: AppBar(
        title: Text('Lista de Episódios',
          style: TextStyle(
            color: Color(0xff54ffeb),
          ),
        ),
        centerTitle: true,
        backgroundColor: Color(0xff364047), //Cor de fundo do appBar
      ),
      body: Container(  //Container geral
          child: ListView.builder(  //Lista de widgets na vertical (ou horizontal)
            itemCount: widget.lista.epsodios.length,
            itemBuilder: (context, index){
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Container( //Container com todos os cards
                  child: Column(
                    children: <Widget>[
                      Card( //Card de episodios
                        child: Container( //Container do card para background
                          color: Color(0xdd364047),
                          padding: EdgeInsets.all(20.0),
                          child: Column(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0, 0, 0, 2.0),
                                child: Container(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.stretch,
                                    children: <Widget>[
                                      Text("Episódio ${getString(getId(widget.lista.epsodios[index]))}: ",
                                        style: TextStyle(
                                          fontSize: 18,
                                          color: Color(0xff46ffab),
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0, 5.0, 0, 2.0),
                                child: Container(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.stretch,
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(0, 5.0, 0, 0),
                                        child: Image.network("https://images-na.ssl-images-amazon.com/images/I/91ht9KbsprL.jpg"),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 5.0),
                                        child: Text(widget.lista.epsodios[index], style: TextStyle(
                                          fontSize: 12,
                                          color: Color(0xffffffff),
                                          fontWeight: FontWeight.normal,
                                        )),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0, 10.0, 0, 0),
                                child: Container(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.stretch,
                                    children: <Widget>[
                                      Container(
                                          height: 50.0, width: 100.0,
                                          child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              primary: Color(0xff46ffab),
                                              elevation: 15.0,
                                              shadowColor: Color(0xff54ffeb),
                                              side: BorderSide(color: Colors.deepPurpleAccent),
                                            ),
                                            onPressed: (){
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) => InfoEpisode(
                                                    getId(widget.lista.epsodios[index]),
                                                  ),
                                                ),
                                              );
                                            },
                                            child: Text("Ver info",
                                              style: TextStyle(
                                                color: Color(0xff000000),
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          )
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
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