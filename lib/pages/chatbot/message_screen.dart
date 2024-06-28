import 'package:flutter/material.dart';

class message_screen extends StatefulWidget {
  final List messages;
  const message_screen({super.key, required this.messages});

  @override
  State<message_screen> createState() => _message_screenState();
}

class _message_screenState extends State<message_screen> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return ListView.separated(
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.all(8),
            child: Row(
              mainAxisAlignment: widget.messages[index]["isUserMessage"]
                  ? MainAxisAlignment.end
                  : MainAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 14, vertical: 14),
                  decoration: BoxDecoration(
                      color: widget.messages[index]["isUserMessage"]
                          ? Colors.blueGrey.withOpacity(0.8)
                          : Colors.green.withOpacity(0.8),
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                          topRight: widget.messages[index]["isUserMessage"]
                              ? Radius.circular(0)
                              : Radius.circular(20),
                          topLeft: widget.messages[index]["isUserMessage"]
                              ? Radius.circular(20)
                              : Radius.circular(0))),
                  constraints: BoxConstraints(maxWidth: width * 2 / 3),
                  child: Text(
                    widget.messages[index]["message"].text.text[0],
                    style: TextStyle(color: Colors.white, fontFamily: "Sora"),
                  ),
                )
              ],
            ),
          );
        },
        separatorBuilder: (context, index) =>
            Padding(padding: EdgeInsets.only(top: 10)),
        itemCount: widget.messages.length);
  }
}
