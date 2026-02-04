// import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:geolocator/geolocator.dart';
//
// class MapScreen extends StatefulWidget {
//   @override
//   State<MapScreen> createState() => _MapScreenState();
// }
//
// class _MapScreenState extends State<MapScreen> {
//   GoogleMapController? mapController;
//   LatLng? currentLatLng;
//   Set<Marker> markers = {};
//
//   @override
//   void initState() {
//     super.initState();
//     getLocation();
//   }
//
//   Future<void> getLocation() async {
//     Position position = await Geolocator.getCurrentPosition(
//       desiredAccuracy: LocationAccuracy.high,
//     );
//
//     currentLatLng = LatLng(position.latitude, position.longitude);
//
//     markers.add(
//       Marker(
//         markerId: MarkerId("me"),
//         position: currentLatLng!,
//         infoWindow: InfoWindow(title: "My Location"),
//       ),
//     );
//
//     setState(() {});
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     if (currentLatLng == null) {
//       return Scaffold(
//         body: Center(child: CircularProgressIndicator()),
//       );
//     }
//
//     return Scaffold(
//       appBar: AppBar(title: Text("Google Map")),
//       body: GoogleMap(
//         initialCameraPosition: CameraPosition(
//           target: currentLatLng!,
//           zoom: 16,
//         ),
//         markers: markers,
//         myLocationEnabled: true,
//         onMapCreated: (controller) {
//           mapController = controller;
//         },
//       ),
//     );
//   }
// }
