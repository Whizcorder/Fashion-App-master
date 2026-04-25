import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeMobile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Home")),
      drawer: Drawer(
        child: Container(
          color: Colors.black,
          child: ListView(
            children: [
              UserAccountsDrawerHeader(
                decoration: const BoxDecoration(color: Colors.black),
                accountName: const Text("Aditya Joshi"),
                accountEmail: const Text("aditya@imail.com"),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.transparent,
                  child: SvgPicture.network(
                    'https://image.flaticon.com/icons/svg/145/145867.svg',
                    height: 50,
                  ),
                ),
              ),

              _item(Icons.home, "Home"),
              _svgItem('assets/images/bag.svg', "Cart"),
              _item(Icons.search, "Search"),
              _svgItem('assets/images/setting.svg', "Filter"),
              _item(Icons.message, "Messages"),
              _item(Icons.person, "Profile"),
              _item(Icons.help, "Help"),
              _item(Icons.settings, "Settings"),

              const Divider(color: Colors.white),

              ListTile(
                leading: const Icon(Icons.exit_to_app, color: Colors.white),
                title: const Text("Logout",
                    style: TextStyle(color: Colors.white)),
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
      body: const Center(child: Text("Home Page")),
    );
  }

  Widget _item(IconData icon, String text) {
    return ListTile(
      leading: Icon(icon, color: Colors.white),
      title: Text(text, style: const TextStyle(color: Colors.white)),
      onTap: () {},
    );
  }

  Widget _svgItem(String path, String text) {
    return ListTile(
      leading: SvgPicture.asset(
        path,
        height: 24,
        colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
      ),
      title: Text(text, style: const TextStyle(color: Colors.white)),
      onTap: () {},
    );
  }
}