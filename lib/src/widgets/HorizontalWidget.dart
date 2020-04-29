import 'package:cine_app/src/models/Pelicula_Models.dart';
import 'package:flutter/material.dart';

class HorizontalWidget extends StatelessWidget {

  final List<Pelicula> listaPelis;

  HorizontalWidget({@required this.listaPelis});

  @override
  Widget build(BuildContext context) {
  final _screenSize = MediaQuery.of(context).size;
    return Container(
      height: _screenSize.height * 0.34,
      child: PageView(
        pageSnapping: false,
        controller: PageController(
          initialPage: 5,
          viewportFraction: 0.3,
        ),
        children: _listasPopulares(context),
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