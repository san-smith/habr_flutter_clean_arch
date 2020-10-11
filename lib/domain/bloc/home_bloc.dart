import 'package:habr_flutter_clean_arch/domain/repository/day_repository.dart';
import 'package:meta/meta.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habr_flutter_clean_arch/domain/model/day.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc(this._dayRepository) : super(HomeInitialState());

  final DayRepository _dayRepository;

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    if (event is HomeGetDayEvent) {
      yield* _mapGetDayEventToState(event);
    }
  }

  Stream<HomeState> _mapGetDayEventToState(HomeGetDayEvent event) async* {
    yield HomeLoadingState();
    final day = await _dayRepository.getDay(latitude: event.latitude, longitude: event.longitude);
    yield HomeReadyState(day);
  }
}

// states

abstract class HomeState {}

class HomeInitialState extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeReadyState extends HomeState {
  final Day day;

  HomeReadyState(this.day);
}

// events

abstract class HomeEvent {}

class HomeGetDayEvent extends HomeEvent {
  final double latitude;
  final double longitude;

  HomeGetDayEvent({
    @required this.latitude,
    @required this.longitude,
  });
}
