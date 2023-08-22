import 'package:freezed_annotation/freezed_annotation.dart';

part 'base_list_response.g.dart';

@JsonSerializable(createToJson: false, genericArgumentFactories: true)
class BaseListResponse<T> {
  BaseListResponse({
    this.page,
    this.totalPages,
    required this.results,
  });

  @JsonKey(name: "page")
  final int? page;
  @JsonKey(name: "total_pages")
  final int? totalPages;
  @JsonKey(name: "results")
  final List<T> results;

  factory BaseListResponse.fromJson(
    Map<String, Object?> json,
    T Function(Object? json) fromJsonT,
  ) {
    return _$BaseListResponseFromJson<T>(json, fromJsonT);
  }
}
