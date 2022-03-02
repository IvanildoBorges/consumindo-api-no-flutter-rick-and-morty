import 'package:http/http.dart' as http;

class PersonagemApi{
  static Future getPersonagem(dynamic valor){
    Uri url = Uri.parse('https://www.rickandmortyapi.com/api/');

    if (valor == "character") {
      url = Uri.parse('https://www.rickandmortyapi.com/api/$valor');
    } else{
      url = Uri.parse('https://www.rickandmortyapi.com/api/episode/$valor');
    }

    return http.get(
        url,
        headers: {"Accept": "application/json"}
    );
  }
}