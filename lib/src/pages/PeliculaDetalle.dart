import 'package:cine_app/src/models/Pelicula_Models.dart';
import 'package:flutter/material.dart';

class PeliculaDetalle extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

    final Pelicula pelicula = ModalRoute.of(context).settings.arguments;
    return Container(
      child: Scaffold(
        body: Center(child: Text(pelicula.title)),
      ),
    );
  }
}