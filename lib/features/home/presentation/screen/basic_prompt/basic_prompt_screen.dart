import 'package:flutter/material.dart';

import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:gemini_app/features/home/presentation/chat/chat.dart';
import 'package:gemini_app/features/home/presentation/providers/providers.dart';
import 'package:uuid/uuid.dart';

class BasicPromptScreen extends StatelessWidget {

  static String path = '/basic-prompt';

  const BasicPromptScreen({super.key});

  @override
  Widget build( BuildContext context ) {

    return Scaffold(
      appBar: AppBar( title: const Text('Prompt basico'),),
      body  : Consumer(
        builder: (context, ref, child) {

          final userGemini = ref.watch( geminiUserProvider );
          final isGeminiWriting = ref.watch(isGeminiWritingProvider);

          final messages = <types.Message>[
            types.TextMessage(author: userGemini, id: Uuid().v4(), text: 'Hola que hace X2'),
          ];

          return Chat(
            messages        : messages,
            onSendPressed   : ( types.PartialText partialText) {}, 
            user            : ref.watch( normalUserProvider ),
            theme           : DarkChatTheme(),
            showUserAvatars : true,
            showUserNames   : true,
            typingIndicatorOptions: TypingIndicatorOptions(
              typingUsers: isGeminiWriting ? [ userGemini ] : [],
            ),
          );
        },
      )
    );
  }
}