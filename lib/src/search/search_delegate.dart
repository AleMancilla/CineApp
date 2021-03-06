import 'package:cine_app/src/models/Pelicula_Models.dart';
import 'package:cine_app/src/providers/Peliculas_Providers.dart';
import 'package:flutter/material.dart';

class DataSearch extends SearchDelegate{

  String seleccion = '';
  final peliculasProvider = new PeliculasProvider();
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
    return Center(
      child: Container(
        height: 100.0,
        width: 100.0,
        color: Colors.blueAccent,
        child: Text(seleccion),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final listaSugerida = (query.isEmpty)
                          ?
                          peliculasRecientes :
                          peliculas.where((p)=>p.toLowerCase().startsWith(query.toLowerCase())).toList();

    if(query.isEmpty) return Container();

    return FutureBuilder(
      future: peliculasProvider.buscarPeli(query),
      builder: (BuildContext context, AsyncSnapshot<List<Pelicula>> snapshot) {
        if(snapshot.hasData){
          final peliculas = snapshot.data;
          return ListView(
            children:  peliculas.map(  (peli) {
                return ListTile(
                  leading: FadeInImage(
                    placeholder: AssetImage('lib/src/assets/img/no-image.jpg'), 
                    image: NetworkImage(peli.getImage()),
                    width:  50.0,
                    fit: BoxFit.cover,
                    ),
                    title: Text(peli.title),
                    subtitle: Text(peli.originalTitle),
                    onTap: (){
                      close(context, null);
                      peli.uniqueID = '';
                      Navigator.pushNamed(context, 'detalle', arguments: peli);
                    },
                );
              }).toList()
          );
        }else{
          return Center(child: CircularProgressIndicator(),);
        }
      },
    );                    
    // TODO: implement buildSuggestions
    //return ListView.builder(
    //  itemCount: listaSugerida.length,
    //  itemBuilder: ((context,i){
    //    return ListTile(
    //      leading: Icon( Icons.movie),
    //      title: Text(listaSugerida[i]),
    //      onTap: (){
    //        seleccion = listaSugerida[i];
    //        showResults(context);
    //      },
    //    );
    //  })
    //  );
  }

}