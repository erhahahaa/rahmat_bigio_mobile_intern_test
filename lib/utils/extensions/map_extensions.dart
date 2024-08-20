extension MapExtensions<Key, Value> on Map<Key, Value> {
  Map<Key, Value> removeNullValues() {
    removeWhere((key, value) => value == null);
    return this;
  }
}
