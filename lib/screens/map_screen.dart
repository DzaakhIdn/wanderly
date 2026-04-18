import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:wanderly_app/services/map_service.dart';
import 'package:wanderly_app/theme/app_colors.dart';

class MapScreen extends StatefulWidget {
  static const routeName = 'map_screen';
  final List<MapMarkerData>? markers;

  const MapScreen({super.key, this.markers});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class MapMarkerData {
  final String id;
  final double latitude;
  final double longitude;
  final String title;
  final String snippet;

  MapMarkerData({
    required this.id,
    required this.latitude,
    required this.longitude,
    required this.title,
    required this.snippet,
  });
}

class _MapScreenState extends State<MapScreen> {
  late GoogleMapController mapController;
  final MapService _mapService = MapService();
  Set<Marker> markers = {};
  LatLng? currentLocation;

  @override
  void initState() {
    super.initState();
    _initializeMap();
  }

  Future<void> _initializeMap() async {
    try {
      final position = await _mapService.getCurrentLocation();
      final latLng = _mapService.positionToLatLng(position);

      setState(() {
        currentLocation = latLng;
      });

      // Add markers from widget
      if (widget.markers != null) {
        for (var markerData in widget.markers!) {
          final marker = _mapService.createMarker(
            id: markerData.id,
            position: LatLng(markerData.latitude, markerData.longitude),
            title: markerData.title,
            snippet: markerData.snippet,
          );
          markers.add(marker);
        }
      }

      // Add current location marker
      final currentMarker = _mapService.createMarker(
        id: 'current_location',
        position: latLng,
        title: 'Your Location',
        snippet: 'Current position',
      );
      markers.add(currentMarker);

      setState(() {});
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Error: $e')));
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = AppColors.of(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: colors.surface,
        title: Text('Trip Map', style: TextStyle(color: colors.textPrimary)),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: colors.textPrimary),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: currentLocation == null
          ? Center(child: CircularProgressIndicator())
          : GoogleMap(
              onMapCreated: (controller) {
                mapController = controller;
              },
              initialCameraPosition: CameraPosition(
                target: currentLocation!,
                zoom: 15,
              ),
              markers: markers,
              myLocationEnabled: true,
              myLocationButtonEnabled: true,
              zoomControlsEnabled: true,
            ),
    );
  }

  @override
  void dispose() {
    mapController.dispose();
    super.dispose();
  }
}
