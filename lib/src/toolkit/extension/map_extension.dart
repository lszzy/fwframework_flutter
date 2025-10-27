extension MapExtension on Map<String, dynamic> {
  String safeString(String key) {
    return this[key] != null && this[key] is String ? this[key] : '';
  }

  int safeInt(String key) {
    return this[key] != null && this[key] is int ? this[key] : 0;
  }

  double safeDouble(String key) {
    return this[key] != null && this[key] is num
        ? (this[key] as num).toDouble()
        : .0;
  }

  bool safeBool(String key) {
    return this[key] != null && this[key] is bool ? this[key] : false;
  }

  Map<String, dynamic> safeMap(String key) {
    return this[key] != null && this[key] is Map<String, dynamic>
        ? this[key]
        : {};
  }

  List<T> safeList<T>(String key) {
    return this[key] != null && this[key] is List<dynamic>
        ? this[key].cast<T>()
        : [];
  }
}
