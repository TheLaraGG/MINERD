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

  Future<void> _deleteAllIncidencias() async {
    await DatabaseHelper().deleteAllData(); // Cambiado a deleteAllData
    setState(() {
      incidencias.clear();
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Todos los registros han sido borrados.')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Incidencias'),
        actions: [
          IconButton(
            icon: Icon(Icons.delete_forever),
            onPressed: () async {
              final shouldDelete = await showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text('Borrar Todos los Registros'),
                  content: Text('¿Estás seguro de que quieres borrar todos los registros?'),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(false),
                      child: Text('Cancelar'),
                    ),
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(true),
                      child: Text('Eliminar'),
                    ),
                  ],
                ),
              );
              if (shouldDelete) {
                await _deleteAllIncidencias();
              }
            },
          ),
        ],
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
