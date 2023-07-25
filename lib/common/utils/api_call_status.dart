import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_call_status.freezed.dart';

@freezed
class ApiCallStatus<T> with _$ApiCallStatus<T> {
  const ApiCallStatus._();

  const factory ApiCallStatus.notLoaded() = NotLoaded;
  const factory ApiCallStatus.loading(T? previous) = Loading<T>;
  const factory ApiCallStatus.loaded(T result) = Loaded<T>;

  T? get asValue => whenOrNull(
        loaded: (value) => value,
        loading: (previous) => previous,
      );

  bool get isLoading => maybeWhen(
        orElse: () => false,
        loading: (_) => true,
      );
}
