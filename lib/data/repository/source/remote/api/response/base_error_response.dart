import 'package:json_annotation/json_annotation.dart';

part 'base_error_response.g.dart';

@JsonSerializable(createToJson: false)
class BaseErrorResponse {
  const BaseErrorResponse(
    this.success,
    this.statusCode,
    this.statusMessage,
  );

  @JsonKey(name: "success")
  final bool? success;
  @JsonKey(name: "status_code")
  final int? statusCode;
  @JsonKey(name: "status_message")
  final String statusMessage;

  factory BaseErrorResponse.fromJson(Map<String, Object?> json) {
    return _$BaseErrorResponseFromJson(json);
  }
}
