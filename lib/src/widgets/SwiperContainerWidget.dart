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
        itemWidth: _screenSize.width * 0.75,
        itemHeight: _screenSize.height * 0.45,
        itemCount: peliculas.length,
        itemBuilder: (BuildContext context, int index) {
          //print(peliculas[index].title);
          //print("################################################################3");
          return Hero(
            tag: peliculas[index].id,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: 
                GestureDetector(
                  child: FadeInImage(
                    placeholder: AssetImage('lib/src/assets/img/no-image.jpg'), 
                    fadeInDuration: Duration(seconds: 2),
                    image: NetworkImage(
                      peliculas[index].getImage()),
                      fit: BoxFit.cover,
                      ),
                    onTap: (){
                      Navigator.pushNamed(context, 'detalle',arguments: peliculas[index]);
                    },
                ),
            ),
          );
        },
        //pagination: SwiperPagination(),
        //control: SwiperControl(),
          ),
    );
  }
}