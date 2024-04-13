import 'package:flutter/material.dart';

class ProviderZapato with ChangeNotifier {
  String _assetImage = "assets/azul.png";
  double _talla = 9.0;
  String get assetImage => this._assetImage;
  double get talla => this._talla;
  set cambioassetImage(String valor) {
    this._assetImage = valor;
    notifyListeners();
  }

  set cambiotalla(double valor) {
    this._talla = valor;
    notifyListeners();
  }
}
