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
String _$dayWeatherHash() => r'c9bd0b96015abbd03a86791fa7b005990a819e73';

/// See also [dayWeather].
@ProviderFor(dayWeather)
final dayWeatherProvider = AutoDisposeProvider<Weather?>.internal(
  dayWeather,
  name: r'dayWeatherProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$dayWeatherHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef DayWeatherRef = AutoDisposeProviderRef<Weather?>;
String _$dayWeatherApiCallStateHash() =>
    r'db8ad8bad08204c77bdf569857fa1d752c769925';

/// See also [DayWeatherApiCallState].
@ProviderFor(DayWeatherApiCallState)
final dayWeatherApiCallStateProvider = AutoDisposeNotifierProvider<
    DayWeatherApiCallState, ApiCallStatus<Result<Weather, String>>>.internal(
  DayWeatherApiCallState.new,
  name: r'dayWeatherApiCallStateProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$dayWeatherApiCallStateHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$DayWeatherApiCallState
    = AutoDisposeNotifier<ApiCallStatus<Result<Weather, String>>>;
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
