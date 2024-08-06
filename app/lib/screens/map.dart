import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatelessWidget {
  final double latitud;
  final double longitud;

  MapScreen({required this.latitud, required this.longitud});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mapa de Visita'),
      ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(latitud, longitud),
          zoom: 14.0,
        ),
        markers: {
          Marker(
            markerId: MarkerId('visitaMarker'),
            position: LatLng(latitud, longitud),
            infoWindow: InfoWindow(
              title: 'Ubicación de la Visita',
            ),
          ),
        },
      ),
    );
  }
}
