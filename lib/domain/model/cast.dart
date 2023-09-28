import 'base_model.dart';

class Cast extends BaseModel {
  Cast(
      {this.id,
      this.adult,
      this.gender,
      this.knownForDepartment,
      this.name,
      this.originalName,
      this.profilePath,
      this.character});

  final int? id;
  final bool? adult;
  final int? gender;
  final String? knownForDepartment;
  final String? name;
  final String? originalName;
  final String? profilePath;
  final String? character;
}
