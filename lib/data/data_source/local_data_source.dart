// how long the cache is valid
const cacheValidityInMs = 60 * 1000; // 1 min

abstract class LocalDataSource {
  Future<dynamic> getCache(String key);

  Future<void> setCache(String key);

  //
  void clearCache();

  void removeFromCache(String key);
}

class LocalDataSourceImplementer implements LocalDataSource {
  // runTimeCache
  Map<String, CachedItem> cacheMap = Map();

  @override
  void clearCache() {
    cacheMap.clear();
  }

  @override
  void removeFromCache(String key) {
    cacheMap.remove(key);
  }

  @override
  Future<dynamic> getCache(String key) async {
    // TODO: implement getCache
    CachedItem? cachedItem = cacheMap[key];

    if (cachedItem != null && cachedItem.isValid(cacheValidityInMs)) {
      return cachedItem.data;
    } else {
      // throw cache error
      return null;
    }
  }

  @override
  Future<void> setCache(String key) {
    // TODO: implement setCache
    throw UnimplementedError();
  }
}

class CachedItem {
  dynamic data;

  int cacheTime = DateTime.now().millisecondsSinceEpoch;

  CachedItem(this.data);
}

extension CachedItemExtension on CachedItem {
  bool isValid(int expirationTime) {
    int currentTimeInMs = DateTime.now().millisecondsSinceEpoch;

    bool isCacheValid = currentTimeInMs - expirationTime < cacheValidityInMs;

    return isCacheValid;
  }
}
