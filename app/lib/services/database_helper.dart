import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:app/models/visita.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;

  DatabaseHelper._internal();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB();
    return _database!;
  }

  Future<Database> _initDB() async {
    String path = join(await getDatabasesPath(), 'app.db'); // Nombre de la base de datos
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE incidencias(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            title TEXT,
            educationalCenter TEXT,
            regional TEXT,
            district TEXT,
            description TEXT,
            photoPath TEXT,
            audioPath TEXT
          )
        ''');
        await db.execute('''
          CREATE TABLE visitas(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            cedulaDirector TEXT,
            codigoCentro TEXT,
            motivo TEXT,
            fotoEvidencia TEXT,
            comentario TEXT,
            notaVoz TEXT,
            latitud TEXT,
            longitud TEXT,
            fecha TEXT,
            hora TEXT
          )
        ''');
      },
    );
  }

  Future<void> deleteAllData() async {
    final db = await database;
    await db.delete('incidencias'); // Eliminar todas las incidencias
    await db.delete('visitas'); // Eliminar todas las visitas
  }

  Future<List<Map<String, dynamic>>> getAllIncidences() async {
    final db = await database;
    return await db.query('incidencias');
  }

  Future<void> insertIncidence(Map<String, dynamic> data) async {
    final db = await database;
    await db.insert('incidencias', data);
  }

  Future<void> insertVisita(Visita visita) async {
    final db = await database;
    await db.insert('visitas', visita.toMap());
  }

  Future<List<Visita>> getAllVisitas() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('visitas');

    return List.generate(maps.length, (i) {
      return Visita(
        cedulaDirector: maps[i]['cedulaDirector'],
        codigoCentro: maps[i]['codigoCentro'],
        motivo: maps[i]['motivo'],
        fotoEvidencia: maps[i]['fotoEvidencia'],
        comentario: maps[i]['comentario'],
        notaVoz: maps[i]['notaVoz'],
        latitud: maps[i]['latitud'],
        longitud: maps[i]['longitud'],
        fecha: maps[i]['fecha'],
        hora: maps[i]['hora'],
      );
    });
  }
}