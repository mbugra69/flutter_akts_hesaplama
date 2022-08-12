import 'package:flutter/material.dart';

import '../constants/uygulama_sabitleri.dart';
import '../helper/data_helper.dart';
import '../model/ders.dart';

class DersListesi extends StatelessWidget {
  final Function onDisMiss;
  
  const DersListesi({Key? key, required this.onDisMiss,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Ders> tumDersler = DataHelper.tumEklenenDersler;

     
     
      return tumDersler.length > 0 ? ListView.builder(itemCount: tumDersler.length, itemBuilder: (context, index){
          return Dismissible(
            key: UniqueKey(),
            direction: DismissDirection.startToEnd,
            onDismissed: (a){
              onDisMiss(index);
            },
            child: Padding(
              padding: const EdgeInsets.all(3.0),
              child: Card(
                  child: ListTile(
                    title: Text(tumDersler[index].ad),
                    leading: CircleAvatar(
                      radius: 30,
                      backgroundColor: Sabitler.anaRenk,
                      child: Text(
                        tumDersler[index].harfDegeri.toString()
                      ),
                    ),
                    subtitle: Text('${tumDersler[index].krediDegeri} Kredi, Not Değeri ${tumDersler[index].harfDegeri}'),
                  ),
              ),
            ),
          );
      }) : Container(
        child: Center(child: Text('Lütfen ders ekleyiniz.',style: Sabitler.harflerStyle,)));
  }
}