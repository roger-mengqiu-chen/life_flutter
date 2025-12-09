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

  factory Merchant.fromJson(Map<String, dynamic> json) {
    final merchant = Merchant(
      name: json['name'] as String,
      id: json['id'] as int?,
    );

    if(json.containsKey('location')
        && json['location'] != null
        && json['location'].isNotEmpty) {
      merchant.location = Location.fromJson(json['location']);
    }

    return merchant;

  }

  @override
  String toString() {
    return name;
  }
}