import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:taskamro/user.dart';

class DbHelperUser {
  late Database _database;

  openDataBaseFile() async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'sign_login.db');

    _database = await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute(
          'CREATE TABLE User (id INTEGER PRIMARY KEY, firstname TEXT,lastname TEXT,email TEXT,password TEXT )',
        );
      },
    );
  }

  Future<int> signUp({
    required String firstname,
    required String lastname,
    required String email,
    required String password,
  }) async {
    await openDataBaseFile();
    int id = await _database.rawInsert(
      "INSERT INTO User (firstname,lastname, email, password) VALUES ('$firstname','$lastname', '$email', '$password')",
    );
    _database.close();
    return id;
  }

  login({required String email, required String password}) async {
    await openDataBaseFile();
    List<Map> users = await _database.rawQuery(
      "SELECT * FROM User WHERE email = '$email' AND password = '$password'",
    );
    await _database.close();
    if (users.isNotEmpty) {
      return User(
        id: users[0]['id'],
        firstname: users[0]['firstname'],
        lastname: users[0]['lastname'],
        email: users[0]['email'],
        password: users[0]['password'],
      );
    } else {
      throw Exception("User Not found");
    }
  }
}
