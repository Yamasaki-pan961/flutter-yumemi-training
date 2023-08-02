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
String _$dayWeatherApiCallInitialValueHash() =>
    r'cde6d1bfe4e9e6594ba3cbdb681c88325ac74047';

/// See also [dayWeatherApiCallInitialValue].
@ProviderFor(dayWeatherApiCallInitialValue)
final dayWeatherApiCallInitialValueProvider =
    AutoDisposeProvider<ApiCallStatus<Result<Weather, String>>>.internal(
  dayWeatherApiCallInitialValue,
  name: r'dayWeatherApiCallInitialValueProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$dayWeatherApiCallInitialValueHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef DayWeatherApiCallInitialValueRef
    = AutoDisposeProviderRef<ApiCallStatus<Result<Weather, String>>>;
String _$dayWeatherHash() => r'5a5a21a24e7610e4c712a4159d525e88307292f9';

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
    r'2ffe24749e5cf335eb297d1fde286acdbe91836a';

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
