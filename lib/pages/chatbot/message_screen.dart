import 'package:flutter/material.dart';

class message_screen extends StatefulWidget {
  final List<Map<String, dynamic>> messages;
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
          bool isUserMessage = widget.messages[index]["isUserMessage"];
          var message = widget.messages[index]["message"];

          return Container(
            margin: isUserMessage
                ? EdgeInsets.symmetric(horizontal: 8, vertical: 14)
                : EdgeInsets.symmetric(horizontal: 8, vertical: 0),
            child: Row(
              mainAxisAlignment: isUserMessage
                  ? MainAxisAlignment.end
                  : MainAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 14, vertical: 14),
                  decoration: BoxDecoration(
                      color: isUserMessage
                          ? Colors.blueGrey.withOpacity(0.8)
                          : Colors.green.withOpacity(0.8),
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                          topRight: isUserMessage
                              ? Radius.circular(0)
                              : Radius.circular(20),
                          topLeft: isUserMessage
                              ? Radius.circular(20)
                              : Radius.circular(0))),
                  constraints: BoxConstraints(maxWidth: width * 2 / 3),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (message.text != null && message.text!.text.isNotEmpty)
                        Text(
                          message.text!.text[0],
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: "Sora",
                              fontSize: 14,
                              fontWeight: FontWeight.w600),
                        ),
                      if (message.payload != null &&
                          message.payload!["imageUrl"] != null)
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                            message.payload!["imageUrl"],
                            width: 200,
                            height: 200,
                            fit: BoxFit.cover,
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
        separatorBuilder: (context, index) =>
            Padding(padding: EdgeInsets.only(top: 10)),
        itemCount: widget.messages.length);
  }
}
