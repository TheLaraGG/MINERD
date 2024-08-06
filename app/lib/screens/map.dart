import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:app/screens/weather_service.dart';

class MapScreen extends StatefulWidget {
  final double latitud;
  final double longitud;

  MapScreen({required this.latitud, required this.longitud});

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late GoogleMapController mapController;
  String weatherInfo = 'Cargando...';

  @override
  void initState() {
    super.initState();
    _fetchWeather();
  }

  Future<void> _fetchWeather() async {
    try {
      final weatherData = await WeatherService().fetchWeather(widget.latitud, widget.longitud);

      setState(() {
        weatherInfo = 'Clima: ${weatherData['weather'][0]['description']}, Temp: ${weatherData['main']['temp']}°C';
      });
    } catch (e) {
      setState(() {
        weatherInfo = 'Error al cargar el clima: $e';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mapa'),
      ),
      body: Column(
        children: [
          Expanded(
            child: GoogleMap(
              initialCameraPosition: CameraPosition(
                target: LatLng(widget.latitud, widget.longitud),
                zoom: 14.0,
              ),
              markers: {
                Marker(
                  markerId: MarkerId('visitaMarker'),
                  position: LatLng(widget.latitud, widget.longitud),
                  infoWindow: InfoWindow(
                    title: 'Visita',
                    snippet: 'Ubicación del técnico',
                  ),
                ),
              },
              onMapCreated: (GoogleMapController controller) {
                mapController = controller;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(weatherInfo, style: TextStyle(fontSize: 16)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
