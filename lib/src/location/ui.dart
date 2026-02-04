import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:softvence_task/src/location/widgets/drawar_screen.dart';

import '../alarm/alarm_screen.dart';
import 'current_location.dart';

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
      drawer: DrawerWidgets(),
      backgroundColor: Color(0xff0E0B40),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 8),
            child: Text(
              "Welcome your smart \n    travel Alarm.",
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
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CurrentLocatrionScreen(),
                ),
              );
            },
            child: Container(
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
                      Icon(Icons.share_location, size: 28, color: Colors.white),
                    ],
                  ),
                ),
              ),
            ),
          ),

          SizedBox(height: 20),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AlarmScreen()),
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
                "Set Alarm",
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
