import 'package:cleanarchtdd/core/models/exception_model.dart';
import 'package:cleanarchtdd/features/countries/data/models/country_model.dart';
import 'package:cleanarchtdd/features/countries/data/repositories/country_repository.dart';
import 'package:cleanarchtdd/features/countries/data/repositories/country_repository_mock.dart';
import 'package:cleanarchtdd/features/countries/presentation/bloc/country_bloc.dart';
import 'package:test/test.dart';

void main() {
  late CountryBloc countryBloc;
  setUpAll(() {
    countryBloc = CountryBloc(CountryRepositoryMock());
  },);

  tearDownAll(() {
    countryBloc.dispose();
  });

  test('Offline: should retrieve countries and capitals', () async {
    final result = await countryBloc.getCountries();
    result.fold(
      (exception) {
      },
      (countries) {
        expect(countries, isA<CountryModel>());
        expect(countries.data.isNotEmpty, equals(true));
        expect(countries.error, equals(false));
        expect(countries.msg, equals("countries and capitals retrieved"));
      }
    );  
  }, tags: "offline");

  test('Online: should retrieve countries and capitals', () async {
    countryBloc = CountryBloc(CountryRepository());
    final result = await countryBloc.getCountries();
    result.fold(
      (exception) {
        expect(exception, isA<ExceptionModel>());
        expect(exception.msg.isNotEmpty, true);
      },
      (countries) {
        expect(countries, isA<CountryModel>());
        expect(countries.data.isNotEmpty, equals(true));
        expect(countries.error, equals(false));
        expect(countries.msg, equals("countries and capitals retrieved"));
      }
    );  
  }, tags: "online");
}