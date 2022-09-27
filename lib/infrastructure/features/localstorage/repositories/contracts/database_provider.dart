abstract class DataBaseProvider {
  Future<List<String>> get(String key);
  Future<void> put(String key, List<String> value);
  Future<void> delete(String key);
  Future<void> add(String key, List<String> value);
}
