import 'package:mobx/mobx.dart';
import 'package:meta/meta.dart';
import 'package:habr_flutter_clean_arch/domain/repository/day_repository.dart';
import 'package:habr_flutter_clean_arch/domain/model/day.dart';

part 'home_state.g.dart';

class HomeState = HomeStateBase with _$HomeState;

abstract class HomeStateBase with Store {
  HomeStateBase(this._dayRepository);

  final DayRepository _dayRepository;

  @observable
  Day day;

  @observable
  bool isLoading = false;

  @action
  Future<void> getDay({
    @required double latitude,
    @required double longitude,
  }) async {
    isLoading = true;
    final data = await _dayRepository.getDay(latitude: latitude, longitude: longitude);
    day = data;
    isLoading = false;
  }
}
