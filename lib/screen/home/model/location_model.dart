// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

import 'package:qrent/core/base/model/BaseModel.dart';

part 'location_model.g.dart';

@JsonSerializable()
class LocationModel extends BaseModel<LocationModel> {
  int? id;
  double? longitude;
  double? latitude;

  LocationModel({this.id, this.longitude, this.latitude});

  @override
  LocationModel fromJson(Map<String, dynamic> json) {
    return _$LocationModelFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$LocationModelToJson(this);
  }

  @override
  String toString() =>
      'LocationModel(id: $id, longitude: $longitude, latitude: $latitude)';
}
