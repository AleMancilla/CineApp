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
        pageSnapping: false,
        controller: PageController(
          initialPage: 5,
          viewportFraction: 0.3,
        ),
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
             ClipRRect(
                 borderRadius: BorderRadius.all(Radius.circular(10)),
                 child: FadeInImage( 
                 placeholder: AssetImage('lib/src/assets/img/no-image.jpg'), 
                 image: NetworkImage(pelicula.getImage()),
                 fit: BoxFit.cover,
                 height: 110.0,
               ),
             )
           ],
         ),
       );
     }).toList();
   }
}