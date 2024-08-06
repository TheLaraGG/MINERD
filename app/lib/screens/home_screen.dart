import 'package:flutter/material.dart';
import 'incidencias_screen.dart';
import 'visitas_screen.dart';
import 'lista_incidencias.dart';
import 'Lista_Visitas_screen.dart';
import 'about_screen.dart';
import 'noticias.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MINERD Tablero'),
      ),
      body: Column(
        children: [
          ListTile(
            title: Text('Registrar incidencias'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => IncidenciasScreen()),
              );
            },
          ),
          ListTile(
            title: Text('Listas de incidencias'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ListaIncidenciasScreen()),
              );
            },
          ),
          ListTile(
            title: Text('Visitas'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => RegistrarVisitaScreen()),
              );
            },
          ),
          ListTile(
            title: Text('Ver Visitas'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ListaVisitasScreen()),
              );
            },
          ),
          ListTile(
            title: Text('Noticias MINERD'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NoticiasScreen()),
              );
            },
          ),
          ListTile(
            title: Text('Acerca de'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AboutScreen()),
              );
            },
          ),
        ],
      ),
    );
  }
}
