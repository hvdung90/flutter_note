import 'package:noteapp/model/DataAccount.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class AccountDao {
  final String tableName = "Account";
  final String id="id";
  final String name="name";
  final String countNote="countNote";
  final String countRemind="countRemind";


  Database database;


  Future<Database> open() async {
    if (database == null) {
      var databasePath = await getDatabasesPath();
      String path = join(databasePath, "note.db");

      database = await openDatabase(path, version: 1,
          onCreate: (Database db, int version) async {
        await db.execute(
            "CREATE TABLE IF NOT EXISTS $tableName ($id INTEGER PRIMARY KEY, "
            "$name TEXT, $countNote INTEGER, $countRemind INTEGER);");
      });
    }
    return database;
  }

  Future<int> saveAccount(DataAccount account) async {
    Database db = await open();

    var map = Map<String, dynamic>();
    map[id] = account.id;
    map[name] = account.name;
    map[countNote] = account.countNote;
    map[countRemind] = account.countRemind;

    var result = await db.insert(tableName, map,
        conflictAlgorithm: ConflictAlgorithm.replace);
    return result;
  }

  Future<int> updateAccount(DataAccount account) async {
    Database db = await open();

    var map = Map<String, dynamic>();
    map[id] = account.id;
    map[name] = account.name;
    map[countNote] = account.countNote;
    map[countRemind] = account.countRemind;

    var result = await db.update(tableName, map,
        conflictAlgorithm: ConflictAlgorithm.replace);
    return result;
  }


  Future<DataAccount> getAccount() async {
    Database db = await open();

    List<Map<String, dynamic>> results = await db.query(tableName,
        where: "${this.id} LIKE 0", limit: 1);
    if (results == null || results.length == 0) {
      return null;
    } else {
      var result = results[0];
      return getDataAccountFromRaw(result);
    }
  }

//  Future<List<Weather>> getWeathersFavorite() async {
//    Database db = await open();
//    List<Map<String, dynamic>> results = await db.query(tableName, where: "$favorite = 1");
//    List<Weather> weathers = [];
//    for (Map<String, dynamic> result in results) {
//      weathers.add(getWeatherFromRaw(result));
//    }
//    return weathers;
//  }

  Future<int> removeAccount(DataAccount account) async {
    Database database = await open();
    int result = await database
        .rawDelete("DELETE FROM $tableName WHERE $id = ${account.id};");
    return result;
  }

  DataAccount getDataAccountFromRaw(Map<String, dynamic> result) {
    return DataAccount(
        result[id],
        result[name],
        result[countNote],
        result[countRemind]);
  }
}
