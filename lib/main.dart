import 'package:flutter/material.dart';
import 'package:flutter_akts_hesaplama/widgets/ortalama_hesapla.dart';

import 'constants/uygulama_sabitleri.dart';


void main(List<String> args) {

  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Üniversite AKTS Hesaplama',
        theme: ThemeData(
          primarySwatch: Sabitler.anaRenk,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
        home: OrtalamaHesapla(

        ),
    );
  }
}