import 'package:flutter_movie_clean/data/model/base_data.dart';
import 'package:flutter_movie_clean/domain/model/base_model.dart';

abstract class BaseMapper<T extends BaseData, R extends BaseModel> {
  R map(T data);

  List<R> mapList(List<T> list) {
    return list.map((e) => map(e)).toList();
  }

  R? mapOrNull(T? data) {
    if (data == null) return null;

    return map(data);
  }

  List<R>? mapNullableList(List<T>? list) {
    return list?.map((e) => map(e)).toList();
  }
}
