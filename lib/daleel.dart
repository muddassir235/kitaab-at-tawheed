import 'package:flutter/material.dart';
import 'package:kitaab_at_tawheed/richertext.dart';

class Daleel extends StatelessWidget {
  final Map<String, String> daleelInVariousLanguages;

  Daleel(this.daleelInVariousLanguages);

  @override
  Widget build(BuildContext context) {
    Map<String, TextStyle> patterns = {
      "«([^/»(*)«/]*)»": TextStyle(color: Colors.red),
      "﴿([^/﴾(*)﴿/]*)﴾": TextStyle(color: Colors.blue),
      "رضي الله عنه": TextStyle(color: Colors.grey),
      "رضي الله عنها": TextStyle(color: Colors.grey),
      "رضي الله عنهما": TextStyle(color: Colors.grey)
    };

    return Container(
        padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 42,
              padding: EdgeInsets.fromLTRB(14, 2, 0, 0),
              alignment: Alignment.topLeft,
              child: Text(
                "⁘",
                style: TextStyle(fontSize: 17, color: Colors.grey),
              ),
            ),
            Expanded(
                child: RicherText(this.daleelInVariousLanguages['original'] as String, patterns, TextStyle(color: Colors.black))
            ),
          ],
        )
    );
  }
}