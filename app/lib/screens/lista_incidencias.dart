import 'package:flutter/material.dart';
import 'package:app/services/database_helper.dart';

class ListaIncidenciasScreen extends StatefulWidget {
  @override
  _ListaIncidenciasScreenState createState() => _ListaIncidenciasScreenState();
}

class _ListaIncidenciasScreenState extends State<ListaIncidenciasScreen> {
  List<Map<String, dynamic>> incidencias = [];

  @override
  void initState() {
    super.initState();
    _fetchIncidencias();
  }

  Future<void> _fetchIncidencias() async {
    final data = await DatabaseHelper().getAllIncidences();
    setState(() {
      incidencias = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Incidencias'),
      ),
      body: ListView.builder(
        itemCount: incidencias.length,
        itemBuilder: (context, index) {
          final incidencia = incidencias[index];
          return ListTile(
            title: Text(incidencia['title']),
            subtitle: Text(incidencia['description']),
          );
        },
      ),
    );
  }
}