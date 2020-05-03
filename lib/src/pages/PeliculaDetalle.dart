import 'package:cine_app/src/models/Pelicula_Models.dart';
import 'package:flutter/material.dart';

class PeliculaDetalle extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

    final Pelicula pelicula = ModalRoute.of(context).settings.arguments;
    
    return Container(
      child: Scaffold(
        body: CustomScrollView(
          slivers: <Widget>[
            _crearAppBar(pelicula),
            SliverList(
              delegate: SliverChildListDelegate(
                [_listaWidgets(pelicula)]
              )
        ),
        ],
      ),
    )
    );
  }

  Widget _crearAppBar(Pelicula pelicula) {
    return SliverAppBar(
      elevation: 2.0,
      backgroundColor: Colors.indigoAccent,
      expandedHeight: 200.0,
      floating: false,
      pinned: true,
      snap: false,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Text(
          pelicula.title,
          style: TextStyle(color: Colors.white, fontSize: 16.0, ),
        ),
        background: FadeInImage(placeholder: AssetImage('lib/src/assets/img/loading.gif'), image: NetworkImage(pelicula.getBackgroundImage()),fit: BoxFit.cover, ),
      ),
    );
  }

  Widget _listaWidgets(Pelicula pelicula) {
    return Container(
      padding: EdgeInsets.only(left: 10.0, top: 10.0),
      child: Row(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
              child: FadeInImage(
                height: 150,
                placeholder: AssetImage('lib/src/assets/img/no-image.jpg'), 
                image: NetworkImage(pelicula.getImage()) ),
          ),
        ],
      ),
    );

  }



}