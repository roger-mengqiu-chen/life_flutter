import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:life_flutter/routing/routes.dart';
import 'package:life_flutter/ui/core/app_bar.dart';

class MoreScreen extends StatelessWidget {
  const MoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
            crossAxisCount: 2,
            crossAxisSpacing: 30.0,
            mainAxisSpacing: 30.0,
            children: <Widget>[
              _buildGridTile(context, Icons.category, 'Categories', () => _categoryOnTap(context)),
              _buildGridTile(context, Icons.shopping_bag, 'Merchants', () {}),
              _buildGridTile(context, Icons.calendar_month, 'Events', () {}),
              _buildGridTile(context, Icons.location_on, 'Locations', () {}),
              _buildGridTile(context, Icons.people, 'People', () {}),
              _buildGridTile(context, Icons.settings, 'Settings', () => _settingsOnTap(context)),
            ]
          )
        )
      )
    );
  }
  
  Widget _buildGridTile(BuildContext context, IconData icon, String label, VoidCallback onTap) {
    return Container (
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onPrimary,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.5),
            offset: const Offset(4, 4),
            spreadRadius: 3,
            blurRadius: 7,
          )
        ]
      ),
      child: InkWell(
        onTap: onTap,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                icon,
                size: 30.0,
                color: Colors.black,
              ),
              const SizedBox(height: 10),
              Text(
                label,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold
                )
              )
            ],
          ),
        ),
      ),
    );
  }

  void _categoryOnTap(BuildContext context) {
    context.push(Routes.categories);
  }
  
  void _settingsOnTap(BuildContext context) {
    context.push(Routes.settings);
  }
}