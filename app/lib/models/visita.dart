class Visita {
  String cedulaDirector;
  String codigoCentro;
  String motivo;
  String fotoEvidencia;
  String comentario;
  String notaVoz;
  String latitud;
  String longitud;
  String fecha;
  String hora;

  Visita({
    required this.cedulaDirector,
    required this.codigoCentro,
    required this.motivo,
    required this.fotoEvidencia,
    required this.comentario,
    required this.notaVoz,
    required this.latitud,
    required this.longitud,
    required this.fecha,
    required this.hora,
  });
  Map<String, dynamic> toMap() {
    return {
      'cedulaDirector': cedulaDirector,
      'codigoCentro': codigoCentro,
      'motivo': motivo,
      'fotoEvidencia': fotoEvidencia,
      'comentario': comentario,
      'notaVoz': notaVoz,
      'latitud': latitud,
      'longitud': longitud,
      'fecha': fecha,
      'hora': hora,
    };
  }
}

