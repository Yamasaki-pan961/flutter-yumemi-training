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
String _$dayWeatherHash() => r'15f84d841c3b0c8536e27e37e30846e481af1436';

/// See also [DayWeather].
@ProviderFor(DayWeather)
final dayWeatherProvider =
    AutoDisposeAsyncNotifierProvider<DayWeather, Weather?>.internal(
  DayWeather.new,
  name: r'dayWeatherProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$dayWeatherHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$DayWeather = AutoDisposeAsyncNotifier<Weather?>;
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
