import 'package:cleanarchtdd/features/countries/data/repositories/country_repository.dart';
import 'package:cleanarchtdd/features/countries/data/repositories/country_repository_mock.dart';
import 'package:cleanarchtdd/features/countries/presentation/bloc/country_bloc.dart';
import 'package:test/test.dart';

void main() {
  test('Mock: should retrieve countries and capitals', () async {
    final CountryBloc countryBloc = CountryBloc(CountryRepositoryMock());
    final result = await countryBloc.getCountries();
    result.fold(
      (exception) {},
      (countries) {
        expect(countries.data, isNotEmpty);
        expect(countries.error, false);
        expect(countries.msg, "countries and capitals retrieved");
      }
    );  
    countryBloc.dispose();
  });

  test('API Integration: should retrieve countries and capitals', () async {
    final CountryBloc countryBloc = CountryBloc(CountryRepository());
    final result = await countryBloc.getCountries();
    result.fold(
      (exception) {},
      (countries) {
        expect(countries.data, isNotEmpty);
        expect(countries.error, false);
        expect(countries.msg, "countries and capitals retrieved");
      }
    );  
    countryBloc.dispose();
  });
}