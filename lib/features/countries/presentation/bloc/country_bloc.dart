import 'dart:async';

import 'package:rxdart/rxdart.dart';

import '../../../../core/bloc/base_bloc.dart';
import '../../data/models/country_list_model.dart';
import '../../domain/repositories/i_country_repository.dart';

class CountryBloc implements Bloc {
  final ICountryRepository repository;
  
  late BehaviorSubject<List<CountryListModel>> _controllerCountryList;
  Sink <List<CountryListModel>> get _sinkCountryList { return _controllerCountryList.sink; }
  Stream <List<CountryListModel>> get streamCountryList { return _controllerCountryList.stream; }

  late BehaviorSubject<bool> _controllerProcessing;
  Sink<bool> get _sinkProcessing { return _controllerProcessing.sink; }
  Stream<bool> get streamProcessing { return _controllerProcessing.stream; }

  CountryBloc(this.repository) {
    _controllerCountryList = BehaviorSubject <List<CountryListModel>>.seeded([]);
    _controllerProcessing = BehaviorSubject<bool>.seeded(false);
  }

  Future<dynamic> getCountries() async {
    _sinkProcessing.add(true);
    final result = await repository.getCountries();
    result.fold(
      (exception) {
        _controllerProcessing.add(false);
      },
      (countries) {
        _sinkCountryList.add(countries.data ?? []);
        _controllerProcessing.add(false);
      }
    );
    return result; 
  }

  @override
  void dispose() async {
    await _controllerCountryList.close();
    await _controllerProcessing.close();
  }
}