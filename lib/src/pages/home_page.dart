import 'package:cine_app/src/widgets/SwiperContainerWidget.dart';
import 'package:flutter/material.dart';

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
        child: Column(
          children: <Widget>[
            _swiper()
          ],
        ),
      )
      );
  }

  Widget _swiper() {
    return SwiperContainerWidget(peliculas: [1,2,3]);
  }

}