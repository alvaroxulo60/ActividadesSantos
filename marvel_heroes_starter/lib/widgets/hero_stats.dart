import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:marvel_heroes/l10n/app_localizations.dart';

class HeroStats extends StatelessWidget{

  int power;
  int intelligence;

   HeroStats({super.key, required this.power, required this.intelligence});


  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    return Row(
      mainAxisAlignment: .spaceEvenly,
      children: [
        Chip(label: Text("${t.power}: $power")),
        Chip(label: Text("${t.intelligence}: $intelligence"))
      ],
    );
  }
}