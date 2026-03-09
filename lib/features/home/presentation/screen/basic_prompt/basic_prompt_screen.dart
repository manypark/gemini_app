import 'package:flutter/material.dart';

class BasicPromptScreen extends StatelessWidget {

  static String path = '/basic-prompt';

  const BasicPromptScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( title: const Text('Basic prompt Screen'),),
      body  : const Center( child: Text('Basic prompt screen'),),
    );
  }
}