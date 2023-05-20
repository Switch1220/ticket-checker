import 'package:flutter/material.dart';
import 'package:ticket_checker/src/routing/router.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData.dark(useMaterial3: true),
      routerConfig: router,
    );
  }
}
