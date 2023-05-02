// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:json_annotation/json_annotation.dart';

import 'package:qrent/core/base/model/BaseModel.dart';

part 'house_model.g.dart';

@JsonSerializable()
class HouseModel extends BaseModel<HouseModel> {
  @JsonKey(name: '_id')
  int? id;
  String? title;
  int? floorNumber;
  String? description;
  //Date advertDate;
  int? netM2;
  int? grossM2;
  int? bathroomNumber;
  int? bedNumber;
  bool? airConditioner;
  //List<Date> disabledDate;
  List<String>? image;

  String? address;
  double? longitude;
  double? latitude;
  String? roomNumber;

  double? userId;

  HouseModel(
      {this.id,
      this.image,
      this.title,
      this.floorNumber,
      this.description,
      this.netM2,
      this.grossM2,
      this.bathroomNumber,
      this.bedNumber,
      this.airConditioner,
      //this.images,
      this.address,
      this.longitude,
      this.latitude,
      this.roomNumber,
      this.userId});

  @override
  HouseModel fromJson(Map<String, dynamic> json) {
    return _$HouseModelFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$HouseModelToJson(this);
  }
}
