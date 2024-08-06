import 'package:flutter/material.dart';
import 'package:app/services/database_helper.dart';
import 'package:app/models/visita.dart';
import 'package:app/screens/map.dart';

class RegistrarVisitaScreen extends StatefulWidget {
  @override
  _RegistrarVisitaScreenState createState() => _RegistrarVisitaScreenState();
}

class _RegistrarVisitaScreenState extends State<RegistrarVisitaScreen> {
  final _formKey = GlobalKey<FormState>();
  String cedulaDirector = "";
  String codigoCentro = "";
  String motivo = "";
  String fotoEvidencia = "";
  String comentario = "";
  String notaVoz = "";
  String latitud = "";
  String longitud = "";
  String fecha = "";
  String hora = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registrar Visita'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Cédula del Director'),
                onSaved: (value) => cedulaDirector = value ?? "",
                validator: (value) => (value == null || value.isEmpty)
                    ? 'Por favor, ingrese la cédula del director'
                    : null,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Código del Centro'),
                onSaved: (value) => codigoCentro = value ?? "",
                validator: (value) => (value == null || value.isEmpty)
                    ? 'Por favor, ingrese el código del centro'
                    : null,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Motivo'),
                onSaved: (value) => motivo = value ?? "",
                validator: (value) => (value == null || value.isEmpty)
                    ? 'Por favor, ingrese el motivo'
                    : null,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Foto de Evidencia'),
                onSaved: (value) => fotoEvidencia = value ?? "",
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Comentario'),
                onSaved: (value) => comentario = value ?? "",
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Nota de Voz'),
                onSaved: (value) => notaVoz = value ?? "",
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Latitud'),
                onSaved: (value) => latitud = value ?? "",
                validator: (value) => (value == null || value.isEmpty)
                    ? 'Por favor, ingrese la latitud'
                    : null,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Longitud'),
                onSaved: (value) => longitud = value ?? "",
                validator: (value) => (value == null || value.isEmpty)
                    ? 'Por favor, ingrese la longitud'
                    : null,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Fecha (YYYY-MM-DD)'),
                onSaved: (value) => fecha = value ?? "",
                validator: (value) => (value == null || value.isEmpty)
                    ? 'Por favor, ingrese la fecha'
                    : null,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Hora (HH:MM)'),
                onSaved: (value) => hora = value ?? "",
                validator: (value) => (value == null || value.isEmpty)
                    ? 'Por favor, ingrese la hora'
                    : null,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    Visita visita = Visita(
                      cedulaDirector: cedulaDirector,
                      codigoCentro: codigoCentro,
                      motivo: motivo,
                      fotoEvidencia: fotoEvidencia,
                      comentario: comentario,
                      notaVoz: notaVoz,
                      latitud: latitud,
                      longitud: longitud,
                      fecha: fecha,
                      hora: hora,
                    );
                    try {
                      await DatabaseHelper().insertVisita(visita);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Visita guardada exitosamente!')),
                      );
                      Navigator.pop(context); // Regresar a la pantalla anterior
                    } catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Error al guardar la visita: $e')),
                      );
                    }
                  }
                },
                child: Text('Guardar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}