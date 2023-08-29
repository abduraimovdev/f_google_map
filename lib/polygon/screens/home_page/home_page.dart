import 'dart:async';
import 'dart:math';

import 'package:f_google_map/polygon/app_location.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

part './home_page_mixin.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with HomePageMixin {
  @override
  void initState() {
    AppLocation.hasPermission;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF0F9D58),
        // title of app
        title: const Text("Google Maps"),
      ),
      body: SafeArea(
        child: GoogleMap(
          onLongPress: buttonLongPress,
          initialCameraPosition: HomePageMixin._kGoogle,
          mapType: MapType.normal,
          markers: _markers,
          myLocationEnabled: true,
          myLocationButtonEnabled: true,
          compassEnabled: true,
          polylines: _polyline,
          polygons: _polygon,
          onTap: buttonOnTap,
          onMapCreated: (GoogleMapController controller) async {
            // final location = await AppLocation.getLocation();

            // controller.moveCamera(CameraUpdate.newLatLngZoom(location!, 17));
            _controller.complete(controller);
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: buttonClearPolyLine,
        child: const Icon(Icons.wrong_location_outlined),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
