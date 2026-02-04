import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

import '../alarm/ui.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  Future<void> checkPermission(
    Permission permission,
    BuildContext contex,
  ) async {
    final status = await permission.request();
    if (status.isGranted) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Location is open")));
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Location not open")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xff1A1760),
        title: Text(
          "Location",
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 28,
            color: Colors.white,
          ),
        ),
        iconTheme: IconThemeData(
          color: Colors.white, // drawer icon color
        ),
      ),
      drawer: Drawer(
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
      ),
      backgroundColor: Color(0xff0E0B40),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 8),
            child: Text(
              "Wlecome your smart \n    travel Alarm.",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
                color: Colors.white,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 8),
            child: Text(
              "Stay on schedul and enjoy every \n  monent of your journey.",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 20,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(height: 15),
          Image.asset('asset/location_img.png', width: 300, height: 250),
          SizedBox(height: 20),
          Container(
            height: 65,
            width: MediaQuery.of(context).size.width * 2,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              border: Border.all(color: Color(0xff5E6097), width: 2),
            ),
            child: Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                  vertical: 1,
                ),
                child: Row(
                  spacing: 5,
                  children: [
                    Text(
                      "Use Current Location",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 25,
                        color: Colors.white,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        checkPermission(Permission.location, context);
                      },
                      icon: Icon(
                        Icons.share_location,
                        size: 28,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          SizedBox(height: 20),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LocationScreen()),
              );
            },
            child: Container(
              alignment: Alignment.center,
              height: 65,
              width: MediaQuery.of(context).size.width * 2,
              decoration: BoxDecoration(
                color: Color(0xff5200FF),
                borderRadius: BorderRadius.circular(25),
                border: Border.all(color: Color(0xff5E6097), width: 2),
              ),
              child: Text(
                "Home",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
