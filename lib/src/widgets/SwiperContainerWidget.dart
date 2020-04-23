import 'package:flutter/material.dart';

import 'package:flutter_swiper/flutter_swiper.dart';

class SwiperContainerWidget extends StatelessWidget {

  final List<dynamic> peliculas ;
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
        itemHeight: _screenSize.height * 0.5,
            itemBuilder: (BuildContext context, int index) {
              return ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: Image.network('https://vignette.wikia.nocookie.net/cartoonnetwork/images/d/dc/221975_10150172117895680_1273681_n.jpg/revision/latest/scale-to-width-down/340?cb=20130921015205&path-prefix=es',
                  fit: BoxFit.cover,
                ),
              );
            },
            itemCount: 3,
            //pagination: SwiperPagination(),
            //control: SwiperControl(),
          ),
    );
  }
}