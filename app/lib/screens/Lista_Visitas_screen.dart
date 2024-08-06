import 'package:flutter/material.dart';
import 'package:app/services/database_helper.dart';
import 'package:app/models/visita.dart';

class ListaVisitasScreen extends StatefulWidget {
  @override
  _ListaVisitasScreenState createState() => _ListaVisitasScreenState();
}

class _ListaVisitasScreenState extends State<ListaVisitasScreen> {
  List<Visita> visitas = [];

  @override
  void initState() {
    super.initState();
    _fetchVisitas();
  }

  Future<void> _fetchVisitas() async {
    try {
      final data = await DatabaseHelper().getAllVisitas();
      setState(() {
        visitas = data;
      });
      print("Datos recuperados: $data"); // Para depuración
    } catch (e) {
      print("Error al recuperar visitas: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Visitas'),
      ),
      body: visitas.isEmpty
          ? Center(child: Text('No hay visitas registradas.')) // Mensaje si no hay datos
          : ListView.builder(
        itemCount: visitas.length,
        itemBuilder: (context, index) {
          final visita = visitas[index];
          return ListTile(
            title: Text(visita.codigoCentro),
            subtitle: Text(visita.motivo),
          );
        },
      ),
    );
  }
}