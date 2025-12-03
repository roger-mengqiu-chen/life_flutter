import 'package:life_flutter/data/repositories/category_repository.dart';
import 'package:life_flutter/domain/models/category.dart';

class CategoryViewmodel {
  CategoryViewmodel({
    required CategoryRepository categoryRepository
  }) : _categoryRepository = categoryRepository;

  final CategoryRepository _categoryRepository;

  Future<List<Category>> get categories async {
    return await _categoryRepository.categories;
  }
}
