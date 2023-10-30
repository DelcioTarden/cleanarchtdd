import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

import '../../../../core/bloc/base_bloc.dart';
import '../../../../core/services/app_service.dart';
import '../../../../core/utils/show_top_snack_bar_helper.dart';
import '../../../../core/utils/text_util.dart';
import '../../data/models/country_list_model.dart';
import '../../domain/repositories/i_country_repository.dart';

class CountryBloc implements Bloc {
  final ICountryRepository repository;
  BuildContext? context;
  
  late BehaviorSubject<List<CountryListModel>> _controllerCountryList;
  Sink <List<CountryListModel>> get _sinkCountryList { return _controllerCountryList.sink; }
  Stream <List<CountryListModel>> get streamCountryList { return _controllerCountryList.stream; }

  late BehaviorSubject<bool> _controllerProcessing;
  Sink<bool> get _sinkProcessing { return _controllerProcessing.sink; }
  Stream<bool> get streamProcessing { return _controllerProcessing.stream; }

  CountryBloc(this.repository, {this.context}) {
    _controllerCountryList = BehaviorSubject <List<CountryListModel>>.seeded([]);
    _controllerProcessing = BehaviorSubject<bool>.seeded(false);
  }

  Future<dynamic> getCountries() async {
    _sinkProcessing.add(true);
    final result = await repository.getCountries();
    result.fold(
      (exception) {
        _controllerProcessing.add(false);
        ShowTopSnackBarHelper.showCustomTopSnackBar(3, exception.msg ?? TextUtil.connectionErrorText, context ?? AppService.instance.context);
      },
      (countries) {
        if(countries.error == true) ShowTopSnackBarHelper.showCustomTopSnackBar(3, TextUtil.noCountrieFoundText, context ?? AppService.instance.context);
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