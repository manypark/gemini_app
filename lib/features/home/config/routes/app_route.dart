import 'package:gemini_app/features/home/presentation/screen/chat_context/chat_context_screen.dart';
import 'package:gemini_app/features/home/presentation/screen/image/image_playground_screen.dart';
import 'package:go_router/go_router.dart';

import 'package:gemini_app/features/home/presentation/screen/home/home_screen.dart';
import 'package:gemini_app/features/home/presentation/screen/basic_prompt/basic_prompt_screen.dart';

final homeRoute = GoRoute(
  path: HomeScreen.path,
  name: HomeScreen.path,
  builder: (context, state) => const HomeScreen(),
);

final basicPromptRoute = GoRoute(
  path: BasicPromptScreen.path,
  name: BasicPromptScreen.path,
  builder: (context, state) => const BasicPromptScreen(),
);

final chatContexttRoute = GoRoute(
  path: ChatContextScreen.path,
  name: ChatContextScreen.path,
  builder: (context, state) => const ChatContextScreen(),
);

final imagePlaygroundRoute = GoRoute(
  path: ImagePlaygroundScreen.path,
  name: ImagePlaygroundScreen.path,
  builder: (context, state) => const ImagePlaygroundScreen(),
);