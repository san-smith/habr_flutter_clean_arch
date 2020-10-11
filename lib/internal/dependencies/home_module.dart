import 'package:habr_flutter_clean_arch/domain/bloc/home_bloc.dart';
import 'package:habr_flutter_clean_arch/internal/dependencies/repository_module.dart';

class HomeModule {
  static HomeBloc homeBloc() {
    return HomeBloc(
      RepositoryModule.dayRepository(),
    );
  }
}
