import 'package:meta/meta.dart';
import 'package:habr_flutter_clean_arch/domain/model/day.dart';

abstract class DayRepository {
  Future<Day> getDay({
    @required double latitude,
    @required double longitude,
  });
}
