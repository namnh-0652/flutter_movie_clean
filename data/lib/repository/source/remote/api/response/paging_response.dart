import 'package:freezed_annotation/freezed_annotation.dart';

part 'paging_response.g.dart';

@JsonSerializable(createToJson: false, genericArgumentFactories: true)
class PagingResponse<T> {
  PagingResponse({
    required this.page,
    required this.totalPages,
    required this.results,
  });

  @JsonKey(name: "page")
  final int page;
  @JsonKey(name: "total_pages")
  final int totalPages;
  @JsonKey(name: "results")
  final List<T> results;

  factory PagingResponse.fromJson(
    Map<String, Object?> json,
    T Function(Object? json) fromJsonT,
  ) {
    return _$PagingResponseFromJson<T>(json, fromJsonT);
  }
}
