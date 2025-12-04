import 'package:flutter/material.dart';
import 'package:life_flutter/data/services/db.dart';
import 'package:life_flutter/routing/router.dart';
import 'package:life_flutter/config/dependencies.dart';
import 'package:provider/provider.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DB.instance.database;
  runApp(MultiProvider(providers: providers, child: const MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Life',
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Color(0xFF2A7937)),
      ),
      routerConfig: router(context.read()),
    );
  }
}
