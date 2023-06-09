// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, implicit_dynamic_parameter, implicit_dynamic_type, implicit_dynamic_method, strict_raw_type

part of 'day_weather_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$dayWeatherRepositoryHash() =>
    r'800513a880570ab92535b55a15a05511c13ef2e3';

/// See also [dayWeatherRepository].
@ProviderFor(dayWeatherRepository)
final dayWeatherRepositoryProvider = Provider<DayWeatherRepository>.internal(
  dayWeatherRepository,
  name: r'dayWeatherRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$dayWeatherRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef DayWeatherRepositoryRef = ProviderRef<DayWeatherRepository>;
String _$fetchDayWeatherUseCaseHash() =>
    r'ab21df3d485b70b19299197aee9a70ba92362dc2';

/// See also [fetchDayWeatherUseCase].
@ProviderFor(fetchDayWeatherUseCase)
final fetchDayWeatherUseCaseProvider =
    Provider<FetchDayWeatherUseCase>.internal(
  fetchDayWeatherUseCase,
  name: r'fetchDayWeatherUseCaseProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$fetchDayWeatherUseCaseHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FetchDayWeatherUseCaseRef = ProviderRef<FetchDayWeatherUseCase>;
String _$dayWeatherHash() => r'184e57f63da2925dd88089bb9782937770757fa3';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$DayWeather extends BuildlessAutoDisposeNotifier<Weather?> {
  late final Weather? initialValue;

  Weather? build({
    Weather? initialValue,
  });
}

/// See also [DayWeather].
@ProviderFor(DayWeather)
const dayWeatherProvider = DayWeatherFamily();

/// See also [DayWeather].
class DayWeatherFamily extends Family<Weather?> {
  /// See also [DayWeather].
  const DayWeatherFamily();

  /// See also [DayWeather].
  DayWeatherProvider call({
    Weather? initialValue,
  }) {
    return DayWeatherProvider(
      initialValue: initialValue,
    );
  }

  @override
  DayWeatherProvider getProviderOverride(
    covariant DayWeatherProvider provider,
  ) {
    return call(
      initialValue: provider.initialValue,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'dayWeatherProvider';
}

/// See also [DayWeather].
class DayWeatherProvider
    extends AutoDisposeNotifierProviderImpl<DayWeather, Weather?> {
  /// See also [DayWeather].
  DayWeatherProvider({
    this.initialValue,
  }) : super.internal(
          () => DayWeather()..initialValue = initialValue,
          from: dayWeatherProvider,
          name: r'dayWeatherProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$dayWeatherHash,
          dependencies: DayWeatherFamily._dependencies,
          allTransitiveDependencies:
              DayWeatherFamily._allTransitiveDependencies,
        );

  final Weather? initialValue;

  @override
  bool operator ==(Object other) {
    return other is DayWeatherProvider && other.initialValue == initialValue;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, initialValue.hashCode);

    return _SystemHash.finish(hash);
  }

  @override
  Weather? runNotifierBuild(
    covariant DayWeather notifier,
  ) {
    return notifier.build(
      initialValue: initialValue,
    );
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
