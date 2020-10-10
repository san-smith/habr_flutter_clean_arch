import 'package:habr_flutter_clean_arch/domain/state/home/home_state.dart';
import 'package:habr_flutter_clean_arch/internal/dependencies/repository_module.dart';

class HomeModule {
  static HomeState homeState() {
    return HomeState(
      RepositoryModule.dayRepository(),
    );
  }
}
