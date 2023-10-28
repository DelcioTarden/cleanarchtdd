import 'package:dartz/dartz.dart';

import '../../../../core/models/exception_model.dart';
import '../../data/models/country_model.dart';

abstract class ICountryRepository{
  Future<Either<ExceptionModel, CountryModel>> getCountries();
}