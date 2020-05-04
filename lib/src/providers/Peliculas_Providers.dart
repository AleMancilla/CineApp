import 'dart:async';
import 'dart:convert';

import 'package:cine_app/src/models/ActorModel.dart';
import 'package:http/http.dart' ;
import 'package:cine_app/src/models/Pelicula_Models.dart';

class PeliculasProvider{
  String _apikey = '4d928f2be8386ff2487427b43c5efe91';
  String _url = 'api.themoviedb.org';
  String _languaje = 'es-ES';
  int _popularesPage = 0;
  bool _cargando = false;

  List<Pelicula> _populares = new List();

  final _popularesStreamController = StreamController<List<Pelicula>>.broadcast();

  Function(List<Pelicula>) get popularesSink => _popularesStreamController.sink.add;

  Stream<List<Pelicula>> get popularesStream => _popularesStreamController.stream;

  void disposeStream(){
    _popularesStreamController?.close();
  }
  
  Future<List<Pelicula>> getEnCines()async{
    final url = Uri.https(_url, '3/movie/now_playing',{
      'api_key' : _apikey,
      'language':_languaje
    });
    return getJson(url);
  }

  Future<List<Pelicula>> getPopulares()async{
    if( _cargando ) return [];

    _cargando = true;
    _popularesPage++;
    final url = Uri.https(_url, '3/movie/popular',{
      'api_key' : _apikey,
      'language':_languaje,
      'page'    :_popularesPage.toString()
    });
    final temp = await getJson(url);

    _populares.addAll(temp);

    popularesSink(_populares);

    
    _cargando = false;
    return await getJson(url);
    
  }


  Future<List<Pelicula>> getJson(Uri url) async{
    final respuesta = await get(url);
    final decodeData = json.decode(respuesta.body);
    final peliculas = new Peliculas.fromJsonList(decodeData['results']);

    

    return peliculas.items;
  }

  Future<List<Actor>> getActores(String movieId)async{
    print(movieId);
    final url = Uri.https(_url, '3/movie/$movieId/credits',{
      'api_key' : _apikey,
      'language':_languaje
    });
  
    final respuesta = await get(url);
    final decodeData = json.decode(respuesta.body);
    final peliculas = new Actores.fromJsonList(decodeData['cast']);

    peliculas.listaActores.forEach((actor){
      print(actor.name);
    });

    return peliculas.listaActores;
  }

  Future<List<Pelicula>> buscarPeli(String query)async{
    final url = Uri.https(_url, '3/search/movie',{
      'api_key' : _apikey,
      'language':_languaje,
      'query'   : query
    });
    return getJson(url);
  }


}