import 'package:flutter/material.dart';

import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:uuid/uuid.dart';

final user = types.User(
  id: 'user-manu-dev',
  firstName: 'Manuel',
  lastName: 'Lopez',
  imageUrl: 'https://picsum.photos/id/177/200/200'
);

final userGemini = types.User(
  id: 'gemini-user-app',
  firstName: 'Gemini',
  lastName: 'App',
  imageUrl: 'https://picsum.photos/id/79/200/200'
);

final messages = <types.Message>[
  types.TextMessage(author: user, id: Uuid().v4(), text: 'Hola que hace'),
  types.TextMessage(author: userGemini, id: Uuid().v4(), text: 'Hola que hace X2'),
];

class BasicPromptScreen extends StatelessWidget {

  static String path = '/basic-prompt';

  const BasicPromptScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( title: const Text('Prompt basico'),),
      body  : Chat(
        messages        : messages,
        onSendPressed   : ( types.PartialText partialText) {}, 
        user            : user,
        theme           : DarkChatTheme(),
        showUserAvatars : true,
        showUserNames   : true,
        typingIndicatorOptions: TypingIndicatorOptions(
          // typingUsers: [ userGemini ],
        ),
      )
    );
  }
}