import 'package:flutter/material.dart';

class DataSearch extends SearchDelegate{

  final peliculas = [
    'spiderman',
    'aquaman',
    'Batman',
    'Shazam',
    'IronMan',
    'Capitan America',
  ];
  final peliculasRecientes =[
    'Spiderman',
    'Capitan America'
  ];

  @override
  List<Widget> buildActions(BuildContext context) {
    // TODO: las acciones de nuestro app bar  
    
    return [IconButton(
      icon: Icon( Icons.clear), 
      onPressed: (){
        query = '';
        }) 
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // TODO: icono a la izquierda del appbar
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow, 
        progress: transitionAnimation), 
      onPressed: (){
        close(context, null);
      });
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final listaSugerida = (query.isEmpty)
                          ?
                          peliculasRecientes :
                          peliculas.where((p)=>p.toLowerCase().startsWith(query.toLowerCase())).toList();
    // TODO: implement buildSuggestions
    return ListView.builder(
      itemCount: peliculasRecientes.length,
      itemBuilder: ((context,i){
        return ListTile(
          leading: Icon( Icons.movie),
          title: Text(peliculasRecientes[i]),
          onTap: (){},
        );
      })
      );
  }

}