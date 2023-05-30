import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_training/feature/day_weather/domain/use_case/fetch_day_weather_use_case.dart';
import 'package:flutter_training/feature/day_weather/presentation/presenter/day_weather_provider.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'day_weather_provider_test.mocks.dart';

class Listener<T> extends Mock {
  void call(T? previous, T value);
}

/// Initialize and hold Riverpod containers and listeners
class RiverpodTestTools {
  RiverpodTestTools({required FetchDayWeatherUseCase useCaseMock})
      : container = ProviderContainer(
          overrides: [
            fetchDayWeatherUseCaseProvider.overrideWithValue(useCaseMock)
          ],
        ) {
    addTearDown(container.dispose);

    container.listen<Weather?>(dayWeatherProvider, listener);
  }

  final ProviderContainer container;
  final listener = Listener<Weather?>();
}

@GenerateMocks([FetchDayWeatherUseCase])
void main() {
}
