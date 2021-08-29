import 'package:flutter/material.dart';

class RicherText extends StatelessWidget {
  final String text;
  final Map<String, TextStyle> patterns;
  final TextStyle defaultTextStyle;

  RicherText(this.text, this.patterns, this.defaultTextStyle);

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.justify,
      text: TextSpan(
        children: getParts(text, patterns.keys.toList()).map((part) =>
            TextSpan(
                text: part.a,
                style: part.b == "" ? defaultTextStyle : patterns[part.b])
        ).toList()
      )
    );
  }

  List<Pair<String, String>> getParts(String text, List<String> patterns) {
    List<Pair<String, String>> parts = [Pair(text, "")];

    for(var pattern in patterns) {
      List<Pair<String, String>> currParts = List<Pair<String, String>>.from(parts);
      currParts.asMap().forEach((index, part) {
        if(part.b == "") {
          var split = getPartsForRegex(part.a, pattern).map((split) =>
              Pair(split.a, (split.b ? pattern : "")));
          parts.removeAt(index);
          parts.insertAll(index, split);
        }
      });
    }

    return parts;
  }

  List<Pair<String, bool>> getPartsForRegex(String text, String regex) {
    RegExp regexExp = RegExp(regex);
    List<Pair<String, bool>> parts = [];
    List<RegExpMatch> matches = regexExp.allMatches(text).toList();
    var tuples = matches.take2((prev, next) {
      return Pair(prev, next);
    });

    if(matches.isEmpty) {
      return [Pair(text, false)];
    } else if (matches.length == 1) {
      parts.add(Pair(text.substring(0, matches.first.start), false));
      parts.add(Pair(text.substring(matches.first.start, matches.first.end), true));
      parts.add(Pair(text.substring(matches.first.end, text.length), false));
      return parts;
    }

    if(matches.first.start > 0) {
      parts.add(Pair(text.substring(0, matches.first.start), false));
    }

    tuples.forEach((pair) {
      parts.add(Pair(text.substring(pair.a.start, pair.a.end), true));
      parts.add(Pair(text.substring(pair.a.end, pair.b.start), false));
      parts.add(Pair(text.substring(pair.b.start, pair.b.end), true));
    });

    return parts;
  }
}

extension Take2<T> on List<T> {
  List<R> take2<R>(R Function(T, T) transform) => [
    for (int i = 0; i < this.length - 1; i += 2)
      transform(this[i], this[i + 1]),
  ];
}

class Pair<T1, T2> {
  final T1 a;
  final T2 b;

  Pair(this.a, this.b);
}