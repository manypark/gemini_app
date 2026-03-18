import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:flutter_chat_types/flutter_chat_types.dart';

part 'user_providers.g.dart';

@riverpod
User geminiUser( Ref ref ) {
  return User(
    id        : 'gemini-user-app',
    firstName : 'Gemini',
    lastName  : 'App',
    imageUrl  : 'https://picsum.photos/id/79/200/200'
  );
}

@riverpod
User normalUser( Ref ref ) {
  return User(
    id        : 'user-manu-dev',
    firstName : 'Manuel',
    lastName  : 'Lopez',
    imageUrl  : 'https://picsum.photos/id/177/200/200',
  );
}