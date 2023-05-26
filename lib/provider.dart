import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_bloem/api/api_service.dart';
import 'package:project_bloem/application/notifier/cart_notifier.dart';
import 'package:project_bloem/application/notifier/item_filter_notifier.dart';
import 'package:project_bloem/application/notifier/item_notifier.dart';
import 'package:project_bloem/application/state/cart_state.dart';
import 'package:project_bloem/application/state/item_state.dart';
import 'package:project_bloem/models/item_filter.dart';

import 'models/item.dart';

final homeItemProvider = FutureProvider.family<List<Item>?, ItemFilterModel>(
    (ref,itemFilterModel){
      //print("Here");

      final apiRespository = ref.watch(apiService);
      return apiRespository.getItems(itemFilterModel);
    }
);

final itemsFilterProvider =
    StateNotifierProvider<ItemFilterNotifier, ItemFilterModel>(
        (ref) => ItemFilterNotifier(),
    );
final itemNotifierProvider =
    StateNotifierProvider<ItemsNotifier, ItemsState>(
        (ref)=>ItemsNotifier(
          ref.watch(apiService),
          ref.watch(itemsFilterProvider),
        ),
    );

final cartItemsProvider = StateNotifierProvider<CartNotifier,CartState>(
        (ref) {
          return CartNotifier(ref.watch(apiService)) ;
        },
);

