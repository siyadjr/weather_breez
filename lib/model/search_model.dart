import 'package:hive_flutter/adapters.dart';
 part 'search_model.g.dart';

@HiveType(typeId: 0)
class SearchModel {
  @HiveField(0)
  String id;
  @HiveField(1)
  String searchName;
  SearchModel({required this.id, required this.searchName});
}
