class Setting {
  Setting({
    this.id,
    required this.name,
    required this.value
  });

  int? id;
  late String name;
  late String value;

  Map<String, dynamic> get entry {
    dynamic result;
    if(value == '1' || value == '0') {
      result = value == '1';
    }
    else {
      result = value;
    }
    return {name: result};
  }

  @override
  String toString() {
    return '$name - $value';
  }
}