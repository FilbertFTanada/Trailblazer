// ignore_for_file: prefer_const_constructors
import 'package:Trailblazer_Flutter/pages/onboarding/onboarding.dart';
import 'package:Trailblazer_Flutter/util/languageprov.dart';
import 'package:Trailblazer_Flutter/util/paymentprov.dart';
import 'package:Trailblazer_Flutter/util/settingnotifprov.dart';
import 'package:Trailblazer_Flutter/util/notifprov.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:Trailblazer_Flutter/util/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CoffeeNewProvider()),
        ChangeNotifierProvider(create: (_) => NotificationProvider()),
        ChangeNotifierProvider(create: (_) => LanguageProvider()),
        ChangeNotifierProvider(create: (context) => PaymentProvider()),
        ChangeNotifierProvider(create: (_) => PurchaseMessageProvider())
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        home: Onboarding(),
        theme: ThemeData(
          brightness: Brightness.light,
          useMaterial3: true,
        ),
      ),
    );
  }
}
