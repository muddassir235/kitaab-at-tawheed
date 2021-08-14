import 'package:flutter/material.dart';
import 'package:kitaab_at_tawheed/chapter_title.dart';
import 'package:kitaab_at_tawheed/daleel.dart';

class Chapter extends StatelessWidget {
  final String number;
  final Map<String, String> title;
  final List<Map<String, String>> content;

  Chapter(this.number, this.title, this.content);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
      child: Column(
        children: [
          Container(
              width: double.infinity,
              alignment: Alignment.centerRight,
              child: ChapterTitle(title),
          ),
          Column(
            children: content.map((daleel) => Daleel(daleel)).toList(),
          )
        ],
      ),
    );
  }
}