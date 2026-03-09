import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:gemini_app/features/home/presentation/screen/basic_prompt/basic_prompt_screen.dart';

class HomeScreen extends StatelessWidget {

  static String path = '/';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( title: const Text('Home Screen'),),
      body  : ListView(
        children: [
          ListTile(
            leading: const CircleAvatar(
              backgroundColor: Colors.pink,
              child: Icon( Icons.percent_outlined ),
            ),
            title   : const Text('Prompt básico a Gemini'),
            subtitle: const Text('Usando el modelo flash'),
            onTap   : () => context.push( BasicPromptScreen.path ),
          )
        ],
      )
    );
  }
}