import 'package:cine_app/src/models/Pelicula_Models.dart';
import 'package:flutter/material.dart';

import 'package:flutter_swiper/flutter_swiper.dart';

class SwiperContainerWidget extends StatelessWidget {

  final List<Pelicula> peliculas ;
  SwiperContainerWidget({@required this.peliculas});


  @override
  Widget build(BuildContext context) {
  final _screenSize = MediaQuery.of(context).size;
    return Container(
      width: _screenSize.width,
      padding: EdgeInsets.only(top: 5),
      child: Swiper(
        layout: SwiperLayout.STACK,
        itemWidth: _screenSize.width * 0.7,
        itemHeight: _screenSize.height * 0.4,
        itemCount: peliculas.length,
        itemBuilder: (BuildContext context, int index) {
          //print(peliculas[index].title);
          //print("################################################################3");
          return ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: FadeInImage(
                placeholder: AssetImage('lib/src/assets/img/no-image.jpg'), 
                fadeInDuration: Duration(seconds: 2),
                image: NetworkImage(
                  peliculas[index].getImage()),
                  fit: BoxFit.cover,
                  ),
          );
        },
        //pagination: SwiperPagination(),
        //control: SwiperControl(),
          ),
    );
  }
}