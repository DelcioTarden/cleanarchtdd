import '../../../../core/models/base_model.dart';

class CountryListModel implements Model {
  String? name;
  String? capital;
  String? iso2;
  String? iso3;

  CountryListModel({
    this.name,
    this.capital,
    this.iso2,
    this.iso3,
  });

  @override
  Map<String, dynamic> toMap(){
    return {
      'name': name,
      'capital': capital,
      'iso2': iso2,
      'iso3': iso3,
    };
  }

  factory CountryListModel.fromMap(Map<String, dynamic> map){
    return CountryListModel(
      name: map['name'],
      capital: map['capital'],
      iso2: map['iso2'],
      iso3: map['iso3'],
    );
  }

  @override
  CountryListModel toCopy() {
    return CountryListModel.fromMap(toMap());
  }
}