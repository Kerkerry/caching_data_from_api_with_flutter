import 'package:flutter/material.dart';
import 'package:offlineapp/app.dart';
import 'package:offlineapp/core/services/di.dart';

Future<void> main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupDi();
  runApp(const App());
}


