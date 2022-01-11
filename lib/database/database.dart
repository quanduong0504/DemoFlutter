import 'package:exercise_example/models/product.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class ProductionDB {
  ProductionDB._();
  static final String dbName = "product.db";
  static final String productTableName = "Product";

  static final ProductionDB db = ProductionDB._();
  static Database? _database;

  Future<Database> get database async => _database ??= await initDb();

  initDb() async {
    String dbPath = await getDatabasesPath();
    String path = join(dbPath, dbName);
    return await openDatabase(path, version: 1, onOpen: (db) async {
      await db.execute(""
          "CREATE TABLE Product ("
          "id INTEGER PRIMARY KEY,"
          "title TEXT,"
          "subTitle TEXT,"
          "name TEXT,"
          "price TEXT,"
          "isFavorite INTEGER"
          ")");
    });
  }

  insert(Production production) async {
    final db = await database;
    final maxIdResult =
        await db.rawQuery("SELECT MAX(id)+1 as last_inserted_id FROM $productTableName");
    final id = maxIdResult.first["last_inserted_id"];
    await db.rawInsert(
      "INSERT INTO Product (id, title, subTitle, name, price, isFavorite)"
      " VALUES (?, ?, ?, ?, ?, ?)",
      [id, production.title, production.subTitle, production.name, production.price, production.isFavorite ? 1 : 2]
    );
    production.id = id! as int;
    return production;
  }

  update(Production production) async {
    final db = await database;
    final result = await db.update(productTableName, production.toJson(),
                         where: "id = ?", whereArgs: [production.id]);
    return result == 1 ? true : false;
  }

  delete(Production production) async {
    final db = await database;
    final result = await db.delete(productTableName, where: "id = ?", whereArgs: [production.id]);
    return result == 1 ? true : false;
  }

  Future<List<Production>> getProducts() async {
    final db = await database;
    List<Map> results = await db.query("Product", columns: Production.columns, orderBy: "id ASC");

    results.map((e) => print(e));

    return results.map((e) => Production.fromJson(e)).toList();
  }
}