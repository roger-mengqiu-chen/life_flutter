import 'package:flutter/material.dart';
import 'package:life_flutter/ui/core/app_bar.dart';

class TransactionScreen extends StatelessWidget {
  const TransactionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DynamicAppBar(title: 'Transaction'),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            SizedBox(
              height: 100.0,
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.indigo,
                ),
                alignment: Alignment.center,
                padding: const EdgeInsets.only(left: 16.0, top: 40),
                child: const Text(
                  'Filters and Sort',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Filter 1')
            ),
            ListTile(
              leading: Icon(Icons.sort),
              title: Text('Sort By'),
            )
          ]
        )
      ),
      endDrawer: Drawer(
          child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                SizedBox(
                  height: 100.0,
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.indigo,
                    ),
                    alignment: Alignment.center,
                    padding: const EdgeInsets.only(left: 16.0, top: 40),
                    child: const Text(
                      'Tools',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
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
          )
      ),
      body: Center(
        child: Text('Transaction')
      )
    );
  }
}