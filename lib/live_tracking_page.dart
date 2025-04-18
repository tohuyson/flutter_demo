import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:http/http.dart' as http;
import 'package:location/location.dart';

class LiveTrackingPage extends StatefulWidget {
  const LiveTrackingPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _LiveTrackingPageState();
  }
}

class _LiveTrackingPageState extends State<LiveTrackingPage> {
  final LatLng _sourceLocation = const LatLng(10.800907, 106.648661); // Ho Chi Minh City
  final LatLng _destinationLocation = const LatLng(10.797805, 106.650837); // Ben Thanh Market

  Marker? _sourceIcon;
  Marker? _destinationIcon;
  List<LatLng> _polylinePoints = [];

  final Location _location = Location();
  LocationData? _currentLocation;

  MapController? mapController;

  getCurrentLocation() async {
    try {
      _currentLocation = await _location.getLocation();
    } catch (e) {
      print('Error getting location: $e');
    }
  }

  setCustomMarker() async {
    _sourceIcon = Marker(
      point: _sourceLocation,
      width: 24,
      height: 24,
      child: Image.asset(
        'assets/images/source_icon.png',
        width: 24,
        height: 24,
      ),
    );

    _destinationIcon = Marker(
      point: _destinationLocation,
      width: 24,
      height: 24,
      child: Image.asset(
        'assets/images/destination_icon.png',
        width: 24,
        height: 24,
      ),
    );
  }

  @override
  void initState() {
    mapController = MapController();
    getCurrentLocation();
    _location.onLocationChanged.listen((LocationData currentLocation) {
      setState(() {
        _currentLocation = currentLocation;
      });
      mapController?.move(
        LatLng(currentLocation.latitude!, currentLocation.longitude!),
        16,
      );
    });
    setCustomMarker();
    fetchRoute(_sourceLocation, _destinationLocation);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FlutterMap(
        mapController: mapController,
        options: const MapOptions(
          initialZoom: 16,
        ),
        children: [
          TileLayer(
            urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png', // For demonstration only
          ),
          MarkerLayer(
            markers: [
              if (_sourceIcon != null) ...[
                _sourceIcon!,
              ],
              if (_destinationIcon != null) ...[
                _destinationIcon!,
              ],
              if (_currentLocation != null) ...[
                Marker(
                  point: LatLng(_currentLocation!.latitude!, _currentLocation!.longitude!),
                  width: 24,
                  height: 24,
                  child: Image.asset(
                    'assets/images/current_location_icon.png',
                    width: 24,
                    height: 24,
                  ),
                ),
              ],
            ],
          ),
          PolylineLayer(
            polylines: [
              if (_polylinePoints.isNotEmpty) ...[
                Polyline(
                  points: _polylinePoints,
                  strokeWidth: 2.0,
                  color: Colors.red,
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }

  Future<void> fetchRoute(LatLng start, LatLng end) async {
    final url = Uri.parse(
      'http://router.project-osrm.org/route/v1/driving/${start.longitude},${start.latitude};${end.longitude},${end.latitude}?overview=full&geometries=geojson',
    );

    final response = await http.get(url);
    final data = json.decode(response.body);

    final coords = data['routes'][0]['geometry']['coordinates'] as List;
    final points = coords.map((c) => LatLng(c[1], c[0])).toList();

    setState(() {
      _polylinePoints = points;
    });
  }
}
