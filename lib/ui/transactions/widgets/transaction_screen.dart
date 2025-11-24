import 'package:flutter/material.dart';
import 'package:life_flutter/ui/core/app_bar.dart';

class TransactionScreen extends StatelessWidget {
  const TransactionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DynamicAppBar()
    );
  }
}