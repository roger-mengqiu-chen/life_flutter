class Category {
  Category({
    required this.name,
    this.id
  });

  String name;
  int? id;

  @override
  String toString() {
    return name;
  }
}
