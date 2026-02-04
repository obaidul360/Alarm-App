import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../alarm/alarm_set_ui.dart';

class CurrentLocatrionScreen extends StatefulWidget {
  const CurrentLocatrionScreen({super.key});

  @override
  State<CurrentLocatrionScreen> createState() => _CurrentLocatrionScreenState();
}

class _CurrentLocatrionScreenState extends State<CurrentLocatrionScreen> {
  String locationText = "";

  LatLng? currentLatLng;
  final Set<Marker> markers = {};
  GoogleMapController? mapController;

  Future<void> getLocation() async {
    bool serviceEnable = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnable) {
      setState(() {
        locationText = "Location service is disabled";
      });
      return;
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }
    if (permission == LocationPermission.deniedForever) {
      setState(() {
        locationText = "Permission Permanently Denied";
      });
      return;
    }

    Position position = await Geolocator.getCurrentPosition(
      locationSettings: const LocationSettings(accuracy: LocationAccuracy.high),
    );

    currentLatLng = LatLng(position.latitude, position.longitude);

    // map marker update
    markers.clear();
    markers.add(
      Marker(markerId: const MarkerId("me"), position: currentLatLng!),
    );

    // camera move
    mapController?.animateCamera(
      CameraUpdate.newLatLngZoom(currentLatLng!, 16),
    );

    List<Placemark> placemark = await placemarkFromCoordinates(
      position.latitude,
      position.longitude,
    );

    Placemark place = placemark.first;

    setState(() {
      locationText =
          '''
Latitude: ${position.latitude}
Longitude: ${position.longitude}
Country: ${place.country}
Division: ${place.administrativeArea}
District: ${place.subAdministrativeArea}
City: ${place.locality}
Area: ${place.street}
''';
    });
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
          //Lower Half — Map
          Expanded(
            flex: 2,
            child: GoogleMap(
              initialCameraPosition: const CameraPosition(
                target: LatLng(23.777176, 90.399452), // Dhaka default
                zoom: 12,
              ),
              markers: markers,
              myLocationEnabled: true,
              onMapCreated: (controller) {
                mapController = controller;
              },
            ),
          ),
          SizedBox(height: 10),
          Expanded(
            child: Text(locationText, style: TextStyle(color: Colors.white)),
          ),
          SizedBox(height: 10),
          Container(
            height: 65,
            width: double.infinity,
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
                      "Use current location",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 25,
                        color: Colors.white,
                      ),
                    ),
                    IconButton(
                      onPressed: getLocation,
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

          SizedBox(height: 10),
          //Navigator
          Container(
            height: 40,
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AlarmSetScreen(),
                  ), // AlarmScreenGoMap()),
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
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}
