import 'package:cine_app/src/providers/Peliculas_Providers.dart';
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
    return FutureBuilder(
      future: PeliculasProvider().getEnCines(),
      builder: (BuildContext context, AsyncSnapshot<List> dato){
        if(dato.hasData){
          print(dato.data);
          return SwiperContainerWidget(
          peliculas: dato.data,
          );
        }else{
          return Container(height: 300,child: Center(child: CircularProgressIndicator()));
        }
      }
      );


  }

}