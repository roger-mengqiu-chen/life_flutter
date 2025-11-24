import 'package:flutter/material.dart';

class DynamicDrawer extends StatelessWidget {
  const DynamicDrawer ({
    super.key,
    required this.title,
    required this.items
  });

  final String title;
  final List<Widget> items;

  @override
  Drawer build(BuildContext context) {
    return Drawer(
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
                  child: Text(
                    title,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              ...items,
            ]
        )
    );
  }
}