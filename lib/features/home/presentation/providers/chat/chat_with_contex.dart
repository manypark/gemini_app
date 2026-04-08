import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:gemini_app/config/gemini/gemini_impl.dart';
import 'package:gemini_app/features/home/presentation/providers/user_providers.dart';

part 'chat_with_contex.g.dart';

@Riverpod( keepAlive : true )
class ChatWithContext extends _$ChatWithContext {

  final gemini = GeminiImpl();
  late String chatId;

  @override
  List<Message> build() {
    chatId = Uuid().v4();
    return [];
  }

  void addMessage({
    required PartialText partialText,
    required User user,
    List<XFile> images = const [],
  }) {
    if(images.isNotEmpty) {
      _addTextMessagewithImages( partialText, user, images );
      return;
    }
    _addTextMessage( partialText, user );
  }

  void _addTextMessage( PartialText partialText, User user ) {
    _createTextMessage( partialText.text, user );
    _geminiTextResponseStream( partialText.text );
  }

  void _addTextMessagewithImages( PartialText partialText, User user, List<XFile> images ) async {

    for ( XFile image in images) {
      _createImageMessage( image, user );
    }

    await Future.delayed( Duration( milliseconds: 10 ) );
    
    _createTextMessage( partialText.text, user );
    _geminiTextResponseStream( partialText.text, images:images );
  }

  void _geminiTextResponseStream( String prompt, {List<XFile> images = const []}) async {
    _createTextMessage( 'Gemini esta pensando...', ref.read( geminiUserProvider ) );

    gemini.getChstResponseStream(prompt, chatId, files:images).listen( (responseChunk) {
      if( responseChunk.isEmpty ) return;

      final updatedMessages = [ ...state ];
      final updatedMessage = ( updatedMessages.first as TextMessage ).copyWith( text : responseChunk );

      updatedMessages[0] = updatedMessage;
      state = updatedMessages;
    });
  }

  // Helper methods

  void newChat() {
    chatId = Uuid().v4();
    state = [];
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

  void _createImageMessage( XFile image, User author ) async {
    final message = ImageMessage(
      id        : Uuid().v4(), 
      author    : author,
      createdAt : DateTime.now().millisecondsSinceEpoch,
      uri: image.path,
      name: image.name,
      size: await image.length()
    );

    state = [ message, ...state ];
  }
}