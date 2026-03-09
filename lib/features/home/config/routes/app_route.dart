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