final class JsonProfileTransformer {
  static List<String> listStub(List<String>? value) {
    return value ?? ([] as List<String>);
  }
}
