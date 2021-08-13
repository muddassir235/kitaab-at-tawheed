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
            padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
            child: Text(titleInVariousLanguages['original'] ?? ""),
          )
        ],
      ),
    );
  }
}