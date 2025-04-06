import 'package:flutter/material.dart';
import 'package:notice_app_isar/screens/settings_page.dart';
import 'package:notice_app_isar/widgets/drawertile.dart';

class Mydrawer extends StatelessWidget {
  const Mydrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child:
      //header
      Column(
        children: [
          const DrawerHeader(child: Icon(Icons.note)),

          //note list
          DrawerTile(
            leading: const Icon(Icons.home),
            title: "Notes",
            onTap: () => Navigator.pop(context),
          ),

          DrawerTile(
            title: "Settings",
            leading: const Icon(Icons.settings),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SettingsPage()),
              );
            },
          ),
          //settings
        ],
      ),
    );
  }
}
