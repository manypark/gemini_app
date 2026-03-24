import 'package:uuid/uuid.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:gemini_app/config/gemini/gemini_impl.dart';
import 'package:gemini_app/features/home/presentation/chat/chat.dart';
import 'package:gemini_app/features/home/presentation/providers/user_providers.dart';

part 'basic_chat.g.dart';

@riverpod
class BasicChat extends _$BasicChat {

  final gemini = GeminiImpl();

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
    _createTextMessage( partialText.text, user );
    _geminiTextResponseStream( partialText.text );
  }

  void _geminiTextResponse( String prompt ) async {
    _setGeminiWritingStatus(true);
    final textResponse = await gemini.getPromptResponse(prompt);
    _setGeminiWritingStatus(false);
    _createTextMessage( textResponse, ref.read( geminiUserProvider ) );
  }

  void _geminiTextResponseStream( String prompt ) async {
    _createTextMessage( 'Gemini esta pensando...', ref.read( geminiUserProvider ) );

    gemini.getResponseStream(prompt).listen( (responseChunk) {
      if( responseChunk.isEmpty ) return;

      final updatedMessages = [ ...state ];
      final updatedMessage = ( updatedMessages.first as TextMessage ).copyWith( text : responseChunk );

      updatedMessages[0] = updatedMessage;
      state = updatedMessages;
    });

    // _createTextMessage( textResponse, ref.read( geminiUserProvider ) );
  }

  void _setGeminiWritingStatus( bool isWriting ) {
    final isGeminiWriting = ref.read( isGeminiWritingProvider.notifier);
    isWriting ? isGeminiWriting.setIsWriting() : isGeminiWriting.setIsNoWriting();
  }

  void _createTextMessage( String text, User author) {
    
    final message = TextMessage(
      id        : Uuid().v4(), 
      author    : author,
      text      : text,
      createdAt : DateTime.now().millisecondsSinceEpoch,
    );

    state = [ message, ...state ];
  }

}