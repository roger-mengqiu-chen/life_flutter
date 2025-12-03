import 'package:flutter/material.dart';
import 'package:life_flutter/domain/models/category.dart';
import 'package:life_flutter/ui/categories/viewmodels/category_viewmodel.dart';
import 'package:life_flutter/ui/core/app_bar.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({
    super.key,
    required this.viewmodel});

  final CategoryViewmodel viewmodel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DynamicAppBar(
        title: 'Categories',
        showFilter: false,
        showTools: false
      ),
      body: FutureBuilder(
        future: viewmodel.categories,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          if (snapshot.hasData) {
            final categories = snapshot.data as List<Category>;
            return ListView.builder(
              itemCount: categories.length,
              itemBuilder: (context, index) {
                final category = categories[index];
                return ListTile(
                  title: Text(category.name)
                );
              }
            );
          }
          return const Center(child: Text('Loading...'));
        }
      )
    );
  }
}