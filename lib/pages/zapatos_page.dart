// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:shope_zapatos/helpers/herpers.dart';


import '../widgets/widgets.dart';

class ZapatoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   
    cambiarStatusLigth();
    return Scaffold(
      body: Column(
        children: <Widget>[
          CustomAppBar(),
          SizedBox(
            height: 20,
          ),
          Expanded(
              child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: const <Widget>[

                Hero(
                  tag: 'zapato-1',
                  child: ZapatosPreview()),
                ZapatoDescripcion(
                    "The Nike Air Max 720 goes bigger than ever before with Nike's taller Air unit yet, offering more air underfoot for unimaginable, all-day comfort. Has Air Max gone too far? We hope so.",
                    "Nike Air Max 720")
              ],
            ),
          )
          ),
          AgregarCarritoBotton(
           monto: 100.0,
          )
        ],
      ),
    );
  }
}

//