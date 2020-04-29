import 'dart:convert';

import 'package:http/http.dart' ;
import 'package:cine_app/src/models/Pelicula_Models.dart';

class PeliculasProvider{
  String _apikey = '4d928f2be8386ff2487427b43c5efe91';
  String _url = 'api.themoviedb.org';
  String _languaje = 'es-ES';
  int _popularesPage = 0;
  
  Future<List<Pelicula>> getEnCines()async{
    final url = Uri.https(_url, '3/movie/now_playing',{
      'api_key' : _apikey,
      'language':_languaje
    });
    return getJson(url);
  }

  Future<List<Pelicula>> getPopulares()async{
    _popularesPage++;
    final url = Uri.https(_url, '3/movie/popular',{
      'api_key' : _apikey,
      'language':_languaje,
      'page'    :_popularesPage.toString()
    });
    return getJson(url);
    
  }


  Future<List<Pelicula>> getJson(Uri url) async{
    final respuesta = await get(url);
    final decodeData = json.decode(respuesta.body);
    final peliculas = new Peliculas.fromJsonList(decodeData['results']);
    return peliculas.items;
  }
}