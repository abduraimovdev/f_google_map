import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class AppLocation {
  AppLocation._();

  static final _location = Location.instance;

  static Future<LatLng?> getLocation() async{
    final hasPer = await hasPermission;
    if(hasPer) {
      final location = await _location.getLocation();
      return LatLng( location.latitude!,  location.longitude!);
    }else {
      return null;
    }
  }

  static Future<bool> get hasPermission async {
    await _location.requestPermission();
    final result = await _location.hasPermission();
    if(result.name == "granted") {
      return true;
    }else {
      return false;
    }
  }
}
