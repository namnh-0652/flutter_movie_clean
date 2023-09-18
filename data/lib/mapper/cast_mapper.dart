import 'package:data/mapper/base_mapper.dart';
import 'package:data/model/cast_data.dart';
import 'package:domain/model/cast.dart';

class CastMapper extends BaseMapper<CastData, Cast> {
  CastMapper(this.baseImageUrl);

  final String baseImageUrl;

  @override
  Cast map(CastData data) {
    return Cast(
      id: data.id,
      name: data.name,
      adult: data.isAdult,
      character: data.character,
      gender: data.gender,
      knownForDepartment: data.knownForDepartment,
      originalName: data.originalName,
      profilePath: data.profilePath == null ? null : "$baseImageUrl${data.profilePath}"
    );
  }
}
