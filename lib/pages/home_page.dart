import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recommended_app/models/user.dart';
import 'package:recommended_app/widgets/appbar_menu_button.dart';
import 'package:recommended_app/widgets/navigation_drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserObj?>(context);

    return Scaffold(
      appBar: user != null ? AppBar(
        title: const Text("Home"),
        centerTitle: true,
        actions: [
          AppbarMenuButton(
            imageUrl: user.imgUrl
          )
        ],
      ) : null,
      body: SafeArea(
        child: user == null ? const Center(child: CircularProgressIndicator()) :
        GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16
          ), 
          itemCount: 8,
          itemBuilder: (context, index) {
            final bool isEven = index % 2 == 0;
            return Container(
              color: Colors.grey,
              child: GridTile(
                child: InkResponse(
                  onTap: () {},
                  child: Center(
                    child: Text(isEven ? "Stuff" : "Things")
                  ),
                )
              ),
            );
          }
        )
      ),
      drawer: SafeArea(
        child: NavigationDrawer(
          user: user,
        )
      ),
    );
  }
}