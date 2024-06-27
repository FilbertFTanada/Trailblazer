import 'package:Trailblazer_Flutter/pages/chatbot/chatbot.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:Trailblazer_Flutter/util/ProfileProvider.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    final notif = Provider.of<NotificationProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.grey, width: 1),
                    ),
                    child: ClipOval(
                      child: Image.network(
                        "https://img.freepik.com/free-photo/side-view-unknown-man-posing_23-2149417555.jpg?size=626&ext=jpg&ga=GA1.1.1152997229.1709223401&semt=ais",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'John Doe',
                        style: TextStyle(fontSize: 18),
                      ),
                      Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          border: Border.all(color: Colors.grey, width: 1),
                        ),
                        child: Text(
                          'Silver',
                          style: TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              const Text(
                'Notifications',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              ..._buildSwitchListTiles(notif),
              const SizedBox(
                height: 30,
              ),
              const Text(
                'Language',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              ..._buildDropdownButtonsLang(),
              const SizedBox(
                height: 30,
              ),
              const Text(
                'Payment Method',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              ..._buildDropdownButtonsPayment(),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => Chatbot()));
        },
        backgroundColor: Colors.orange,
        shape: CircleBorder(),
        child: const Icon(Icons.support_agent_sharp),
      ),
    );
  }

  List<Widget> _buildSwitchListTiles(NotificationProvider notif) {
    return [
      SwitchListTile(
        value: notif.Selected == 0,
        onChanged: (val) {
          setState(() {
            if (val) {
              notif.choice(0);
            } else {
              notif.choice(1);
            }
          });
        },
        title: const Text("All"),
        subtitle: const Text("Receive notifications for all orders"),
        activeColor: Colors.orange,
      ),
      SwitchListTile(
        value: notif.Selected == 1,
        onChanged: (val) {
          setState(() {
            if (val) {
              notif.choice(1);
            } else {
              notif.choice(0);
            }
          });
        },
        title: const Text("Order updates"),
        subtitle: const Text(
            "Get notified when an order is prepared or ready for pickup"),
        activeColor: Colors.orange,
      ),
      SwitchListTile(
        value: notif.Selected == 2,
        onChanged: (val) {
          setState(() {
            if (val) {
              notif.choice(2);
            } else {
              notif.choice(0);
            }
          });
        },
        title: const Text("Promotions"),
        subtitle:
            const Text("Receive notifications about promotions and discounts"),
        activeColor: Colors.orange,
      ),
    ];
  }

  List<Widget> _buildDropdownButtonsLang() {
    return [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Text('Language'),
          ),
          Consumer<LanguageProvider>(
            builder: (context, langProvider, child) {
              return DropdownButton<String>(
                isDense: true,
                padding: EdgeInsets.only(right: 30),
                value: langProvider.Selected,
                items: langProvider.options.map((lang) {
                  return DropdownMenuItem<String>(
                    value: lang,
                    child: Text(lang),
                  );
                }).toList(),
                onChanged: (value) {
                  langProvider.choice(value);
                },
              );
            },
          ),
        ],
      ),
    ];
  }

  List<Widget> _buildDropdownButtonsPayment() {
    return [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Text('Payment Method'),
          ),
          Consumer<PaymentProvider>(
            builder: (context, paymentProvider, child) {
              return DropdownButton<String>(
                isDense: true,
                padding: EdgeInsets.only(right: 30),
                value: paymentProvider.Selected,
                items: paymentProvider.options.map((payment) {
                  return DropdownMenuItem<String>(
                    value: payment,
                    child: Text(payment),
                  );
                }).toList(),
                onChanged: (value) {
                  paymentProvider.choice(value);
                },
              );
            },
          ),
        ],
      ),
    ];
  }
}
