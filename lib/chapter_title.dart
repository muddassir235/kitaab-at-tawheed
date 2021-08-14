import 'package:flutter/material.dart';

class ChapterTitle extends StatelessWidget {
  final Map<String, String> titleInVariousLanguages;

  ChapterTitle(this.titleInVariousLanguages);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 0),
            child: Text(titleInVariousLanguages['original'] ?? "", textAlign: TextAlign.justify,),
          )
        ],
      ),
    );
  }
}