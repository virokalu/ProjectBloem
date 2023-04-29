import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_bloem/application/state/item_state.dart';
import 'package:project_bloem/models/item_filter.dart';
import 'package:project_bloem/models/pagination.dart';

import '../../api/api_service.dart';

class ItemsNotifier extends StateNotifier<ItemsState>{
  final APIService _apiService;
  final ItemFilterModel _filterModel;

  ItemsNotifier(this._apiService,this._filterModel)
      :super(const ItemsState());
  int _page = 1;

  Future<void> getItems() async{
    if(state.isLoading || !state.hasNext){
      return;
    }

    state = state.copyWith(isLoading: true);
    var filterModel = _filterModel.copyWith(
      paginationModel: PaginationModel(
        page: _page,
        pageSize: 10,
      ),
    );
    final items = await _apiService.getItems(filterModel);
    final newItems = [...state.items,...items!];

    if(items.length % 4 != 0 || items.isEmpty){
      state = state.copyWith(hasNext: false);
    }
    state = state.copyWith(items: newItems);
    _page++;
    state = state.copyWith(isLoading: false);
  }

  Future<void>refreshItems() async {
    state = state.copyWith(items: [],hasNext: true);
    _page = 1;
    await getItems();
  }
}