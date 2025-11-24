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
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 30.0,
          mainAxisSpacing: 30.0,
          children: <Widget>[
            _buildGridTile(Icons.category, 'Categories'),
            _buildGridTile(Icons.shopping_bag, 'Merchants'),
            _buildGridTile(Icons.calendar_month, 'Events'),
            _buildGridTile(Icons.location_on, 'Locations'),
            _buildGridTile(Icons.people, 'People')
          ]
        )
      )
    );
  }
  
  Widget _buildGridTile(IconData icon, String label) {
    return Container (
      decoration: BoxDecoration(
        color: Colors.white,
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
        onTap: () {
        },
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
}