// ignore_for_file: unused_local_variable

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:shope_zapatos/models/zapato_model.dart';

import '../pages/zapatos_pages_segundapagina.dart';

class ZapatosPreview extends StatelessWidget {
  final bool fullScreen;
  const ZapatosPreview({this.fullScreen = false});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (!fullScreen) {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => ZapatosDescripcion()));
        }
      },
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: fullScreen ? 5 : 30, vertical: fullScreen ? 5 : 0),
        child: Container(
          width: double.infinity,
          height: fullScreen ? 400 : 430,
          decoration: BoxDecoration(
              color: const Color(0xffFFCF53),
              borderRadius: !fullScreen
                  ? BorderRadius.circular(50)
                  : const BorderRadius.only(
                      bottomLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50),
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40))),
          child: Stack(
            children: [
              Column(
                children: <Widget>[
                  Center(child: _ZapataConSombra()),

                  // Otros widgets...
                ],
              ),
              if (!fullScreen)
                Positioned(bottom: 30, right: 20, child: _ZatatoTallas()),
            ],
          ),
        ),
      ),
    );
  }
}

class _ZatatoTallas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          _Tallas(7),
          SizedBox(
            width: 5,
          ),
          _Tallas(7.5),
          SizedBox(
            width: 5,
          ),
          _Tallas(8),
          SizedBox(
            width: 5,
          ),
          _Tallas(8.5),
          SizedBox(
            width: 5,
          ),
          _Tallas(9),
          SizedBox(
            width: 5,
          ),
          _Tallas(9.5),
        ],
      ),
    );
  }
}
class _Tallas extends StatefulWidget {
  final double tallas;
  const _Tallas(this.tallas);

  @override
  _TallasState createState() => _TallasState();
}

class _TallasState extends State<_Tallas> {
  @override
  Widget build(BuildContext context) {
    final zapatoProvider = Provider.of<ProviderZapato>(context);
    return GestureDetector(
      onTap: () {
        final zapatoProvider =
            Provider.of<ProviderZapato>(context, listen: false);
        setState(() {
          zapatoProvider.cambiotalla = widget.tallas;
        });
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        alignment: Alignment.center,
        height: 45,
        width: 45,
        decoration: BoxDecoration(
          color: widget.tallas == zapatoProvider.talla
              ? const Color(0xfff1a23a)
              : Colors.white,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            if (widget.tallas == zapatoProvider.talla)
              const BoxShadow(
                color: Color(0xfff1a23a),
                blurRadius: 10,
                offset: Offset(0, 5),
              )
          ],
        ),
        child: Text(
          ' ${widget.tallas.toString().replaceAll('.0', '')}',
          style: TextStyle(
            color: widget.tallas == zapatoProvider.talla
                ? Colors.white
                : const Color(0xffF1a23a),
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}


class _ZapataConSombra extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final zapatoProvider = Provider.of<ProviderZapato>(context);
    double imageSize = 42 *
        zapatoProvider.talla /
        1.25; // Calcular el tamaño de la imagen según la talla
    double shadowWidth = 252 -
        (zapatoProvider.talla - 6.5) *
            20; // Ajustar el tamaño de la sombra según la talla

    return Padding(
      padding: const EdgeInsets.all(40.0),
      child: Stack(
        children: <Widget>[
          Positioned(
            bottom: 10,
            right: 0,
            child: _ZapatoSombra(),
          ),
          Bounce(
           
            child: Image(
              image: AssetImage(zapatoProvider.assetImage),
              width: imageSize,
              height: imageSize,
            ),
          )
        ],
      ),
    );
  }
}

class _ZapatoSombra extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final zapatoProvider = Provider.of<ProviderZapato>(context);
    double shadowWidth = 180 +
        (7 - zapatoProvider.talla) *
            7; // Ajustar el tamaño de la sombra según la talla

    return Transform.rotate(
      angle: -0.5,
      child: Container(
        width: shadowWidth,
        height:
            shadowWidth / 1.5, // Ajustar la altura proporcionalmente al ancho
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(shadowWidth /
              2), // Ajustar el radio de borde proporcionalmente al ancho
          boxShadow: const [
            BoxShadow(
              color: Color(0xffEaa14e),
              blurRadius: 20,
            ),
          ],
        ),
      ),
    );
  }
}
