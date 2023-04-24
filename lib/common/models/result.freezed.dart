// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Result<T, U> {
  Object? get value => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T value) success,
    required TResult Function(U value) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(T value)? success,
    TResult? Function(U value)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T value)? success,
    TResult Function(U value)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Success<T, U> value) success,
    required TResult Function(Failure<T, U> value) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Success<T, U> value)? success,
    TResult? Function(Failure<T, U> value)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Success<T, U> value)? success,
    TResult Function(Failure<T, U> value)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResultCopyWith<T, U, $Res> {
  factory $ResultCopyWith(
          Result<T, U> value, $Res Function(Result<T, U>) then) =
      _$ResultCopyWithImpl<T, U, $Res, Result<T, U>>;
}

/// @nodoc
class _$ResultCopyWithImpl<T, U, $Res, $Val extends Result<T, U>>
    implements $ResultCopyWith<T, U, $Res> {
  _$ResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$SuccessCopyWith<T, U, $Res> {
  factory _$$SuccessCopyWith(
          _$Success<T, U> value, $Res Function(_$Success<T, U>) then) =
      __$$SuccessCopyWithImpl<T, U, $Res>;
  @useResult
  $Res call({T value});
}

/// @nodoc
class __$$SuccessCopyWithImpl<T, U, $Res>
    extends _$ResultCopyWithImpl<T, U, $Res, _$Success<T, U>>
    implements _$$SuccessCopyWith<T, U, $Res> {
  __$$SuccessCopyWithImpl(
      _$Success<T, U> _value, $Res Function(_$Success<T, U>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_$Success<T, U>(
      freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class _$Success<T, U> implements Success<T, U> {
  const _$Success(this.value);

  @override
  final T value;

  @override
  String toString() {
    return 'Result<$T, $U>.success(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Success<T, U> &&
            const DeepCollectionEquality().equals(other.value, value));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(value));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SuccessCopyWith<T, U, _$Success<T, U>> get copyWith =>
      __$$SuccessCopyWithImpl<T, U, _$Success<T, U>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T value) success,
    required TResult Function(U value) failure,
  }) {
    return success(value);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(T value)? success,
    TResult? Function(U value)? failure,
  }) {
    return success?.call(value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T value)? success,
    TResult Function(U value)? failure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Success<T, U> value) success,
    required TResult Function(Failure<T, U> value) failure,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Success<T, U> value)? success,
    TResult? Function(Failure<T, U> value)? failure,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Success<T, U> value)? success,
    TResult Function(Failure<T, U> value)? failure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class Success<T, U> implements Result<T, U> {
  const factory Success(final T value) = _$Success<T, U>;

  @override
  T get value;
  @JsonKey(ignore: true)
  _$$SuccessCopyWith<T, U, _$Success<T, U>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FailureCopyWith<T, U, $Res> {
  factory _$$FailureCopyWith(
          _$Failure<T, U> value, $Res Function(_$Failure<T, U>) then) =
      __$$FailureCopyWithImpl<T, U, $Res>;
  @useResult
  $Res call({U value});
}

/// @nodoc
class __$$FailureCopyWithImpl<T, U, $Res>
    extends _$ResultCopyWithImpl<T, U, $Res, _$Failure<T, U>>
    implements _$$FailureCopyWith<T, U, $Res> {
  __$$FailureCopyWithImpl(
      _$Failure<T, U> _value, $Res Function(_$Failure<T, U>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_$Failure<T, U>(
      freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as U,
    ));
  }
}

/// @nodoc

class _$Failure<T, U> implements Failure<T, U> {
  const _$Failure(this.value);

  @override
  final U value;

  @override
  String toString() {
    return 'Result<$T, $U>.failure(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Failure<T, U> &&
            const DeepCollectionEquality().equals(other.value, value));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(value));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FailureCopyWith<T, U, _$Failure<T, U>> get copyWith =>
      __$$FailureCopyWithImpl<T, U, _$Failure<T, U>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T value) success,
    required TResult Function(U value) failure,
  }) {
    return failure(value);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(T value)? success,
    TResult? Function(U value)? failure,
  }) {
    return failure?.call(value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T value)? success,
    TResult Function(U value)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Success<T, U> value) success,
    required TResult Function(Failure<T, U> value) failure,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Success<T, U> value)? success,
    TResult? Function(Failure<T, U> value)? failure,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Success<T, U> value)? success,
    TResult Function(Failure<T, U> value)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class Failure<T, U> implements Result<T, U> {
  const factory Failure(final U value) = _$Failure<T, U>;

  @override
  U get value;
  @JsonKey(ignore: true)
  _$$FailureCopyWith<T, U, _$Failure<T, U>> get copyWith =>
      throw _privateConstructorUsedError;
}
