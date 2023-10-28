import 'dart:convert';

import 'package:dartz/dartz.dart';

import '../../../../core/models/exception_model.dart';
import '../../../../core/services/base_service.dart';
import '../../domain/repositories/i_country_repository.dart';
import '../datasources/json_util_countries.dart';
import '../models/country_model.dart';

class CountryRepositoryMock extends BaseService implements ICountryRepository {
  @override
  Future<Either<ExceptionModel, CountryModel>> getCountries() async {
    return Right(CountryModel.fromMap(jsonDecode(await JsonUtilCountries.jsonCountries)));
  } 
}