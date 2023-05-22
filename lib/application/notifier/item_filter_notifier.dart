import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_bloem/models/item_filter.dart';
import 'package:project_bloem/models/pagination.dart';

class ItemFilterNotifier extends StateNotifier<ItemFilterModel>{
  ItemFilterNotifier()
  :super(
    ItemFilterModel(
      paginationModel: PaginationModel(
        page: 0,
        pageSize: 10,
      ),
    ),
  );
  void setItemFilter(ItemFilterModel  model){
    state = model;
  }

}