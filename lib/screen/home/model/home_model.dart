// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

import 'package:qrent/core/base/model/BaseModel.dart';

part 'home_model.g.dart';

@JsonSerializable()
class HomeModel extends BaseModel<HomeModel> {
  @JsonKey(name: '_id')
  int? id;
  int? m2;
  String? oda_sayisi;
  double? x;
  double? y;

  HomeModel({
    this.id,
    this.m2,
    this.oda_sayisi,
    this.x,
    this.y,
  });

  HomeModel copyWith({
    int? id,
    int? m2,
    String? oda_sayisi,
    double? x,
    double? y,
  }) {
    return HomeModel(
      id: id ?? this.id,
      m2: m2 ?? this.m2,
      oda_sayisi: oda_sayisi ?? this.oda_sayisi,
      x: x ?? this.x,
      y: y ?? this.y,
    );
  }

  @override
  String toString() {
    return 'HomeModel(id: $id, m2: $m2, oda_sayisi: $oda_sayisi, x: $x, y: $y)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is HomeModel &&
        other.id == id &&
        other.m2 == m2 &&
        other.oda_sayisi == oda_sayisi &&
        other.x == x &&
        other.y == y;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        m2.hashCode ^
        oda_sayisi.hashCode ^
        x.hashCode ^
        y.hashCode;
  }

  @override
  HomeModel fromJson(Map<String, dynamic> json) {
    return _$HomeModelFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$HomeModelToJson(this);
  }
}
