class Person {
  Person({
    this.id,
    required this.firstName,
    this.lastName,
    this.email,
    this.phoneNumber
  });

  int? id;
  String firstName;
  String? lastName;
  String? email;
  String? phoneNumber;

  @override
  String toString() {
    return '$firstName $lastName'.trim();
  }
}
