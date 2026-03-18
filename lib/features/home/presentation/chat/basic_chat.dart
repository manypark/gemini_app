import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:uuid/uuid.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart';

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
  }

}