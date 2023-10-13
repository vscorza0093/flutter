import 'package:calculadoraimc/custom_database.dart';
import 'package:calculadoraimc/sqlite/person_sqlite_model.dart';

class PersonSQLiteRepository {
  Future<List<PersonSQLiteModel>> obtainData() async {
    List<PersonSQLiteModel> persons = [];
    var db = await CustomDatabase().getDatabase();
    var result =
        await db.rawQuery('SELECT id, userId, name, imc FROM personsResults');
    for (var element in result) {
      persons.add(PersonSQLiteModel(int.parse(element['imc'].toString())));
    }
    return persons;
  }

  Future<void> saveData(PersonSQLiteModel person) async {
    var db = await CustomDatabase().getDatabase();
    await db.rawInsert('INSERT INTO persons (imc) values(?)', [person.imc]);
  }
}
