import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_bloem/api/api_service.dart';
import 'package:project_bloem/models/item_filter.dart';

import 'models/item.dart';

final homeItemProvider = FutureProvider.family<List<Item>?, ItemFilterModel>(
    (ref,itemFilterModel){
      final apiRespository = ref.watch(apiService);
      return apiRespository.getItems(itemFilterModel);
    }
);