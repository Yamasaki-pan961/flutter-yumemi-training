import 'package:freezed_annotation/freezed_annotation.dart';

part 'result.freezed.dart';

/// A generic class representing the result of an operation that can either be
/// a success or a failure.
///
/// The [Result] class has two type parameters: `T` represents the type of the
/// success value, and `U` represents the type of the failure value.
///
/// This class can be used to handle the result of asynchronous operations that
/// may fail. For example, a network request that may return a success response
/// or an error response.
///
/// The [Result] class uses Flutter's built_value package to generate immutable
/// classes for its success and failure types, [Success] and [Failure], that can
/// be easily pattern matched and handled.
@freezed
class Result<T, U> with _$Result<T, U> {
  /// Creates a new [Result] instance with a success value of type [T].
  const factory Result.success(T value) = Success<T, U>;
  /// Creates a new [Result] instance with a failure value of type [U].
  const factory Result.failure(U value) = Failure<T, U>;
}
