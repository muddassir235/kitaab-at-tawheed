import 'package:flutter/material.dart';

class Daleel extends StatelessWidget {
  final Map<String, String> daleelInVariousLanguages;

  Daleel(this.daleelInVariousLanguages);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 0),
        child: Text(daleelInVariousLanguages['original'] ?? "")
    );
  }
}