import 'package:flutter/material.dart';
import '../models/user.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key, this.user}) : super(key: key);

  final UserObj? user;

  // TEMP

  @override
  Widget build(BuildContext context) {

    if (user == null) {
      return const CircularProgressIndicator();
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(
                  backgroundImage: NetworkImage(user!.imgUrl),
                  radius: 40,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(2.0),
                child: Text(
                  "Name: " + user!.name,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(2.0),
                child: Text(
                  "Name: " + user!.email,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}