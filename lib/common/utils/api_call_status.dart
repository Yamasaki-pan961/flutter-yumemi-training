import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_call_status.freezed.dart';

@freezed
class ApiCallStatus<T> with _$ApiCallStatus<T> {
  const factory ApiCallStatus.notLoaded() = NotLoaded;
  const factory ApiCallStatus.loading(T? previous) = Loading<T>;
  const factory ApiCallStatus.loaded(T result) = Loaded<T>;
}
