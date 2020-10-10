import 'package:flutter/material.dart';
import 'package:habr_flutter_clean_arch/domain/model/day.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _latController = TextEditingController();
  final _lngController = TextEditingController();

  Day _day;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: Scaffold(
        body: _getBody(),
      ),
    );
  }

  Widget _getBody() {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _getRowInput(),
            SizedBox(height: 20),
            RaisedButton(
              child: Text('Получить'),
              onPressed: _getDay,
            ),
            SizedBox(height: 20),
            if (_day != null) _getDayInfo(_day),
          ],
        ),
      ),
    );
  }

  Widget _getRowInput() {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: _latController,
            keyboardType: TextInputType.numberWithOptions(decimal: true, signed: true),
            decoration: InputDecoration(hintText: 'Широта'),
          ),
        ),
        SizedBox(width: 20),
        Expanded(
          child: TextField(
            controller: _lngController,
            keyboardType: TextInputType.numberWithOptions(decimal: true, signed: true),
            decoration: InputDecoration(hintText: 'Долгота'),
          ),
        ),
      ],
    );
  }

  Widget _getDayInfo(Day day) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text('Восход: ${day.sunrise.toLocal()}'),
        Text('Заход: ${day.sunset.toLocal()}'),
        Text('Полдень: ${day.solarNoon.toLocal()}'),
        Text('Продолжительность: ${Duration(seconds: day.dayLength)}'),
      ],
    );
  }

  void _getDay() {
    // здесь получаем данные
  }
}
