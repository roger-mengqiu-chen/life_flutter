import 'package:life_flutter/data/services/db.dart';
import 'package:life_flutter/domain/models/category.dart';

class CategoryRepository {
  CategoryRepository({required DB db}) : _db = db;
  final DB _db;

  Future<List<Category>> get categories async {
    List<Map<String, dynamic>> res = await _db.query(
      'SELECT * FROM category ORDER BY name'
    );
    return res.map((e) => Category.fromJson(e)).toList();
  }
}