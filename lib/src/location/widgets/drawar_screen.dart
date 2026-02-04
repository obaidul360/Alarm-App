import 'package:flutter/material.dart';
class DrawerWidgets extends StatelessWidget {
  const DrawerWidgets({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          // 🔹 Header
          UserAccountsDrawerHeader(
            accountName: Text("Md Obaidul Islam"),
            accountEmail: Text("obdcse360@email.com"),
            currentAccountPicture: CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('asset/obaidul.jpg'),
            ),
            decoration: BoxDecoration(color: Colors.blue),
          ),

          ListTile(
            leading: Icon(Icons.home),
            title: Text("Home"),
            onTap: () {
              Navigator.pop(context);
            },
          ),

          ListTile(
            leading: Icon(Icons.person),
            title: Text("Profile"),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text("Settings"),
            onTap: () {
              Navigator.pop(context);
            },
          ),

          Divider(),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text("Logout"),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}