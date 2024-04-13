import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shope_zapatos/models/zapato_model.dart';
import 'package:shope_zapatos/pages/zapatos_page.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ProviderZapato()),
   
      ],
      child: MyApp(),
    ),
  );
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Shope Zapatos',
        home: ZapatoPage());
  }
}
