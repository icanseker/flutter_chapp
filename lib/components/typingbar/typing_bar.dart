import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class TypingBar extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _TypingBarState();
  }
}

class _TypingBarState extends State<TypingBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black12,
        border: Border(
          top: BorderSide(
            width: 1.0,
            color: Colors.black38,
          ),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              PopupMenuButton(
                icon: IconButton(
                  padding: EdgeInsets.all(0),
                  icon: Icon(Ionicons.add_outline),
                  iconSize: 24,
                  color: Colors.black,
                  onPressed: () {},
                ),
                itemBuilder: (BuildContext context) => [
                  PopupMenuItem(
                    child: Icon(Ionicons.image_outline),
                  ),
                ],
              ),
            ],
          ),
          Flexible(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  child: TextField(
                    keyboardType: TextInputType.multiline,
                    minLines: 1,
                    maxLines: 5,
                    decoration: InputDecoration(
                      labelText: 'Type a message...',
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                children: [
                  Container(
                    width: 36,
                    height: 36,
                    child: IconButton(
                      padding: EdgeInsets.all(0),
                      icon: Icon(Ionicons.camera_outline),
                      iconSize: 24,
                      color: Colors.black,
                      onPressed: () {},
                    ),
                  ),
                  Container(
                    width: 36,
                    height: 36,
                    child: IconButton(
                      padding: EdgeInsets.all(0),
                      icon: Icon(Ionicons.mic_outline),
                      iconSize: 24,
                      color: Colors.black,
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
