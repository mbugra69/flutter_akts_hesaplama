import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

import '../constants/uygulama_sabitleri.dart';
import '../helper/data_helper.dart';

class HarfDropDown extends StatefulWidget {
  final Function onHarfSecildi;
  const HarfDropDown({Key? key, required this.onHarfSecildi}) : super(key: key);
  

  @override
  State<HarfDropDown> createState() => _HarfDropDownState();
}

class _HarfDropDownState extends State<HarfDropDown> {
  double secilenDeger = 4;
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
        value: secilenDeger,
        elevation: 16,
        iconEnabledColor: Sabitler.anaRenk.shade400,
        onChanged: (deger){
          setState(() {
            secilenDeger = deger!;
            widget.onHarfSecildi(secilenDeger);
          });
        },
        underline: Container(),
        items: DataHelper.tumDerslerinHarfleri(),
      ),
    );
  }
}