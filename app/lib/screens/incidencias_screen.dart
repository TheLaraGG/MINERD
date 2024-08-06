import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:app/services/database_helper.dart';

class IncidenciasScreen extends StatefulWidget {
  @override
  _RegisterIncidenceScreenState createState() => _RegisterIncidenceScreenState();
}

class _RegisterIncidenceScreenState extends State<IncidenciasScreen> {
  final _formKey = GlobalKey<FormState>();
  String title = "", educationalCenter = "", regional = "", district = "", description = "";
  String? photoPath, audioPath;
  final ImagePicker _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registrar Incidencia'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Título'),
                onSaved: (value) => title = value ?? "",
                validator: (value) => (value == null || value.isEmpty) ? 'Por favor, ingrese un título' : null,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Centro Educativo'),
                onSaved: (value) => educationalCenter = value ?? "",
                validator: (value) => (value == null || value.isEmpty) ? 'Por favor, ingrese el centro educativo' : null,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Regional'),
                onSaved: (value) => regional = value ?? "",
                validator: (value) => (value == null || value.isEmpty) ? 'Por favor, ingrese la regional' : null,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Distrito'),
                onSaved: (value) => district = value ?? "",
                validator: (value) => (value == null || value.isEmpty) ? 'Por favor, ingrese el distrito' : null,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Descripción'),
                onSaved: (value) => description = value ?? "",
                validator: (value) => (value == null || value.isEmpty) ? 'Por favor, ingrese una descripción' : null,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
                  if (pickedFile != null) {
                    setState(() {
                      photoPath = pickedFile.path;
                    });
                  }
                },
                child: Text('Sube la imagen'),
              ),
              ElevatedButton(
                onPressed: () {
                  // Implementar la funcionalidad para subir audio aquí
                },
                child: Text('Subir el audio opcional'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    // Preparar los datos para la inserción
                    Map<String, dynamic> data = {
                      'title': title,
                      'educationalCenter': educationalCenter,
                      'regional': regional,
                      'district': district,
                      'description': description,
                      'photoPath': photoPath,
                      'audioPath': audioPath,
                    };
                    // Guardar los datos de la incidencia
                    await DatabaseHelper().insertIncidence(data);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Incidencia guardada exitosamente!')),
                    );
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