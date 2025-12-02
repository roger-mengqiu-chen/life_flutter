import 'package:flutter/material.dart';
import 'package:life_flutter/ui/core/app_bar.dart';

class UtilitiesScreen extends StatelessWidget {
  const UtilitiesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: DynamicAppBar(title: 'Utilities'),
      body: Center(
        child: Text('Utilities')
      )
    );
  }
}