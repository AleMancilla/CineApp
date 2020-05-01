import 'package:cine_app/src/providers/Peliculas_Providers.dart';
import 'package:cine_app/src/widgets/HorizontalWidget.dart';
import 'package:cine_app/src/widgets/SwiperContainerWidget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {

  PeliculasProvider pelisProvider = new PeliculasProvider();

  @override
  Widget build(BuildContext context) {

    pelisProvider.getPopulares();

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
            _swiper(),
            _footeer(context)
          ],
        ),
      )
      );
  }

  Widget _swiper() {
    return FutureBuilder(
      future: pelisProvider.getEnCines(),
      builder: (BuildContext context, AsyncSnapshot<List> dato){
        if(dato.hasData){
          //print(dato.data);
          //print("##____________##########_____________##########__________");
          return SwiperContainerWidget(
          peliculas: dato.data,
          );
        }else{
          return Container(height: 300,
          child: Center(child: CircularProgressIndicator()));
        }
      }
      );


  }

  Widget _footeer(BuildContext context){
    return Container(
      //color: Colors.blueAccent,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 15.0),
            child: Text('Populares', style: Theme.of(context).textTheme.subhead,)),
          StreamBuilder(
            stream: pelisProvider.popularesStream,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if(snapshot.hasData){
                return HorizontalWidget(listaPelis: snapshot.data,funcionGetPopulares: pelisProvider.getPopulares,);
              }else{
                return CircularProgressIndicator();
              }
            },
          ),
        ],
      ),
    );
  }
}