import 'package:flutter/material.dart';
import 'package:life_flutter/ui/core/app_bar.dart';
import 'package:life_flutter/ui/core/drawer.dart';

class TransactionScreen extends StatelessWidget {
  const TransactionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DynamicAppBar(title: 'Transaction'),
      drawer: const DynamicDrawer(
        title: 'Filters',
        items: [
          ListTile(
              leading: Icon(Icons.settings),
              title: Text('Filter 1')
          ),
          ListTile(
            leading: Icon(Icons.sort),
            title: Text('Sort By'),
          )
        ]
      ),
      endDrawer: const DynamicDrawer(
        title: 'Tools',
        items: [
          ListTile(
              leading: Icon(Icons.print),
              title: Text('Export')
          ),
          ListTile(
            leading: Icon(Icons.arrow_back),
            title: Text('Import'),
          ),
          ListTile(
              leading: Icon(Icons.edit),
              title: Text('Bulk Edit')
          )
        ]
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Theme.of(context).colorScheme.primaryFixedDim,
        child: const Icon(Icons.add)
      ),
    );
  }
}