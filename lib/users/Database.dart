import 'dart:developer';
import 'dart:io';
import 'package:flutterapp/model/Users.dart';
import 'package:path_provider/path_provider.dart';
import 'Package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:path/path.dart';

// **********************************************
class DBProvider {
  DBProvider._();
  static final DBProvider db = DBProvider._();

  static Database _database;

  Future<Database> get database async {
    log('Getting DDB');
    if (_database != null) return _database;

    // if _database is null we instantiate it
    _database = await initDB();
    return _database;
  }

  initDB() async {
    log('Init*************');
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
//    String path = join(documentsDirectory.path, "User_db");
    String path = 'assets/database/mydb.db';
    return await openDatabase(path,
      version: 1,
      onOpen: (db) {},
      onCreate: (Database db, int version) async {
        await db.execute("CREATE TABLE Users ("
            "id INTEGER PRIMARY KEY,"
            "userId INTEGER,"
            "title TEXT,"
            "body  TEXT"
            ")");
      },
    );
  }


newUser( Users newUser) async {
    final db = await database;
    //get the biggest id in the table
    var table = await db.rawQuery("SELECT MAX(id)+1 as id FROM Users");
    int id = table.first["id"];
    //insert to the table using the new id
    log('Inserting: ');
    log(newUser.title);
    var raw = await db.rawInsert(
        "INSERT Into Users (id,userId,title,body)"
        " VALUES (?,?,?,?)",
        [id, newUser.userId, newUser.title, newUser.body]);
    return raw;
  }

  getUser(int id) async {
    final db = await database;
    var res = await db.query("Users", where: "id = ?", whereArgs: [id]);
    return res.isNotEmpty ? Users.fromMap(res.first) : Null;
  }

  getAllUsers() async {
    final db = await database;
    var res = await db.query("Users");
    List<Users> list =
        res.isNotEmpty ? res.map((c) => Users.fromMap(c)).toList() : [];
    return list;
  }
}
