import 'package:dartz/dartz.dart';

import '../../../../core/models/exception_model.dart';
import '../../../../core/services/base_service.dart';
import '../../../../core/utils/route_util.dart';
import '../../../../core/utils/text_util.dart';
import '../../domain/repositories/i_country_repository.dart';
import '../models/country_model.dart';

class CountryRepository extends BaseService implements ICountryRepository {
  @override
  Future<Either<ExceptionModel, CountryModel>> getCountries() async {
    ExceptionModel exceptionModel = ExceptionModel(codigo: 0, msg: TextUtil.runtimeErrorText);
    try {
      final String url = await RouteUtil.urlGetCountries;
      Response response = await get(url: url, showServerError: true);
      return Right(CountryModel.fromMap(response.data));
    } on ExceptionModel catch (e) {
      return Left(e);
    } catch (_) {}
    return Left(exceptionModel);
  }
    
}