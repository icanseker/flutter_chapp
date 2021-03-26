import 'package:flutter/material.dart';

class HorizontalDivider extends StatelessWidget {
  final String label;

  HorizontalDivider(this.label);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: new Container(
            margin: const EdgeInsets.only(left: 10.0, right: 10.0),
            child: Divider(color: Colors.black45, height: 36),
          ),
        ),
        Text(label,
            style:
                TextStyle(color: Colors.black54, fontWeight: FontWeight.w600)),
        Expanded(
          child: new Container(
            margin: const EdgeInsets.only(left: 10.0, right: 10.0),
            child: Divider(color: Colors.black45, height: 36),
          ),
        ),
      ],
    );
  }
}
