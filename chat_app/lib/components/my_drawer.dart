import 'package:flutter/material.dart';

import '../services/auth_service.dart';
import '../pages/settings_page.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

    void logout() {
    final _authService = AuthService();

    _authService.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        children: [
          DrawerHeader(
            child: Image.asset(
              'assets/catdrawer.png',
              width: 100,
              height: 100,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              title: Text(
                "home",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              leading: Icon(Icons.home_rounded),
              onTap: () {
                Navigator.pop(context);
              },
              iconColor: Theme.of(context).colorScheme.primary,
              textColor: Theme.of(context).colorScheme.primary,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              title: Text(
                "settings",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              leading: Icon(Icons.settings),
              onTap: () {
                Navigator.pop(context);

                Navigator.push(context, MaterialPageRoute(builder: (context)=> SettingsPage(),));
              },
              iconColor: Theme.of(context).colorScheme.primary,
              textColor: Theme.of(context).colorScheme.primary,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              title: Text(
                "logout",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              leading: Icon(Icons.logout),
              onTap: logout,
              iconColor: Theme.of(context).colorScheme.primary,
              textColor: Theme.of(context).colorScheme.primary,
            ),
          )
        ],
      ),
    );
  }
}
