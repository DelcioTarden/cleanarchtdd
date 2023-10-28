import 'package:flutter/material.dart';
import 'package:cleanarchtdd/core/models/base_model.dart';

class ExceptionModel implements Model {
  int? codigo;
  String? title;
  String? msg;

  ExceptionModel({
    @required this.codigo,
    @required this.msg,
    this.title,
  });

  @override
  Map<String, dynamic> toMap(){
    return {
      'codigo': codigo,
      'msg': msg,
      'title': title,
    };
  }

  factory ExceptionModel.fromMap(Map<String, dynamic> map){
    return ExceptionModel(
      codigo: map['codigo'],
      msg: map['msg'],
      title: map['title'],
    );
  }

  @override
  ExceptionModel toCopy() {
    return ExceptionModel.fromMap(toMap());
  }
}