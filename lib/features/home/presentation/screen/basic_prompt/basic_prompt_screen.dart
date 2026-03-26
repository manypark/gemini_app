import 'package:flutter/material.dart';
import 'package:gemini_app/features/home/presentation/widgets/chat/custom_bottom_input.dart';
import 'package:image_picker/image_picker.dart';

import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:gemini_app/features/home/presentation/chat/chat.dart';
import 'package:gemini_app/features/home/presentation/providers/providers.dart';

class BasicPromptScreen extends StatelessWidget {

  static String path = '/basic-prompt';

  const BasicPromptScreen({super.key});

  @override
  Widget build( BuildContext context ) {

    return Scaffold(
      appBar: AppBar( title: const Text('Prompt basico'),),
      body  : Consumer(
        builder: (context, ref, child) {
          
          final isGeminiWriting = ref.watch(isGeminiWritingProvider);

          return Chat(
            messages        : ref.watch( basicChatProvider ),
            onSendPressed   : ( types.PartialText partialText) {},
            customBottomWidget: CustomBottomInput(
              onSend: ( partialText, { images = const [] } ) {
                ref.read(basicChatProvider.notifier).addMessage(
                  partialText : partialText, 
                  user        : ref.read( normalUserProvider ),
                  images: images
                );
              },
            ),
            // onAttachmentPressed: () async {
            //   final ImagePicker picker = ImagePicker();
            //   final List<XFile> images = await picker.pickMultiImage( limit : 4 );
            //   if(images.isEmpty) return;
            // },
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