// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'api_call_status.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ApiCallStatus<T> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() notLoaded,
    required TResult Function(T? previous) loading,
    required TResult Function(T result) loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? notLoaded,
    TResult? Function(T? previous)? loading,
    TResult? Function(T result)? loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? notLoaded,
    TResult Function(T? previous)? loading,
    TResult Function(T result)? loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NotLoaded<T> value) notLoaded,
    required TResult Function(Loading<T> value) loading,
    required TResult Function(Loaded<T> value) loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NotLoaded<T> value)? notLoaded,
    TResult? Function(Loading<T> value)? loading,
    TResult? Function(Loaded<T> value)? loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NotLoaded<T> value)? notLoaded,
    TResult Function(Loading<T> value)? loading,
    TResult Function(Loaded<T> value)? loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApiCallStatusCopyWith<T, $Res> {
  factory $ApiCallStatusCopyWith(
          ApiCallStatus<T> value, $Res Function(ApiCallStatus<T>) then) =
      _$ApiCallStatusCopyWithImpl<T, $Res, ApiCallStatus<T>>;
}

/// @nodoc
class _$ApiCallStatusCopyWithImpl<T, $Res, $Val extends ApiCallStatus<T>>
    implements $ApiCallStatusCopyWith<T, $Res> {
  _$ApiCallStatusCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$NotLoadedCopyWith<T, $Res> {
  factory _$$NotLoadedCopyWith(
          _$NotLoaded<T> value, $Res Function(_$NotLoaded<T>) then) =
      __$$NotLoadedCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$NotLoadedCopyWithImpl<T, $Res>
    extends _$ApiCallStatusCopyWithImpl<T, $Res, _$NotLoaded<T>>
    implements _$$NotLoadedCopyWith<T, $Res> {
  __$$NotLoadedCopyWithImpl(
      _$NotLoaded<T> _value, $Res Function(_$NotLoaded<T>) _then)
      : super(_value, _then);
}

/// @nodoc

class _$NotLoaded<T> implements NotLoaded<T> {
  const _$NotLoaded();

  @override
  String toString() {
    return 'ApiCallStatus<$T>.notLoaded()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$NotLoaded<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() notLoaded,
    required TResult Function(T? previous) loading,
    required TResult Function(T result) loaded,
  }) {
    return notLoaded();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? notLoaded,
    TResult? Function(T? previous)? loading,
    TResult? Function(T result)? loaded,
  }) {
    return notLoaded?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? notLoaded,
    TResult Function(T? previous)? loading,
    TResult Function(T result)? loaded,
    required TResult orElse(),
  }) {
    if (notLoaded != null) {
      return notLoaded();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NotLoaded<T> value) notLoaded,
    required TResult Function(Loading<T> value) loading,
    required TResult Function(Loaded<T> value) loaded,
  }) {
    return notLoaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NotLoaded<T> value)? notLoaded,
    TResult? Function(Loading<T> value)? loading,
    TResult? Function(Loaded<T> value)? loaded,
  }) {
    return notLoaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NotLoaded<T> value)? notLoaded,
    TResult Function(Loading<T> value)? loading,
    TResult Function(Loaded<T> value)? loaded,
    required TResult orElse(),
  }) {
    if (notLoaded != null) {
      return notLoaded(this);
    }
    return orElse();
  }
}

abstract class NotLoaded<T> implements ApiCallStatus<T> {
  const factory NotLoaded() = _$NotLoaded<T>;
}

/// @nodoc
abstract class _$$LoadingCopyWith<T, $Res> {
  factory _$$LoadingCopyWith(
          _$Loading<T> value, $Res Function(_$Loading<T>) then) =
      __$$LoadingCopyWithImpl<T, $Res>;
  @useResult
  $Res call({T? previous});
}

/// @nodoc
class __$$LoadingCopyWithImpl<T, $Res>
    extends _$ApiCallStatusCopyWithImpl<T, $Res, _$Loading<T>>
    implements _$$LoadingCopyWith<T, $Res> {
  __$$LoadingCopyWithImpl(
      _$Loading<T> _value, $Res Function(_$Loading<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? previous = freezed,
  }) {
    return _then(_$Loading<T>(
      freezed == previous
          ? _value.previous
          : previous // ignore: cast_nullable_to_non_nullable
              as T?,
    ));
  }
}

