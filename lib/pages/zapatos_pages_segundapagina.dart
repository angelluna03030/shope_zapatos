import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:shope_zapatos/helpers/herpers.dart';
import 'package:shope_zapatos/models/zapato_model.dart';

import '../widgets/widgets.dart';

class ZapatosDescripcion extends StatelessWidget {
  const ZapatosDescripcion({super.key});

  @override
  Widget build(BuildContext context) {
    cambiarStatusDark();
    return Scaffold(
      body: Column(
        children: <Widget>[
          Stack(
            children: [
              const Hero(
                  tag: 'zapato-1', child: ZapatosPreview(fullScreen: true)),
              Positioned(
                  top: 80,
                  child: TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                        cambiarStatusLigth();
                    },
                    child: const Icon(
                      Icons.chevron_left,
                      color: Colors.white,
                      size: 60,
                    ),
                  ))
            ],
          ),
          const Expanded(
              child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                ZapatoDescripcion(
                    "The Nike Air Max 720 goes bigger than ever before with Nike's taller Air unit yet, offering more air underfoot for unimaginable, all-day comfort. Has Air Max gone too far? We hope so.",
                    "Nike Air Max 720"),
                _MontoBuyNow(),
                _ColorYMas(),
                _BotonLikeCart()
              ],
            ),
          ))
        ],
      ),
    );
  }
}

class _MontoBuyNow extends StatelessWidget {
  const _MontoBuyNow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 30,
      ),
      child: Container(
        margin: const EdgeInsets.only(top: 20, bottom: 20),
        child: Row(
          children: <Widget>[
            const Text(
              '\$180.0',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const Spacer(),
            Bounce(
              delay: const Duration(seconds: 1),
              from: 8,
              child: const BotonNaranja(
                texto: 'Buy Now',
                alto: 40,
                ancho: 120,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _ColorYMas extends StatelessWidget {
  const _ColorYMas({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(10),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Stack(
              children: [
                _CircularColor(color: Color(0xffc6d642), index: 4),
                Positioned(
                    left: 30,
                    child: _CircularColor(color: Color(0xff364d56), index: 3)),
                Positioned(
                    left: 60,
                    child: _CircularColor(color: Color(0xff2099f1), index: 2)),
                Positioned(
                    left: 90,
                    child: _CircularColor(color: Color(0xffffad29), index: 1)),
              ],
            ),
          ),
          BotonNaranja(
              texto: 'More realted items',
              alto: 30,
              ancho: 170,
              color: Color(0xffffc675))
        ],
      ),
    );
  }
}

class _CircularColor extends StatelessWidget {
  final Color color;
  final int index;
  const _CircularColor({super.key, required this.color, required this.index});

  @override
  Widget build(BuildContext context) {
    final zapatoProvider = Provider.of<ProviderZapato>(context);

    return GestureDetector(
      onTap: () {
        if (index == 4) {
          zapatoProvider.cambioassetImage = "assets/verde.png";
        }
        if (index == 3) {
          zapatoProvider.cambioassetImage = "assets/negro.png";
        }
        if (index == 2) {
          zapatoProvider.cambioassetImage = "assets/azul.png";
        }
        if (index == 1) {
          zapatoProvider.cambioassetImage = "assets/amarillo.png";
        }
      },
      child: FadeInLeft(
        delay: Duration(milliseconds: index * 100),
        duration: const Duration(milliseconds: 300),
        child: Container(
          width: 45,
          height: 45,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
      ),
    );
  }
}

class _BotonLikeCart extends StatelessWidget {
  const _BotonLikeCart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 30),
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          _BotonDemas(Icon(
            Icons.favorite,
            color: Colors.red,
            size: 20,
          )),
          _BotonDemas(
            Icon(
              Icons.add_shopping_cart,
              color: Color.fromARGB(255, 158, 158, 158),
              size: 20,
            ),
          ),
          _BotonDemas(Icon(
            Icons.settings,
            color: Color.fromARGB(255, 158, 158, 158),
            size: 20,
          ))
        ],
      ),
    );
  }
}

class _BotonDemas extends StatelessWidget {
  final Icon icon;
  const _BotonDemas(
    this.icon,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      child: icon,
      width: 55,
      height: 55,
      decoration: const BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
                color: Colors.black12,
                spreadRadius: -5,
                blurRadius: 20,
                offset: Offset(0, 10))
          ]),
    );
  }
}
