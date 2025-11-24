import 'package:flutter/material.dart';

class DynamicAppBar extends StatelessWidget implements PreferredSizeWidget {
  const DynamicAppBar({
    super.key,
    required this.title,
    this.showFilter = true,
    this.showTools = true
  });

  final String title;
  final bool showFilter;
  final bool showTools;

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  AppBar build(BuildContext context) {
    return AppBar (
      leading: showFilter ? IconButton(
        icon: const Icon(Icons.filter_alt_outlined, color: Colors.white),
        tooltip: 'Filter',
        onPressed: () {
          Scaffold.of(context).openDrawer();
        },
      ) : null,
      title: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
          color:Colors.white,
          letterSpacing: -0.5
        ),
        overflow: TextOverflow.ellipsis,
      ),
      centerTitle: true,

      backgroundColor: Colors.indigo[600],
      elevation: 4.0,

      actions: showTools ? [
        IconButton(
          icon: const Icon(Icons.handyman_outlined, color: Colors.white),
          tooltip: 'Tools',
          onPressed: () {
            Scaffold.of(context).openEndDrawer();
          }
        ),
        const SizedBox(width: 8)
      ]: []
    );
  }
}