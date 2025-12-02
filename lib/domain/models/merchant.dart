import 'package:life_flutter/domain/models/location.dart';

class Merchant {
  Merchant({
    required this.name,
    this.id,
    this.location
  });

  String name;
  int? id;
  Location? location;

  @override
  String toString() {
    return name;
  }
}