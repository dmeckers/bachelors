extension MapExtensions on Map<String, dynamic> {
  // flatten multidimensional map to single level map
  Map<String, dynamic> flatten() {
    var result = <String, dynamic>{};

    for (var element in entries) {
      if (element.value is Map) {
        result.addAll((element.value as Map<String, dynamic>).flatten());
      } else {
        result[element.key.toString()] = element.value;
      }
    }
    return result;
  }

  Map<String, dynamic> toArrayByKey(String key) {
    this[key] = [this[key]];
    return this;
  }

  Map<String, dynamic> replaceWithNullIfEmpty({required String key}) {
    this[key] = (this[key] as Map).isEmpty ? null : this[key];
    return this;
  }

  Map<String, dynamic> renameKey({
    required String oldKey,
    required String newKey,
  }) {
    this[newKey] = this[oldKey];
    remove(oldKey);
    return this;
  }

  Map<String, dynamic> renameKeyWithValue({
    required String oldKey,
    required String newKey,
    required dynamic value,
  }) {
    this[newKey] = value;
    remove(oldKey);
    return this;
  }

  Map<String, dynamic> replaceKeyValue({
    required String key,
    required dynamic value,
  }) {
    this[key] = value;
    return this;
  }

  Map<String, dynamic> castToInt({required String key}) {
    this[key] = int.parse(this[key]);
    return this;
  }

  Map<String, dynamic> castToBool({required String key}) {
    this[key] = this[key] == 1;
    return this;
  }
}
