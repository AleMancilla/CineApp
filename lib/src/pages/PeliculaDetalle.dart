import 'package:cine_app/src/models/ActorModel.dart';
import 'package:cine_app/src/models/Pelicula_Models.dart';
import 'package:cine_app/src/providers/Peliculas_Providers.dart';
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
                [
                  _listaWidgets(context,pelicula),
                  _descripcion(pelicula),
                  _crearCasting(pelicula),
                ]
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

  Widget _listaWidgets(BuildContext context, Pelicula pelicula) {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: Row(
        children: <Widget>[
          Hero(
            tag: pelicula.id,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
                child: FadeInImage(
                  height: 150,
                  placeholder: AssetImage('lib/src/assets/img/no-image.jpg'), 
                  image: NetworkImage(pelicula.getImage()) ),
            ),
          ),
          SizedBox(width: 10.0,),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(pelicula.originalTitle, style: Theme.of(context).textTheme.title,overflow: TextOverflow.ellipsis,),
                Text(pelicula.title, style: Theme.of(context).textTheme.subtitle,overflow: TextOverflow.ellipsis),
                Row(
                  children: <Widget>[
                    Icon(Icons.star),
                    Text(pelicula.voteAverage.toString())
                  ],
                ),
                Row(
                  children: <Widget>[
                    Icon(Icons.confirmation_number),
                    Text(pelicula.voteCount.toString())
                  ],
                )
              ],
            ),
            )
        ],
      ),
    );

  }

  Widget _descripcion(Pelicula pelicula) {
    return Container(
      padding: EdgeInsets.all(15.0),
      child: Text(
        pelicula.overview,
        textAlign: TextAlign.justify,
        ),

    );
  }

  Widget _crearCasting(Pelicula pelicula){
    final peliProvider = new  PeliculasProvider();
    return FutureBuilder(
      future: peliProvider.getActores(pelicula.id.toString()),
      builder: (context, AsyncSnapshot<List> snapshot){
        if(snapshot.hasData){
          return _crearActoresPageView(snapshot.data);
        }else{
          return Center(child: CircularProgressIndicator());
        }
      }
      );
  }

  Widget _crearActoresPageView(List<Actor> actores){
    return SizedBox(
      height: 200.0,
      child: PageView.builder(
        pageSnapping: false,
        controller: PageController(
          viewportFraction: 0.3,
          initialPage: 1
        ),
        itemCount: actores.length,
        itemBuilder: (context, i){
         return _actorTargeta(actores[i]);
        },
        ),
    );
  }

  Widget _actorTargeta(Actor actor){
    return Container(
      //padding: EdgeInsets.symmetric(horizontal: 5.0),
      child: Column(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: FadeInImage(
              placeholder: AssetImage('lib/src/assets/img/no-image.jpg'), 
              image: NetworkImage(actor.getImage()),
              height: 130.0,
              fit: BoxFit.cover
              ),
          ),
          Text(actor.name,
          overflow: TextOverflow.ellipsis,)
        ],
      ),
    );
  }



}