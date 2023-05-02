// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'house_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HouseModel _$HouseModelFromJson(Map<String, dynamic> json) => HouseModel(
      id: json['_id'] as int?,
      image:
          (json['image'] as List<dynamic>?)?.map((e) => e as String).toList(),
      title: json['title'] as String?,
      floorNumber: json['floorNumber'] as int?,
      description: json['description'] as String?,
      netM2: json['netM2'] as int?,
      grossM2: json['grossM2'] as int?,
      bathroomNumber: json['bathroomNumber'] as int?,
      bedNumber: json['bedNumber'] as int?,
      airConditioner: json['airConditioner'] as bool?,
      address: json['address'] as String?,
      longitude: (json['longitude'] as num?)?.toDouble(),
      latitude: (json['latitude'] as num?)?.toDouble(),
      roomNumber: json['roomNumber'] as String?,
      userId: (json['userId'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$HouseModelToJson(HouseModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'title': instance.title,
      'floorNumber': instance.floorNumber,
      'description': instance.description,
      'netM2': instance.netM2,
      'grossM2': instance.grossM2,
      'bathroomNumber': instance.bathroomNumber,
      'bedNumber': instance.bedNumber,
      'airConditioner': instance.airConditioner,
      'image': instance.image,
      'address': instance.address,
      'longitude': instance.longitude,
      'latitude': instance.latitude,
      'roomNumber': instance.roomNumber,
      'userId': instance.userId,
    };
