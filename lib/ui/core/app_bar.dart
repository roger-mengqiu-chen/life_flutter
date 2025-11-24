import 'package:flutter/material.dart';

class DynamicAppBar extends StatelessWidget implements PreferredSizeWidget {
  const DynamicAppBar({super.key});

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  AppBar build(BuildContext context) {
    return AppBar (
      leading: IconButton(
        icon: const Icon(Icons.filter_alt_outlined, color: Colors.white),
        tooltip: 'Filter',
        onPressed: () {
          _showMessageBox(context, 'Left menu opened');
        },
      ),
      title: const Text(
        'Title',
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

      actions: [
        IconButton(
          icon: const Icon(Icons.handyman_outlined, color: Colors.white),
          tooltip: 'Tools',
          onPressed: () {
            _showMessageBox(context, 'Toolbox opened');
          }
        ),
        const SizedBox(width: 8)
      ]
    );
  }

  void _showMessageBox(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          title: const Text('Action Triggered'),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              child: const Text('Close', style: TextStyle(color: Colors.indigo)),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}