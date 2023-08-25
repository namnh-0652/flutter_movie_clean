import 'package:data/model/base_data.dart';
import 'package:domain/model/base_model.dart';

abstract class BaseMapper<T extends BaseData, R extends BaseModel> {
  R map(T data);

  List<R> mapList(List<T> list) {
    return list.map((e) => map(e)).toList();
  }

  List<R>? mapNullableList(List<T>? list) {
    return list?.map((e) => map(e)).toList();
  }
}
