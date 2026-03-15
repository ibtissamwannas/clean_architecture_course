import 'dart:async';

class Article {
  final String id;
  final String title;
  final String content;

  Article(this.id, this.title, this.content);
}

abstract class Fetchable {
  Future<List<Article>> fetchAll();

  Future<Article> fetchById(String id);
}

abstract class Writable {
  Future<void> create(Article article);
}

abstract class Updateable {
  Future<void> update(Article article);
}

abstract class Deleteable {
  Future<void> delete(String id);
}

abstract class Clearable {
  Future<void> clearAll();
}

class RemoteApiDataSource
    implements Fetchable, Writable, Updateable, Deleteable {
  @override
  Future<List<Article>> fetchAll() async {
    print('Fetching articles from API...');
    return [];
  }

  @override
  Future<Article> fetchById(String id) async {
    print('Fetching article $id from API...');
    return Article(id, 'Title', 'Content');
  }

  @override
  Future<void> create(Article article) async {
    print('Creating article on server...');
  }

  @override
  Future<void> update(Article article) async {
    print('Updating article on server...');
  }

  @override
  Future<void> delete(String id) async {
    print('Deleting article from server...');
  }
}

class ReadOnlyConfigSource implements Fetchable {
  final List<Article> _bundledData = [
    Article('1', 'Welcome', 'Welcome to the app'),
    Article('2', 'Tutorial', 'How to use this app'),
  ];

  @override
  Future<List<Article>> fetchAll() async {
    print('Reading bundled config...');
    return _bundledData;
  }

  @override
  Future<Article> fetchById(String id) async {
    return _bundledData.firstWhere((a) => a.id == id);
  }
}

class CacheDataSource
    implements Fetchable, Writable, Updateable, Clearable, Deleteable {
  final Map<String, Article> _cache = {};

  @override
  Future<List<Article>> fetchAll() async {
    print('Fetching from cache...');
    return _cache.values.toList();
  }

  @override
  Future<Article> fetchById(String id) async {
    return _cache[id]!;
  }

  @override
  Future<void> create(Article article) async {
    _cache[article.id] = article;
    print('Article cached');
  }

  @override
  Future<void> update(Article article) async {
    _cache[article.id] = article;
  }

  @override
  Future<void> delete(String id) async {
    _cache.remove(id);
  }

  @override
  Future<void> clearAll() async {
    _cache.clear();
    print('Cache cleared');
  }
}

class ReadonlyReposioty{
  final Fetchable fetchable;

  ReadonlyReposioty(this.fetchable);

  Future<List<Article>> getArticles() async {
    return await fetchable.fetchAll();
  }

  Future<Article> getArticleById(String id) async {
    return await fetchable.fetchById(id);
  }
}

class WriteableRepository{
  final Writable writable;

  WriteableRepository(this.writable);

  Future<void> saveArticle(Article article) async {
    try {
      await writable.create(article);
    } catch (e) {
      print('This data source does not support saving: $e');
    }
  }
}

class UpdateableRepository{
  final Updateable updateable;

  UpdateableRepository(this.updateable);

  Future<void> updateArticle(Article article) async {
    try {
      await updateable.update(article);
    } catch (e) {
      print('This data source does not support updating: $e');
    }
  }
}

class DeleteableRepository{
  final Deleteable deleteable;

  DeleteableRepository(this.deleteable);

  Future<void> deleteArticle(String id) async {
    try {
      await deleteable.delete(id);
    } catch (e) {
      print('This data source does not support deletion: $e');
    }
  }
}

class ClearableRepository{
  final Clearable clearable;

  ClearableRepository(this.clearable);

  Future<void> clearCache() async {
    try {
      await clearable.clearAll();
    } catch (e) {
      print('This data source does not support clearing: $e');
    }
  }
}


void main() async {
  var api = RemoteApiDataSource();
  var config = ReadOnlyConfigSource();
  var cache = CacheDataSource();

  var apiRepo = ArticleRepository(api);
  var configRepo = ReadonlyReposioty(config);
  var cacheRepo = ClearableRepository(cache);

  print('=== Testing API Source ===');
  await apiRepo.getArticles();
  await apiRepo.saveArticle(Article('3', 'New', 'Content'));
  await apiRepo.clearCache();

  print('\n=== Testing Config Source ===');
  await configRepo.getArticles();

  print('\n=== Testing Cache Source ===');
  await cacheRepo.saveArticle(Article('5', 'Cached', 'Item'));
  await cacheRepo.clearCache();

  print('\nBut notice all the exception handling needed!');
}
