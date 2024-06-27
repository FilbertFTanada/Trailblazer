import 'package:flutter/material.dart';

class ProfScreen extends StatefulWidget {
  const ProfScreen({super.key});

  @override
  State<ProfScreen> createState() => _NotifScreenState();
}

class _NotifScreenState extends State<ProfScreen> {

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Prof"),
    );
  }
}