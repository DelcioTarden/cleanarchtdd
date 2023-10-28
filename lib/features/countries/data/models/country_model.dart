import 'package:cleanarchtdd/features/countries/data/models/country_list_model.dart';

class CountryModel {
  bool error;
  String msg;
  final List<CountryListModel>? data;
  
  CountryModel({
    required this.error,
    required this.msg,
    required this.data,
  });

  
  factory CountryModel.fromMap(Map<String, dynamic> map) {
    return CountryModel(
      error: map['error'],
      msg: map['msg'],
      data: map['data']?.map<CountryListModel>((value){
        return CountryListModel.fromMap(value);
      })?.toList(),
    );
  }
  
  Map<String, dynamic> toMap() {
    return {
      'error': error,
      'msg': msg,
      'data': data?.map((value) {
        return value.toMap();
      }).toList(),
    };
  }
}