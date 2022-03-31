import 'package:flutter/material.dart';
import 'package:recommended_app/models/user.dart';
import 'package:recommended_app/pages/profile_page.dart';
import 'package:recommended_app/pages/settings_page.dart';

enum PageName {  
  settings,
  about
}

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key? key, this.user}) : super(key: key);

  final UserObj? user;

  void selectedItem(BuildContext context, PageName name) {
    switch (name) {
      case PageName.settings:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const SettingsPage()
        ));
        break;
      case PageName.about:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => ProfilePage(
            user: user
          )
        ));
        break;
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Material(
        child: ListView(
          children: [
            ListTile(
              title: const Text("Settings"),
              leading: const Icon(Icons.settings),
              onTap: () => selectedItem(context, PageName.settings),
            ),
            ListTile(
              title: const Text("Profile"),
              leading: const Icon(Icons.person),
              onTap: () => selectedItem(context, PageName.about),
            )
          ],
        ),
      ),
    );
  }
}