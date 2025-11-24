class Location {
  Location({
    required this.name,
    this.streetNo,
    this.streetName,
    this.city,
    this.province,
    this.country
  });

  String name;
  String? streetNo;
  String? streetName;
  String? city;
  String? province;
  String? country;

  @override
  String toString() {
    return name;
  }
}