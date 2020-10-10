import 'package:meta/meta.dart';

class GetDayBody {
  final double latitude;
  final double longitude;

  GetDayBody({
    @required this.latitude,
    @required this.longitude,
  });

  Map<String, dynamic> toApi() {
    return {
      'lat': latitude,
      'lng': longitude,
      'formatted': 0,
    };
  }
}
