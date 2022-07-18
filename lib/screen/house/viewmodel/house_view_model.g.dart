// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'house_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HouseViewModel on _HouseViewModelBase, Store {
  late final _$houseModelAtom =
      Atom(name: '_HouseViewModelBase.houseModel', context: context);

  @override
  HouseModel get houseModel {
    _$houseModelAtom.reportRead();
    return super.houseModel;
  }

  @override
  set houseModel(HouseModel value) {
    _$houseModelAtom.reportWrite(value, super.houseModel, () {
      super.houseModel = value;
    });
  }

  late final _$bytesAtom =
      Atom(name: '_HouseViewModelBase.bytes', context: context);

  @override
  List<Uint8List> get bytes {
    _$bytesAtom.reportRead();
    return super.bytes;
  }

  @override
  set bytes(List<Uint8List> value) {
    _$bytesAtom.reportWrite(value, super.bytes, () {
      super.bytes = value;
    });
  }

  late final _$isHouseInfoReadyAtom =
      Atom(name: '_HouseViewModelBase.isHouseInfoReady', context: context);

  @override
  bool get isHouseInfoReady {
    _$isHouseInfoReadyAtom.reportRead();
    return super.isHouseInfoReady;
  }

  @override
  set isHouseInfoReady(bool value) {
    _$isHouseInfoReadyAtom.reportWrite(value, super.isHouseInfoReady, () {
      super.isHouseInfoReady = value;
    });
  }

  late final _$getHouseAsyncAction =
      AsyncAction('_HouseViewModelBase.getHouse', context: context);

  @override
  Future<void> getHouse(Object? id) {
    return _$getHouseAsyncAction.run(() => super.getHouse(id));
  }

  late final _$_HouseViewModelBaseActionController =
      ActionController(name: '_HouseViewModelBase', context: context);

  @override
  dynamic changeIsHouseInfoReady() {
    final _$actionInfo = _$_HouseViewModelBaseActionController.startAction(
        name: '_HouseViewModelBase.changeIsHouseInfoReady');
    try {
      return super.changeIsHouseInfoReady();
    } finally {
      _$_HouseViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
houseModel: ${houseModel},
bytes: ${bytes},
isHouseInfoReady: ${isHouseInfoReady}
    ''';
  }
}
