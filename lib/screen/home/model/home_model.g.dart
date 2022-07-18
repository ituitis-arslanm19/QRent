// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeModel _$HomeModelFromJson(Map<String, dynamic> json) => HomeModel(
      id: json['_id'] as int?,
      m2: json['m2'] as int?,
      oda_sayisi: json['oda_sayisi'] as String?,
      x: (json['x'] as num?)?.toDouble(),
      y: (json['y'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$HomeModelToJson(HomeModel instance) => <String, dynamic>{
      '_id': instance.id,
      'm2': instance.m2,
      'oda_sayisi': instance.oda_sayisi,
      'x': instance.x,
      'y': instance.y,
    };
