import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Sabitler{
  static const yaziRengi = Color.fromARGB(255, 248, 248, 248);
  static const anaRenk = Colors.indigo;
  static const kucukYaziRengi = Color.fromARGB(255, 61, 101, 209);
  static const subRenk = Color.fromARGB(255, 89, 89, 89);
  static const String baslik = 'Üniversite AKTS Hesaplama';
  static final TextStyle baslikStyle = GoogleFonts.kreon(
    fontSize:24, fontWeight: FontWeight.bold, color: yaziRengi
  );

  static final TextStyle dersSayisiStyle = GoogleFonts.kreon(
    fontSize:18, color:subRenk 
  );

  static final TextStyle ortalamaStyle = GoogleFonts.kreon(
    fontSize:32, fontWeight: FontWeight.bold, color: kucukYaziRengi
  );
   static final TextStyle harflerStyle = GoogleFonts.kreon(
    fontSize:24, color: Color.fromARGB(255, 8, 18, 74), fontWeight: FontWeight.bold,
  );

  static final dropDownPadding = EdgeInsets.symmetric(horizontal:16, vertical: 8);
  static final yatayPadding12 = EdgeInsets.symmetric(horizontal: 12);
  static BorderRadius borderRadius = BorderRadius.circular(24);
}