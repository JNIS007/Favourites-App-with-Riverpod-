
import 'package:favapp/model/item.dart';






class FavouriteState {
  final List<Item> allItems;
  final List<Item> filteredItems;
  final String search;

  FavouriteState({
    required this.allItems,
    required this.search,
    required this.filteredItems,
  });

  FavouriteState copyWith({
    List<Item>? allItems,
    List<Item>? filteredItems,
    String? search,
  }) {
    return FavouriteState(
      search: search ?? this.search,
      allItems: allItems ?? this.allItems,
      filteredItems: filteredItems ?? this.filteredItems,
    );
  }
}
