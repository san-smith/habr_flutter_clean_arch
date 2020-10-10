import 'package:habr_flutter_clean_arch/data/repository/day_data_repository.dart';
import 'package:habr_flutter_clean_arch/domain/repository/day_repository.dart';

import 'api_module.dart';

class RepositoryModule {
  static DayRepository _dayRepository;

  static DayRepository dayRepository() {
    if (_dayRepository == null) {
      _dayRepository = DayDataRepository(
        ApiModule.apiUtil(),
      );
    }
    return _dayRepository;
  }
}
