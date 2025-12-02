import 'package:life_flutter/data/repositories/category_repository.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> get providers {
  return [
    Provider(create: (context) => CategoryRepository()),
  ];

}