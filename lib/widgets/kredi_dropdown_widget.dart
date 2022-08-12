import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../constants/uygulama_sabitleri.dart';
import '../helper/data_helper.dart';

class KrediDropdown extends StatefulWidget {
  final onKrediSecildi;
  const KrediDropdown({Key? key, required this.onKrediSecildi}) : super(key: key);

  @override
  State<KrediDropdown> createState() => _KrediDropdownState();
}

class _KrediDropdownState extends State<KrediDropdown> {
  double secilenKredi = 1;
  @override
  Widget build(BuildContext context) {
      return Container(
      alignment: Alignment.center,
      padding: Sabitler.dropDownPadding,
      decoration: BoxDecoration(
        color: Sabitler.anaRenk.shade100.withOpacity(0.3),
        borderRadius: Sabitler.borderRadius,
      ),
      child: DropdownButton<double>(
        value: secilenKredi,
        elevation: 16,
        iconEnabledColor: Sabitler.anaRenk.shade400,
        onChanged: (deger){
          setState(() {
            secilenKredi = deger!;
            widget.onKrediSecildi(secilenKredi);
          });
        },
        underline: Container(),
        items: DataHelper.tumDerslerinKredileriniGetir(),
      ),
    );
  }
}