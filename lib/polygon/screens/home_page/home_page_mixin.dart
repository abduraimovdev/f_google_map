part of './home_page.dart';

mixin HomePageMixin on State<HomePage> {
  final Completer<GoogleMapController> _controller = Completer();

  static const CameraPosition _kGoogle = CameraPosition(
    target: LatLng(19.0759837, 72.8776559),
    zoom: 14,
  );

  Set<Marker> _markers = {};
  Set<Polyline> _polyline = {};
  Set<Polygon> _polygon = {};

  List<LatLng> latLen = [];

  LatLng? selectedLocation;

  // Methods

  void buttonLongPress(LatLng latLng) async {
    _markers.add(
      Marker(
        markerId: MarkerId(Random().nextInt(1000).toString()),
        position: latLng,
        onTap: () {
          deleteMarker(latLng);
        },
        icon: BitmapDescriptor.defaultMarker,
      ),
    );
    latLen.add(latLng);
    _polygon.add(
      Polygon(
        polygonId:  const PolygonId("1"),
        points: latLen,

      ),
    );
    setState(() {});
  }

  void buttonClearPolyLine() {
    setState(() {
      _markers = {};
      _polyline = {};
      _polygon = {};
      latLen = [];
    });
  }

  void buttonOnTap(LatLng latLng) {
    _markers.add(
      Marker(
        markerId: MarkerId(Random().nextInt(1000).toString()),
        position: latLng,
        onTap: () {
          deleteMarker(latLng);
        },
        icon: BitmapDescriptor.defaultMarker,
      ),
    );
    latLen.add(latLng);
    _polyline.add(
      Polyline(
        polylineId: const PolylineId('1'),
        points: latLen,
        color: Colors.blue,
      ),
    );
    setState(() {});
  }

  void deleteMarker(LatLng latLng) {
    setState(() {
      _markers.removeWhere((element) => element.position == latLng);
      _polyline.forEach((element) {
        element.points.removeWhere((element) => element == latLng);
      });
      _polygon.forEach((element) {
        element.points.removeWhere((element) => element == latLng);
      });
    });
  }
}
