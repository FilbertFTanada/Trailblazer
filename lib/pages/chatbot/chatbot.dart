import 'package:Trailblazer_Flutter/pages/chatbot/message_screen.dart';
import 'package:dialog_flowtter/dialog_flowtter.dart';
import 'package:flutter/material.dart';

class Chatbot extends StatefulWidget {
  const Chatbot({super.key});

  @override
  State<Chatbot> createState() => _ChatbotState();
}

class _ChatbotState extends State<Chatbot> {
  late DialogFlowtter dialogFlowtter;
  final TextEditingController controller = TextEditingController();
  List<Map<String, dynamic>> messages = [];

  @override
  void initState() {
    super.initState();
    DialogFlowtter.fromFile().then((instance) => dialogFlowtter = instance);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chatbot"),
        titleTextStyle: TextStyle(color: Colors.white, fontSize: 24),
        centerTitle: true,
        backgroundColor: Colors.black87,
        foregroundColor: Colors.white,
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/Logo.png'),
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ),
                  message_screen(messages: messages),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 8),
              color: Colors.black87,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: TextField(
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontFamily: 'Sora'),
                      controller: controller,
                      decoration: InputDecoration(
                          label: Text("Ketikan Pesan Anda"),
                          contentPadding:
                              EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          focusedBorder: UnderlineInputBorder(
                              // borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(
                                  color: Colors.white, strokeAlign: 1))),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: IconButton(
                      onPressed: () {
                        sendMessage(controller.text);
                        controller.clear();
                      },
                      icon: Icon(Icons.send),
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  sendMessage(String text) async {
    if (text.isEmpty) {
      print("Message is Empty");
    } else {
      setState(() {
        addMessage(
          Message(text: DialogText(text: [text])),
          true,
        );
      });
      DetectIntentResponse response = await dialogFlowtter.detectIntent(
          queryInput: QueryInput(text: TextInput(text: text)));

      if (response.queryResult == null ||
          response.queryResult!.fulfillmentMessages == null) {
        return;
      } else {
        var fulfillmentMessages = response.queryResult!.fulfillmentMessages;

        for (var msg in fulfillmentMessages!) {
          if (msg.text != null && msg.text!.text != null) {
            setState(() {
              addMessage(Message(text: DialogText(text: msg.text!.text)));
            });
          } else if (msg.payload != null &&
              msg.payload!["richContent"] != null) {
            for (var content in msg.payload!["richContent"]) {
              for (var item in content) {
                if (item["type"] == "image" && item["rawUrl"] != null) {
                  setState(() {
                    addMessage(Message(payload: {"imageUrl": item["rawUrl"]}));
                  });
                }
              }
            }
          }
        }
      }
    }
  }

  addMessage(Message message, [bool isUserMessage = false]) {
    messages.add({"message": message, "isUserMessage": isUserMessage});
  }
}
