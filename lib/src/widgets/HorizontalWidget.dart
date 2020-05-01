import 'package:cine_app/src/models/Pelicula_Models.dart';
import 'package:flutter/material.dart';

class HorizontalWidget extends StatelessWidget {

  final List<Pelicula> listaPelis;
  final Function funcionGetPopulares;

  final _pageControler = PageController(
          initialPage: 1,
          viewportFraction: 0.3,
        ) ;

  HorizontalWidget({@required this.listaPelis, @required this.funcionGetPopulares});

  @override
  Widget build(BuildContext context) {
  final _screenSize = MediaQuery.of(context).size;

  _pageControler.addListener((){
    if(_pageControler.position.pixels >= _pageControler.position.maxScrollExtent-200){
      funcionGetPopulares();
    }
  });

    return Container(
      height: _screenSize.height * 0.34,
      child: PageView.builder(
        pageSnapping: false,
        controller: _pageControler,
        //children: _listasPopulares(context),
        itemBuilder: (context, i){
          return _listasPopular(context,listaPelis[i]);
        },
        itemCount: listaPelis.length,
      ),
    );
  }

   List<Widget> _listasPopulares(BuildContext context) {
     return listaPelis.map((pelicula){
       return Container(
         margin: EdgeInsets.only(right: 15.0),
         child: Column(
           children: <Widget>[
             ClipRRect(
                 borderRadius: BorderRadius.all(Radius.circular(10)),
                 child: FadeInImage( 
                 placeholder: AssetImage('lib/src/assets/img/no-image.jpg'), 
                 image: NetworkImage(pelicula.getImage()),
                 fit: BoxFit.cover,
                 height: 160.0,
               ), 
             ),
             Text(pelicula.title,
             overflow: TextOverflow.ellipsis,
             style: Theme.of(context).textTheme.caption,)
           ],
         ),
       );
     }).toList();
   }
}

Widget _listasPopular(BuildContext context, Pelicula pelicula){
  final targetaPelicula =  Container(
         margin: EdgeInsets.only(right: 15.0),
         child: Column(
           children: <Widget>[
             ClipRRect(
                 borderRadius: BorderRadius.all(Radius.circular(10)),
                 child: FadeInImage( 
                 placeholder: AssetImage('lib/src/assets/img/no-image.jpg'), 
                 image: NetworkImage(pelicula.getImage()),
                 fit: BoxFit.cover,
                 height: 160.0,
               ), 
             ),
             Text(pelicula.title,
             overflow: TextOverflow.ellipsis,
             style: Theme.of(context).textTheme.caption,)
           ],
         ),
       );


  return GestureDetector(
    child: targetaPelicula,
    onTap: (){
      Navigator.pushNamed(context, 'detalle');
    },
  );
}