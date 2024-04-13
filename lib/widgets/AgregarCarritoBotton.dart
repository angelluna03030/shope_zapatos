import 'package:flutter/material.dart';
import 'package:shope_zapatos/widgets/widgets.dart';

class AgregarCarritoBotton extends StatelessWidget {
  final double monto;
   AgregarCarritoBotton({
        required this.monto 
  }

  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        width: double.infinity,
        height: 100,
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.09),
          borderRadius: BorderRadius.circular(100)
        ),
        child: Row(
          children: <Widget>[
            SizedBox(width: 20),
            Text('\$$monto', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),)
       
        ,
        Spacer()
        , BotonNaranja(texto: "Add to cart"),
        SizedBox(width: 20,)
          ],
        ),
      ),
    );
  }
}
