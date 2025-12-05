import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:life_flutter/routing/routes.dart';
import 'package:life_flutter/ui/core/app_bar.dart';
import 'package:life_flutter/ui/more/widgets/tile.dart';

class MoreScreen extends StatelessWidget {
  const MoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.sizeOf(context).width;
    int col = screenWidth ~/ (120 + 30);
    return Scaffold(
      appBar: const DynamicAppBar(
        title: 'More',
        showFilter: false,
        showTools: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: col,
            crossAxisSpacing: 30.0,
            mainAxisSpacing: 30.0,
            children: <Widget>[
              Tile(icon: Icons.category, title: 'Categories', onTap: _categoryOnTap),
              Tile(icon: Icons.shopping_bag, title: 'Merchants'),
              Tile(icon: Icons.calendar_month, title: 'Events'),
              Tile(icon: Icons.location_on, title: 'Locations'),
              Tile(icon: Icons.people, title: 'People'),
              Tile(icon: Icons.settings, title: 'Settings', onTap: _settingsOnTap),
            ]
          )
        )
      )
    );
  }

  void _categoryOnTap(BuildContext context) {
    context.push(Routes.categories);
  }
  
  void _settingsOnTap(BuildContext context) {
    context.push(Routes.settings);
  }
}