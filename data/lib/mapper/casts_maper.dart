import 'package:data/mapper/base_mapper.dart';
import 'package:data/mapper/cast_mapper.dart';
import 'package:domain/model/casts.dart';
import '../model/casts_data.dart';

class CastsMapper extends BaseMapper<CastsData, Casts> {

  CastsMapper(this.castMapper);

  final CastMapper castMapper;

  @override
  Casts map(CastsData data) {
    return Casts(
        id: data.id,
        cast: castMapper.mapList(data.casts ?? List.empty())
    );
  }
}
