import 'package:flutter/material.dart';
import 'package:flutter_akts_hesaplama/widgets/harf_dropdown_widget.dart';
import 'package:flutter_akts_hesaplama/widgets/kredi_dropdown_widget.dart';
import 'package:flutter_akts_hesaplama/widgets/ortalama_goster.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/uygulama_sabitleri.dart';
import '../helper/data_helper.dart';
import '../model/ders.dart';
import 'ders_listesi.dart';

class OrtalamaHesapla extends StatefulWidget {
  const OrtalamaHesapla({Key? key}) : super(key: key);

  @override
  State<OrtalamaHesapla> createState() => _OrtalamaHesaplaState();
}

class _OrtalamaHesaplaState extends State<OrtalamaHesapla> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
   double secilenDeger = 4;
   double secilenKredi = 1;
   String girilenDersAdi = "";
   String girilenHarfAdi = "";
  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
     
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        shape: RoundedRectangleBorder(

                      borderRadius:  BorderRadius.only(

                                                bottomRight: Radius.circular(40),

                                                bottomLeft: Radius.circular(40))

                                                     ),
        title:Center(child: Text(Sabitler.baslik, style:Sabitler.baslikStyle)),

      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
       Row(children: [
          Expanded(
            flex:2,
           child: Container(
            child: _buildForm(),
     
                 ),
         ),
         Expanded(
           flex:1,
           child: OrtalamaGoster(ortalama: DataHelper.ortalamaHesapla(), dersSayisi: DataHelper.tumEklenenDersler.length),
         ),

       ],
       ),
         Expanded(
            child: DersListesi(
              onDisMiss: (index){
                DataHelper.tumEklenenDersler.removeAt(index);
                
                setState(() {
                  
                });
              },
            ),
         ),
      ],),
    );
  }
  
  Widget _buildForm() 
  {
      return Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Padding(
                padding: Sabitler.yatayPadding12,
                child: _buildTextFormField(),
              ),
              SizedBox(height: 15,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Padding(padding:  Sabitler.yatayPadding12,
                    child:  HarfDropDown(
                      onHarfSecildi: (harf){
                        secilenDeger = harf;
                   }),
                    
                     
                      
                      
                    ),
                  ),
                  
                    Expanded(
                      child: Padding(padding:  Sabitler.yatayPadding12,
                                      child:  KrediDropdown(
                                        onKrediSecildi: (kredi){
                                          secilenKredi = kredi;
                                        },
                                      ),    
                                      ),
                    ),
                     IconButton(
                    onPressed: _dersEkleOrtalamaHesapla , icon: Icon(Icons.forward),
                    color: Sabitler.anaRenk,
                    iconSize: 36,
                    ),
                ],
              ),
            ],
          ),
        ),
      );
  }
  
 Widget _buildTextFormField() {
  return TextFormField(
    onSaved: (deger){
      setState(() {
          girilenDersAdi = deger!;
      });
    },
    validator: (s){
      if(s!.length<= 0){
        return 'Ders giriniz..';
        
      } else 
        return null;
    },
    decoration: InputDecoration(
      hintText: 'Ders adı',
      border: OutlineInputBorder(
        borderRadius: Sabitler.borderRadius,
        borderSide: BorderSide.none,
      ),
      filled:true,
      fillColor:Sabitler.anaRenk.shade100.withOpacity(0.6),
    ),
  );
 }
 

  

  void _dersEkleOrtalamaHesapla(){
      if(formKey.currentState!.validate()){
        formKey.currentState!.save();
        var eklenecekDers = Ders(
          ad: girilenDersAdi,
          harfDegeri: secilenDeger,
          krediDegeri: secilenKredi);
      DataHelper.dersEkle(eklenecekDers);
      setState(() {
        
      });
      }
  }
}