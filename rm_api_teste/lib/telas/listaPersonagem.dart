import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:rm_api_teste/telas/listaEpsodios.dart';
import '../model/personagem.dart';
import '../data/dadosApi.dart';


class ListaPersonagem extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return PersonagemListaState();
  }
}

class PersonagemListaState extends State<ListaPersonagem>{
  List<Personagem> personagensLista = <Personagem>[];

  void getPersonagensfromAPI() async{
    PersonagemApi.getPersonagem('character').then((response){
      setState(() {
        Iterable lista = json.decode(response.body)['results'];
        personagensLista = lista.map((model) => Personagem.fromJson(model)).toList();
      });
    });
  }

  String getStatus(String estado) {
    String _status = '';

    if (estado == 'Alive') {
      _status = "Vivo";
    } else if (estado == 'Dead') {
      _status = "Morto";
    } else {
      _status = "Desconhecido";
    }
    return _status;
  }

  int getCor(String estado) {
    int _cor = 0;

    if (estado == 'Alive') {
      _cor = 0xff77ff00;
    } else if (estado == 'Dead') {
      _cor = 0xffff0000;
    } else {
      _cor = 0xffe7d8d4;
    }
    return _cor;
  }

  String getGender(String valor) {
    String _valor = '';
    if (valor != '') {
      _valor = valor;
    } else {
      _valor = "Comum";
    }

    return _valor;
  }

  //Metodod para pegar personagens
  @override
  void initState(){
    // chamar nosso metodo para trazer os per.
    getPersonagensfromAPI();
    super.initState();
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
        backgroundColor: Color(0xdd364047),
        appBar: AppBar(
          title: Text( "Personagens Rick & Morty",
            style: TextStyle(
              color: Color(0xffffffff),
            ),
          ),
          centerTitle: true,
          backgroundColor: Color(0xff364047),
        ),
        body: Container(
            child: ListView.builder(
                itemCount: personagensLista.length,
                itemBuilder: (context, index){
                  return Container(
                    padding: EdgeInsets.all(10.0),
                    child: Center(
                      child: Column(
                        children: <Widget>[
                          Card(
                            child: Container(
                              color: Color(0xdd364047),
                              padding: EdgeInsets.all(20.0),
                              child: Column(
                                children: <Widget>[
                                  Image.network(personagensLista[index].img),
                                  Divider(),
                                  Text(personagensLista[index].name,
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Color(0xff54ffeb),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(personagensLista[index].especie,
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Color(0xffffffff),
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(0, 15.0, 0, 0),
                                    child: Container(
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              children: [
                                                Text("Status",
                                                    style: TextStyle(
                                                      fontSize: 14,
                                                      color: Color(0xff46ffab),
                                                      fontWeight: FontWeight.bold,
                                                    ),
                                                  ),
                                              ],
                                            ),
                                          ),
                                          Text("Tipo",
                                            style: TextStyle(
                                              fontSize: 14,
                                              color: Color(0xff46ffab),
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Text("Gênero",
                                            style: TextStyle(
                                              fontSize: 14,
                                              color: Color(0xff46ffab),
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5),
                                    child: Container(
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              children: [
                                                Container(
                                                  width: 10,
                                                  height: 10,
                                                  decoration: BoxDecoration(
                                                    color: Color(getCor(personagensLista[index].status)),
                                                    shape: BoxShape.circle,
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.only(left: 7.0),
                                                  child: Text(getStatus(personagensLista[index].status),
                                                    style: TextStyle(
                                                      fontSize: 12,
                                                      color: Color(getCor(personagensLista[index].status)),
                                                      fontWeight: FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Text(getGender(personagensLista[index].tipo),
                                            style: TextStyle(
                                              fontSize: 12,
                                              color: Color(0xffffffff),
                                              fontWeight: FontWeight.normal,
                                            ),
                                          ),
                                          Text(personagensLista[index].genero,
                                            style: TextStyle(
                                              fontSize: 12,
                                              color: Color(0xffffffff),
                                              fontWeight: FontWeight.normal,
                                            ),
                                            ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.stretch,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(0, 15.0, 0, 10.0),
                                          child: Text("Aparições nos episódios: ",
                                            style: TextStyle(
                                              fontSize: 16,
                                              color: Color(0xff46ffab),
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
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
                                                  builder: (context) => ListaEpisodios(
                                                      personagensLista[index],
                                                  ),
                                                ),
                                              );
                                            },
                                            child: Text("Ver Episódios",
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
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );

                  // return ListTile(
                  //   title: Text(personagensLista[index].name,
                  //     style: TextStyle(
                  //       fontSize: 14,
                  //       color: Color(0xffffffff),
                  //       fontWeight: FontWeight.bold,
                  //     ),
                  //   ),
                  //   subtitle: Text(personagensLista[index].especie,
                  //     style: TextStyle(
                  //       fontSize: 12,
                  //       color: Color(0xffffffff),
                  //       fontWeight: FontWeight.normal,
                  //     ),
                  //   ),
                  //   leading: CircleAvatar(
                  //     backgroundImage: NetworkImage(personagensLista[index].img),
                  //   ),
                  // );
                }
            )
        )
    );
  }
}