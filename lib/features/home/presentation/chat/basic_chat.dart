import 'package:gemini_app/features/home/presentation/providers/user_providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:uuid/uuid.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart';
import 'package:gemini_app/features/home/presentation/chat/chat.dart';

part 'basic_chat.g.dart';

@riverpod
class BasicChat extends _$BasicChat {
  @override
  List<Message> build() {
    return [];
  }

  void addMessage({
    required PartialText partialText,
    required User user,
  }) {

    _addTextMessage( partialText, user );
  }

  void _addTextMessage( PartialText partialText, User user ) {

    final message = TextMessage(
      id        : Uuid().v4(), 
      author    : user, 
      text      : partialText.text,
      createdAt : DateTime.now().millisecondsSinceEpoch,
    );

    state = [ message, ...state ];
    _geminiTextResponse( partialText.text );
  }

  void _geminiTextResponse( String prompt ) async {

    ref.read( isGeminiWritingProvider.notifier).setIsWriting();

    await Future.delayed( Duration( seconds : 2 ) );

    ref.read( isGeminiWritingProvider.notifier).setIsNoWriting();

    final message = TextMessage(
      id        : Uuid().v4(), 
      author    : ref.read( geminiUserProvider ), 
      text      : 'Hola, soy Gemini en que te ayudo?',
      createdAt : DateTime.now().millisecondsSinceEpoch,
    );

    state = [ message, ...state ];    

  }

}