import 'package:flutter/material.dart';
import 'package:life_flutter/ui/core/app_bar.dart';

class MoreScreen extends StatelessWidget {
  const MoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DynamicAppBar(
        title: 'More',
        showFilter: false,
        showTools: false,
      ),
      body: Center(
        child: Text('More')
      )
    );
  }
}