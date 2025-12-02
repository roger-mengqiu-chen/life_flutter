import 'package:flutter/material.dart';
import 'package:life_flutter/ui/core/app_bar.dart';

class InvestmentScreen extends StatelessWidget {
  const InvestmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DynamicAppBar(title: 'Investment'),
      body: Center(
        child: Text('Investment')
      )
    );
  }
}