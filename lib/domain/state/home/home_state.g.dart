// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeState on HomeStateBase, Store {
  final _$dayAtom = Atom(name: 'HomeStateBase.day');

  @override
  Day get day {
    _$dayAtom.reportRead();
    return super.day;
  }

  @override
  set day(Day value) {
    _$dayAtom.reportWrite(value, super.day, () {
      super.day = value;
    });
  }

  final _$isLoadingAtom = Atom(name: 'HomeStateBase.isLoading');

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  final _$getDayAsyncAction = AsyncAction('HomeStateBase.getDay');

  @override
  Future<void> getDay({@required double latitude, @required double longitude}) {
    return _$getDayAsyncAction
        .run(() => super.getDay(latitude: latitude, longitude: longitude));
  }

  @override
  String toString() {
    return '''
day: ${day},
isLoading: ${isLoading}
    ''';
  }
}
