import 'package:cine_app/src/models/Pelicula_Models.dart';
import 'package:flutter/material.dart';

class HorizontalWidget extends StatelessWidget {

  final List<Pelicula> listaPelis;

  HorizontalWidget({@required this.listaPelis});

  @override
  Widget build(BuildContext context) {
  final _screenSize = MediaQuery.of(context).size;
    return Container(
      height: _screenSize.height * 0.2,
      child: PageView(
        children: _listasPopulares(),
      ),
    );
  }

   List<Widget> _listasPopulares() {
     return listaPelis.map((pelicula){
       return Container(
         margin: EdgeInsets.only(right: 15.0),
         child: Column(
           children: <Widget>[
             FadeInImage( 
               placeholder: AssetImage('lib/src/assets/img/no-image.jpg'), 
               image: NetworkImage(pelicula.getImage()),
               fit: BoxFit.cover,
               height: 110.0,
             )
           ],
         ),
       );
     }).toList();
   }
}