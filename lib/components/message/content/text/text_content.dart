import 'package:flutter/material.dart';

class TextContent extends StatelessWidget {
  final String text;
  final double fontSize;

  const TextContent({Key key, @required this.text, this.fontSize = 16})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      this.text,
      style: TextStyle(
        fontSize: this.fontSize,
      ),
    );
  }
}
