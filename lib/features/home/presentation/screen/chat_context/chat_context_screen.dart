import 'package:flutter/material.dart';
import 'package:gemini_app/features/home/presentation/providers/chat/chat_with_contex.dart';
import 'package:gemini_app/features/home/presentation/widgets/chat/custom_bottom_input.dart';

import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:gemini_app/features/home/presentation/providers/chat/chat.dart';
import 'package:gemini_app/features/home/presentation/providers/providers.dart';

class ChatContextScreen extends StatelessWidget {

  static String path = '/chat-context';

  const ChatContextScreen({super.key});

  @override
  Widget build( BuildContext context ) {

    return Scaffold(
      appBar: AppBar( 
        title   : const Text('Chat conversacional'),
        actions : [
          Consumer(
            builder: (context, ref, child) {
              return IconButton(
                onPressed : () { 
                  ref.read(chatWithContextProvider.notifier).newChat();
                }, 
                icon      : Icon( Icons.clear )
              );
            },
          ),
        ],
      ),
      body  : Consumer(
        builder: (context, ref, child) {
          
          final isGeminiWriting = ref.watch(isGeminiWritingProvider);

          return Chat(
            messages        : ref.watch( chatWithContextProvider ),
            onSendPressed   : ( types.PartialText partialText) {},
            customBottomWidget: CustomBottomInput(
              onSend: ( partialText, { images = const [] } ) {
                ref.read(chatWithContextProvider.notifier).addMessage(
                  partialText : partialText, 
                  user        : ref.read( normalUserProvider ),
                  images      : images
                );
              },
            ),
            user            : ref.watch( normalUserProvider ),
            theme           : DarkChatTheme(),
            showUserAvatars : true,
            showUserNames   : true,
            typingIndicatorOptions: TypingIndicatorOptions(
              typingUsers: isGeminiWriting ? [ ref.watch( geminiUserProvider ) ] : [],
            ),
          );
        },
      )
    );
  }
}