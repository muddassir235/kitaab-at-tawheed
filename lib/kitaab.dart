import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kitaab_at_tawheed/chapter.dart';
import 'package:kitaab_at_tawheed/text_content.dart';

class Kitaab extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return KitaabWidget();
  }
}

class KitaabWidget extends State<Kitaab> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListView(
          children: [...chapters.map(
                  (chapter) => Chapter(
                  chapter['number'] as String,
                  chapter['title'] as Map<String, String>,
                  chapter['content'] as List<Map<String, String>>
              )
          ).toList(),
            Container(
              height: 212,
              padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
              child: Text(
                bottom_pattern,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 17, color: Colors.grey),
              ),
            )
          ],
        )
    );
  }
}