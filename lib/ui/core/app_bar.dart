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
    final colorScheme = Theme.of(context).colorScheme;
    final foregroundColor = colorScheme.onPrimary;

    return AppBar (
      iconTheme: IconThemeData(color: foregroundColor),
      leading: showFilter ? IconButton(
        icon: Icon(Icons.filter_alt_outlined, color: foregroundColor),
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
          color: foregroundColor,
          letterSpacing: -0.5
        ),
        overflow: TextOverflow.ellipsis,
      ),
      centerTitle: true,

      backgroundColor: colorScheme.primary,
      elevation: 4.0,

      actions: showTools ? [
        IconButton(
          icon: Icon(Icons.handyman_outlined, color: foregroundColor),
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