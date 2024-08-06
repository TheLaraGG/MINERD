import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            child: Text('Menu'),
            decoration: BoxDecoration(color: Colors.blue),
          ),
          ListTile(
            title: Text('Registrar Incidencia'),
            onTap: () {
              Navigator.pushNamed(context, '/incidencias');
            },
          ),
          ListTile(
            title: Text('Acerca de'),
            onTap: () {
              Navigator.pushNamed(context, '/about');
            },
          ),
          ListTile(
            title: Text('Visitas'),
            onTap: () {
              Navigator.pushNamed(context, '/visitas');
            },
          ),
        ],
      ),
    );
  }
}
