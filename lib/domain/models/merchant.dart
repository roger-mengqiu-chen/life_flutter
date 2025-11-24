import 'package:life_flutter/domain/models/location.dart';

class Merchant {
  Merchant({required this.name, this.location});

  String name;
  Location? location;

  @override
  String toString() {
    return name;
  }
}