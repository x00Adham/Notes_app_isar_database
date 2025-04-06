import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notice_app_isar/themes/themeprovider.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
        margin: const EdgeInsets.only(left: 25, right: 25, top: 10),

        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Dark Mode",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            ),
            Consumer<Themeprovider>(
              builder: (context, themeProvider, child) {
                return CupertinoSwitch(
                  value:
                      Provider.of<Themeprovider>(
                        context,
                        listen: false,
                      ).isDarkMode,
                  onChanged:
                      (value) =>
                          Provider.of<Themeprovider>(
                            context,
                            listen: false,
                          ).toggleTheme(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
