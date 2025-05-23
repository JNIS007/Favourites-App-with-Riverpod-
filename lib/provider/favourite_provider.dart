import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/item.dart';
import 'favurite_states.dart';

// Define the provider *after* the class is defined









final favouriteProvider = StateNotifierProvider<FavouriteNotifier, FavouriteState>(
      (ref) => FavouriteNotifier(),
);

// Define the Notifier class properly
class FavouriteNotifier extends StateNotifier<FavouriteState> {
  FavouriteNotifier()
      : super(FavouriteState(allItems: [], filteredItems: [], search: ''));

  void addItem() {
    List<Item> item = [
      Item(name: 'MacBook', favourite: true, id: 1),
      Item(name: 'iPhone', favourite: false, id: 2),
      Item(name: 'G-force 3060', favourite: false, id: 3),
      Item(name: 'Samsung Ultra', favourite: true, id: 4),
      Item(name: 'Google Pixel 9', favourite: false, id: 5),
      Item(name: 'iPad Pro 13', favourite: true, id: 6),
    ];

    state = state.copyWith(
      allItems: item.toList(),
      filteredItems: item.toList(),
    );
  }


  void filterList(String search) {
    state = state.copyWith(
      filteredItems: _filterItems(state.allItems, search),
    );
  }
  void favourite(String option) {
    state = state.copyWith(
      filteredItems: _favouriteItem(state.allItems, option),
    );
  }
  void toggleItemFavourite(int itemId) {
    final updatedAllItems = state.allItems.map((item) {
      if (item.id == itemId) {
        return item.copyWith(favourite: !item.favourite);
      }
      return item;
    }).toList();

    // Apply current filter to get the new filtered list
    List<Item> newFilteredItems;
    if (state.search.isNotEmpty) {
      newFilteredItems = _filterItems(updatedAllItems, state.search);
    } else {
      newFilteredItems = updatedAllItems;
    }

    state = state.copyWith(
      allItems: updatedAllItems,
      filteredItems: newFilteredItems,
    );
  }



  List<Item> _favouriteItem(List<Item> items, String option) {
    if (option == 'All') {
      return items;
    }

    return items
        .where((item) =>
        item.favourite == true )
        .toList();
  }









  List<Item> _filterItems(List<Item> items, String search) {
    if (search.isEmpty) {
      return items;
    }

    return items
        .where((item) =>
        item.name.toLowerCase().contains(search.toLowerCase()))
        .toList();
  }


}
