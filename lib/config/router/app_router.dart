import 'package:go_router/go_router.dart';

import 'package:gemini_app/features/home/config/routes/routes.dart';

final appRouter =  GoRouter(
  routes: [
    homeRoute,
    basicPromptRoute,
    chatContexttRoute,
  ]
);