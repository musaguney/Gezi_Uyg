import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseConnection {
  setDatabase() async {
    var directory = await getApplicationDocumentsDirectory();
    var path = join(directory.path, 'db_MUG');
    var database = await openDatabase(path, version: 2, onCreate: _onCreatingDatabase);
    return database;
  }

  _onCreatingDatabase(Database database, int version) async {
    await database.execute("CREATE TABLE users(id INTEGER PRIMARY KEY AUTOINCREMENT,nameSurname TEXT,userName TEXT,email TEXT,password TEXT);");
    await database.execute(
        "CREATE TABLE places(id INTEGER PRIMARY KEY AUTOINCREMENT,title TEXT,subTitle TEXT,category TEXT,info TEXT,openHours TEXT,image TEXT,price TEXT);");
    await database
        .execute("CREATE TABLE comments(id INTEGER PRIMARY KEY AUTOINCREMENT,placeId INTEGER,userId INTEGER, point INTEGER, comment TEXT);");
  }
}
