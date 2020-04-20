import 'package:cine_app/src/widgets/SwiperContainerWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text("AppBar"),
        backgroundColor: Colors.indigo,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search), 
            onPressed: (){})
        ],
      ),
      body: Container(
        child: _swiper(),
      )
      );
  }

  Widget _swiper() {
    return SwiperContainerWidget(peliculas: [1,2,3]);
  }

}