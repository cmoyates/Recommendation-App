import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/authentication_service.dart';

class AppbarMenuButton extends StatelessWidget {
  const AppbarMenuButton({Key? key, this.imageUrl}) : super(key: key);

  final String? imageUrl;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      icon: imageUrl != null ? CircleAvatar(
        backgroundImage: NetworkImage(imageUrl!),
      ) : null,
      itemBuilder: (context) => [
        PopupMenuItem(
          child: Row(
            children: const [
              Icon(
                Icons.logout,
                size: 20,
              ),
              SizedBox(width: 4),
              Text("Logout"),
            ],
          ),
          onTap: () {
            final provider = Provider.of<GoogleSignInProvider>(context, listen: false);
            provider.logout();
          },
        )
      ]
    );
  }
}