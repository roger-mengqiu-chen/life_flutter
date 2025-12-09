class Location {
  Location({
    required this.name,
    this.id,
    this.streetNo,
    this.streetName,
    this.city,
    this.province,
    this.country
  });

  String name;
  int? id;
  String? streetNo;
  String? streetName;
  String? city;
  String? province;
  String? country;

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      name: json['name'] as String,
      id: json['id'] as int?,
      streetNo: json['streetNo'] as String?,
      streetName: json['streetName'] as String?,
      city: json['city'] as String?,
      province: json['province'] as String?,
      country: json['country'] as String?,
    );
  }

  @override
  String toString() {
    return name;
  }
}