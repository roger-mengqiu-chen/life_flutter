import 'package:flutter/material.dart';
import 'package:life_flutter/data/services/db.dart';
import 'package:life_flutter/ui/home/widgets/home_screen.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DB db = DB.instance;
  await db.database;
  runApp(const MainApp());
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
