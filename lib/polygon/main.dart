import 'package:f_google_map/polygon/app_location.dart';
import 'package:f_google_map/polygon/screens/home_page/home_page.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late GoogleMapController mapController;

  LatLng _center = const LatLng(45.521563, -122.677433);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
    AppLocation.hasPermission;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.green[700],
      ),
      home: HomePage(),
      // home: Scaffold(
      //   appBar: AppBar(
      //     title: const Text('Maps Sample App'),
      //     elevation: 2,
      //   ),
      //   body: GoogleMap(
      //     onTap: (latLng) {
      //       print(latLng);
      //     },
      //     myLocationEnabled: true,
      //     myLocationButtonEnabled: true,
      //     onMapCreated: _onMapCreated,
      //     initialCameraPosition: CameraPosition(
      //       target: _center,
      //       zoom: 11.0,
      //     ),
      //   ),
      //
      // ),
    );
  }
}
