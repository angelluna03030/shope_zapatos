import 'package:flutter/material.dart';

class ZapatoDescripcion extends StatelessWidget {
  const ZapatoDescripcion(
    this.descripcion,
    this.titulo
  );
  final String titulo;
  final String descripcion;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(titulo, style: TextStyle(
            fontSize: 30, fontWeight: FontWeight.w700
          ),),
          SizedBox(height: 20,),
              Text(descripcion, style: TextStyle(
                color: Colors.black54,
          height: 1.6
          ),)
        ],
      ),
    );
  }
}
