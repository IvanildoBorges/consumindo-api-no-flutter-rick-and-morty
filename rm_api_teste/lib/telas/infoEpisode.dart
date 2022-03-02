import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../data/dadosApi.dart';
import '../model/episode.dart';

class InfoEpisode extends StatefulWidget {
  int consulta;

  InfoEpisode(this.consulta);

  @override
  State<StatefulWidget> createState() {
    return InfoEpisodeState();
  }
}

class InfoEpisodeState extends State<InfoEpisode> {
  Episode episodio = Episode(id: 0, name: '', lancado: '', episode: '', personagens: []);

  void getEpisodefromAPI() async{
    PersonagemApi.getEpisode(widget.consulta).then((response){
      setState(() {
        final lista = json.decode(response.body);
        episodio = Episode.fromJson(lista);
      });
    });
  }

  @override
  void initState(){
    // chamar nosso metodo para trazer os per.
    getEpisodefromAPI();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xdd364047),
      appBar: AppBar(
        title: Text("Informações do episódio",
          style: TextStyle(
            color: Color(0xff54ffeb),
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Color(0xff364047),
      ),
      body: Container(
        child: ListView.builder(
          itemCount: 1,
          itemBuilder: (context, index) {
              return Container(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Card(
                          child: Container(
                            color: Color(0xdd364047),
                            padding: EdgeInsets.all(20.0),
                            child: Column(
                              children: <Widget>[
                                Text(episodio.name,
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Color(0xff54ffeb),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 20.0),
                                  child: Container(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.stretch,
                                      children: <Widget>[
                                        Container(
                                          color: Color(0xd00364047),
                                          child: Column(
                                            children: [
                                              Image.network("https://br.web.img3.acsta.net/pictures/17/11/06/14/13/5164749.jpg?coixp=50&coiyp=47"),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(left: 5.0),
                                                child: Container(
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Padding(
                                                        padding: const EdgeInsets.fromLTRB(0, 20.0, 0, 7.0),
                                                        child: Text("Episódio: ",
                                                          style: TextStyle(
                                                            fontSize: 14,
                                                            color: Color(0xff46ffab),
                                                            fontWeight: FontWeight.bold,
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding: const EdgeInsets.fromLTRB(0, 5.0, 0, 7.0),
                                                        child: Text("Número: ",
                                                          style: TextStyle(
                                                            fontSize: 14,
                                                            color: Color(0xff46ffab),
                                                            fontWeight: FontWeight.bold,
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding: const EdgeInsets.fromLTRB(0, 5.0, 0, 7.0),
                                                        child: Text("No ar em: ",
                                                          style: TextStyle(
                                                            fontSize: 14,
                                                            color: Color(0xff46ffab),
                                                            fontWeight: FontWeight.bold,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(left: 10.0),
                                                child: Container(
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Padding(
                                                        padding: const EdgeInsets.fromLTRB(0, 20.0, 0, 7.0),
                                                        child: Text(episodio.name,
                                                          style: TextStyle(
                                                            fontSize: 14,
                                                            color: Color(0xffffffff),
                                                            fontWeight: FontWeight.bold,
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding: const EdgeInsets.fromLTRB(0, 5.0, 0, 7.0),
                                                        child: Text('${episodio.episode}',
                                                          style: TextStyle(
                                                            fontSize: 14,
                                                            color: Color(0xffffffff),
                                                            fontWeight: FontWeight.bold,
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding: const EdgeInsets.fromLTRB(0, 5.0, 0, 7.0),
                                                        child: Text(episodio.lancado,
                                                          style: TextStyle(
                                                            fontSize: 14,
                                                            color: Color(0xffffffff),
                                                            fontWeight: FontWeight.bold,
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
                ),
              );
            }
        ),
      ),
    );
  }

}