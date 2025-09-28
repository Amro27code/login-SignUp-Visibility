// import 'package:sqflite/sqflite.dart';
// import 'package:path/path.dart';
// import 'package:text/note.dart';
//
//
// class DbHelper {
//   late Database database;
//
//   openDataBaseFile() async {
//     var databasesPath = await getDatabasesPath();
//     String path = join(databasesPath, 'note_app.db');
//
//     database = await openDatabase(
//       path,
//       version: 1,
//       onCreate: (Database db, int version) async {
//         await db.execute(
//           'CREATE TABLE Note (id INTEGER PRIMARY KEY, text TEXT)',
//         );
//       },
//     );
//   }
//
//   // CRUD operations (create,read,update,delete)
//   insertNote({required String text}) async {
//     await openDataBaseFile();
//     await database.rawInsert("Insert into Note (text) values ('$text')");
//     await database.close();
//   }
//
//   updateNote({required int id, required String text}) async {
//     await openDataBaseFile();
//     await database.rawUpdate("Update Note set text = '$text' where id = $id");
//     await database.close();
//   }
//
//   deleteNote({required int id}) async {
//     await openDataBaseFile();
//     await database.rawDelete("Delete from Note where id = $id");
//     await database.close();
//   }
//
//   Future<List<Note>> getNotes() async {
//     await openDataBaseFile();
//     List<Note> notes = [];
//
//     List<Map> rows = await database.rawQuery("Select * from Note");
//     for(var row in rows){
//       notes.add(Note(id: row['id'], text: row['text']));
//     }
//     await database.close();
//     return notes;
//   }
// }
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'note.dart';

class DbHelper {
  late Database database;

  openDataBaseFile() async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'note_app.db');

    database = await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute(
          'CREATE TABLE Note (id INTEGER PRIMARY KEY, text TEXT)',
        );
      },
    );
  }

  insertNote({required String text}) async {
    await openDataBaseFile();
    await database.rawInsert("Insert into Note (text) values ('$text')");
    await database.close();
  }

  updateNote({required int id, required String text}) async {
    await openDataBaseFile();
    await database.rawUpdate("Update Note set text = '$text' where id = $id");
    await database.close();
  }

  deleteNote({required int id}) async {
    await openDataBaseFile();
    await database.rawDelete("Delete from Note where id = $id");
    await database.close();
  }

  Future<List<Note>> getNotes() async {
    await openDataBaseFile();
    List<Note> notes = [];
    List<Map> raws = await database.rawQuery('Select * from Note');
    for (var raw in raws) {
      notes.add(Note(id: raw['id'], text: raw['text']));
    }
    await database.close();
    return notes;
  }
}
