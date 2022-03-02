import 'package:http/http.dart' as http;

class PersonagemApi{
  static Future getPersonagem(){
    Uri url = Uri.parse('https://www.rickandmortyapi.com/api/character');

    return http.get(url, headers: {"Accept": "application/json"});
  }

  static Future getEpisode(int valor) {
    Uri url = Uri.parse('https://www.rickandmortyapi.com/api/episode/${valor}');

    return http.get(url, headers: {"Accept": "application/json"});
  }
}