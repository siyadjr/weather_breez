import 'package:hive_flutter/hive_flutter.dart';
import 'package:weatherbreez/model/search_model.dart';

class SearchDb {
  Future<void> addSearchData(SearchModel searchLocation) async {
    final searchbox = await Hive.openBox<SearchModel>('search_data');
    searchbox.add(searchLocation);
  }

  Future<List<SearchModel>> getAllSearches() async {
    final searchbox = await Hive.openBox<SearchModel>('search_data');
    return searchbox.values.isNotEmpty
        ? searchbox.values.toList().reversed.toList()
        : [];
  }

  Future<void> clearSearch() async {
    final searchbox = await Hive.openBox<SearchModel>('search_data');

    searchbox.clear();
  }
}
