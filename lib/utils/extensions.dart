extension StringCasingExtension on String {
  String toCapitalized() {
    return isNotEmpty ? '${this[0].toUpperCase()}${this.substring(1).toLowerCase()}' : '';
  }

  String toTitleCase() {
    return replaceAll(RegExp(' +'), ' ').split(' ').map((str) => str.toCapitalized()).join(' ');
  }
}
