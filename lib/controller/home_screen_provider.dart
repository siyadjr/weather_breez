import 'package:flutter/material.dart';
import 'package:weatherbreez/model/Db/search_db.dart';
import 'package:weatherbreez/model/search_model.dart';

class HomeScreenProvider extends ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  List<SearchModel> _searches = [];
  TextEditingController searchController = TextEditingController();
  List<SearchModel> get previousSearches => _searches;
  Future<void> getSearchHistory() async {
    _isLoading = true;
    notifyListeners();
    _searches = await SearchDb().getAllSearches();
    _isLoading = false;
    notifyListeners();
  }

  Future<void> addSearch(String name) async {
    final search = SearchModel(
        id: DateTime.now().millisecond.toString(), searchName: name);
    SearchDb().addSearchData(search);
    notifyListeners();
  }

  Future<void> clearData() async {
    _searches.clear();
    notifyListeners();
    await SearchDb().clearSearch();
    notifyListeners();
  }

  Future<void> recentToTextfield(String city) async {
    searchController.text = city;
    notifyListeners();
  }
}
