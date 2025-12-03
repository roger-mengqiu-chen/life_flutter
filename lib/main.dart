import 'package:flutter/material.dart';
import 'package:life_flutter/data/services/db.dart';
import 'package:life_flutter/ui/home/widgets/home_screen.dart';
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
    return MaterialApp(
      title: 'Life',
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.indigo),
      ),
      home: const HomeScreen(),
    );
  }
}
