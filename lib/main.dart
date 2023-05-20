import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ticket_checker/src/app.dart';
import 'package:ticket_checker/src/providers/prefs.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  prefs = await SharedPreferences.getInstance();

  runApp(
    const ProviderScope(
      child: App(),
    ),
  );
}
