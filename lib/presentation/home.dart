import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habr_flutter_clean_arch/domain/bloc/home_bloc.dart';
import 'package:habr_flutter_clean_arch/internal/dependencies/home_module.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _latController = TextEditingController();
  final _lngController = TextEditingController();

  final _bloc = HomeModule.homeBloc();

  @override
  void dispose() {
    _bloc.close();
    super.dispose();
  }

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
            _getDayInfo(),
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
            autofocus: false,
            keyboardType: TextInputType.numberWithOptions(decimal: true, signed: true),
            decoration: InputDecoration(hintText: 'Широта'),
          ),
        ),
        SizedBox(width: 20),
        Expanded(
          child: TextField(
            controller: _lngController,
            autofocus: false,
            keyboardType: TextInputType.numberWithOptions(decimal: true, signed: true),
            decoration: InputDecoration(hintText: 'Долгота'),
          ),
        ),
      ],
    );
  }

  Widget _getDayInfo() {
    return BlocBuilder<HomeBloc, HomeState>(
      cubit: _bloc,
      builder: (_, state) {
        if (state is HomeLoadingState)
          return Center(
            child: CircularProgressIndicator(),
          );

        if (state is HomeReadyState) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text('Восход: ${state.day.sunrise.toLocal()}'),
              Text('Заход: ${state.day.sunset.toLocal()}'),
              Text('Полдень: ${state.day.solarNoon.toLocal()}'),
              Text('Продолжительность: ${Duration(seconds: state.day.dayLength)}'),
            ],
          );
        }

        return Container();
      },
    );
  }

  void _getDay() {
    // здесь получаем данные
    final lat = double.tryParse(_latController.text);
    final lng = double.tryParse(_lngController.text);
    _bloc.add(HomeGetDayEvent(latitude: lat, longitude: lng));
  }
}