/// @nodoc

class _$Loading<T> implements Loading<T> {
  const _$Loading(this.previous);

  @override
  final T? previous;

  @override
  String toString() {
    return 'ApiCallStatus<$T>.loading(previous: $previous)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Loading<T> &&
            const DeepCollectionEquality().equals(other.previous, previous));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(previous));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadingCopyWith<T, _$Loading<T>> get copyWith =>
      __$$LoadingCopyWithImpl<T, _$Loading<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() notLoaded,
    required TResult Function(T? previous) loading,
    required TResult Function(T result) loaded,
  }) {
    return loading(previous);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? notLoaded,
    TResult? Function(T? previous)? loading,
    TResult? Function(T result)? loaded,
  }) {
    return loading?.call(previous);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? notLoaded,
    TResult Function(T? previous)? loading,
    TResult Function(T result)? loaded,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(previous);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NotLoaded<T> value) notLoaded,
    required TResult Function(Loading<T> value) loading,
    required TResult Function(Loaded<T> value) loaded,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NotLoaded<T> value)? notLoaded,
    TResult? Function(Loading<T> value)? loading,
    TResult? Function(Loaded<T> value)? loaded,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NotLoaded<T> value)? notLoaded,
    TResult Function(Loading<T> value)? loading,
    TResult Function(Loaded<T> value)? loaded,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class Loading<T> implements ApiCallStatus<T> {
  const factory Loading(final T? previous) = _$Loading<T>;

  T? get previous;
  @JsonKey(ignore: true)
  _$$LoadingCopyWith<T, _$Loading<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadedCopyWith<T, $Res> {
  factory _$$LoadedCopyWith(
          _$Loaded<T> value, $Res Function(_$Loaded<T>) then) =
      __$$LoadedCopyWithImpl<T, $Res>;
  @useResult
  $Res call({T result});
}

/// @nodoc
class __$$LoadedCopyWithImpl<T, $Res>
    extends _$ApiCallStatusCopyWithImpl<T, $Res, _$Loaded<T>>
    implements _$$LoadedCopyWith<T, $Res> {
  __$$LoadedCopyWithImpl(_$Loaded<T> _value, $Res Function(_$Loaded<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? result = freezed,
  }) {
    return _then(_$Loaded<T>(
      freezed == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class _$Loaded<T> implements Loaded<T> {
  const _$Loaded(this.result);

  @override
  final T result;

  @override
  String toString() {
    return 'ApiCallStatus<$T>.loaded(result: $result)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Loaded<T> &&
            const DeepCollectionEquality().equals(other.result, result));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(result));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadedCopyWith<T, _$Loaded<T>> get copyWith =>
      __$$LoadedCopyWithImpl<T, _$Loaded<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() notLoaded,
    required TResult Function(T? previous) loading,
    required TResult Function(T result) loaded,
  }) {
    return loaded(result);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? notLoaded,
    TResult? Function(T? previous)? loading,
    TResult? Function(T result)? loaded,
  }) {
    return loaded?.call(result);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? notLoaded,
    TResult Function(T? previous)? loading,
    TResult Function(T result)? loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(result);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NotLoaded<T> value) notLoaded,
    required TResult Function(Loading<T> value) loading,
    required TResult Function(Loaded<T> value) loaded,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NotLoaded<T> value)? notLoaded,
    TResult? Function(Loading<T> value)? loading,
    TResult? Function(Loaded<T> value)? loaded,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NotLoaded<T> value)? notLoaded,
    TResult Function(Loading<T> value)? loading,
    TResult Function(Loaded<T> value)? loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class Loaded<T> implements ApiCallStatus<T> {
  const factory Loaded(final T result) = _$Loaded<T>;

  T get result;
  @JsonKey(ignore: true)
  _$$LoadedCopyWith<T, _$Loaded<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
