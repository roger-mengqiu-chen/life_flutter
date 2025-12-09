class Category {
  Category({
    required this.name,
    this.id
  });

  String name;
  int? id;

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'] as int?,
      name: json['name'] as String,
    );
  }

  @override
  String toString() {
    return name;
  }
}
