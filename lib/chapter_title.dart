import 'package:flutter/material.dart';

class ChapterTitle extends StatelessWidget {
  final VoidCallback onShare;
  final String chapterNumber;
  final Map<String, String> titleInVariousLanguages;

  ChapterTitle(this.onShare, this.chapterNumber, this.titleInVariousLanguages);

  @override
  Widget build(BuildContext context) {
    return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 42,
            padding: EdgeInsets.fromLTRB(17, 11, 0, 0),
            alignment: Alignment.centerLeft,
            child: Text(
              this.chapterNumber,
              textAlign: TextAlign.left,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xff4ea200)),
            ),
          ),
          Expanded(
              child: Container(
                alignment: Alignment.centerRight,
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                      child: Text(
                        titleInVariousLanguages['original'] ?? "",
                        textAlign: TextAlign.justify,
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
              )
          ),
          Container(
              width: 24,
              padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
              child:IconButton(
                  padding: EdgeInsets.zero,
                  onPressed: this.onShare,
                  icon: Image.asset("images/share.png")
              )
          )
        ]
    );
  }
}