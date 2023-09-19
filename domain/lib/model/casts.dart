import 'package:domain/model/base_model.dart';
import 'package:domain/model/cast.dart';

class Casts extends BaseModel {
  Casts({
    this.id,
    this.cast,
  });

  final int? id;
  final List<Cast>? cast;
}
