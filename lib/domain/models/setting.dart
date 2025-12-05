class Setting {
  Setting({
    this.id,
    required this.name,
    required this.value,
    required int toggleAttr
  }) : canToggle = toggleAttr == 1;

  int? id;
  late String name;
  late String value;
  late bool canToggle;

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

  void setValue (dynamic newVal) {
    if (newVal is bool && canToggle) {
      value = newVal ? '1' : '0';
    }
    else if (newVal is String) {
      value = newVal;
    }
    else {
      throw ArgumentError('New value should be bool or String');
    }
  }

  @override
  String toString() {
    return '$name - $value';
  }
}