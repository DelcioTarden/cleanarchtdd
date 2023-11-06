import 'package:cleanarchtdd/core/models/exception_model.dart';
import 'package:cleanarchtdd/features/countries/data/models/country_model.dart';
import 'package:cleanarchtdd/features/countries/data/repositories/country_repository.dart';
import 'package:cleanarchtdd/features/countries/data/repositories/country_repository_mock.dart';
import 'package:test/test.dart';

void main() {
  late CountryRepository countryRepository;
  late CountryRepositoryMock countryRepositoryMock;
  setUpAll(() {
    countryRepository = CountryRepository();
    countryRepositoryMock = CountryRepositoryMock();
  },);

  test('Offline: should retrieve countries and capitals', () async {
    final result = await countryRepositoryMock.getCountries();
    result.fold(
      (exception) {
      },
      (countries) {
        expect(countries, isA<CountryModel>());
        expect(countries.data!.isNotEmpty, equals(true));
        expect(countries.error, equals(false));
        expect(countries.msg, equals("countries and capitals retrieved"));
      }
    );  
  }, tags: "offline");

  test('Online: should retrieve countries and capitals', () async {
    final result = await countryRepository.getCountries();
    result.fold(
      (exception) {
        expect(exception, isA<ExceptionModel>());
        expect(exception.msg!.isNotEmpty, true);
      },
      (countries) {
        expect(countries, isA<CountryModel>());
        expect(countries.data!.isNotEmpty, equals(true));
        expect(countries.error, equals(false));
        expect(countries.msg, equals("countries and capitals retrieved"));
      }
    );  
  }, tags: "online");
}