extension ListExtension<T> on List<T> {
  T? firstWhereOrNull(bool Function(T element) test) {
    final index = indexWhere(test);
    if (index >= 0) {
      return this[index];
    }
    return null;
  }

  T? lastWhereOrNull(bool Function(T element) test) {
    final index = lastIndexWhere(test);
    if (index >= 0) {
      return this[index];
    }
    return null;
  }
}
