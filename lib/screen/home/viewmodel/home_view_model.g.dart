// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeViewModel on _HomeViewModelBase, Store {
  late final _$_areMarkersReadyAtom =
      Atom(name: '_HomeViewModelBase._areMarkersReady', context: context);

  @override
  bool get _areMarkersReady {
    _$_areMarkersReadyAtom.reportRead();
    return super._areMarkersReady;
  }

  @override
  set _areMarkersReady(bool value) {
    _$_areMarkersReadyAtom.reportWrite(value, super._areMarkersReady, () {
      super._areMarkersReady = value;
    });
  }

  late final _$_isHouseModelReadyAtom =
      Atom(name: '_HomeViewModelBase._isHouseModelReady', context: context);

  @override
  bool get _isHouseModelReady {
    _$_isHouseModelReadyAtom.reportRead();
    return super._isHouseModelReady;
  }

  @override
  set _isHouseModelReady(bool value) {
    _$_isHouseModelReadyAtom.reportWrite(value, super._isHouseModelReady, () {
      super._isHouseModelReady = value;
    });
  }

  late final _$_markersAtom =
      Atom(name: '_HomeViewModelBase._markers', context: context);

  @override
  Set<Marker> get _markers {
    _$_markersAtom.reportRead();
    return super._markers;
  }

  @override
  set _markers(Set<Marker> value) {
    _$_markersAtom.reportWrite(value, super._markers, () {
      super._markers = value;
    });
  }

  late final _$_currentLocationAtom =
      Atom(name: '_HomeViewModelBase._currentLocation', context: context);

  @override
  Location get _currentLocation {
    _$_currentLocationAtom.reportRead();
    return super._currentLocation;
  }

  @override
  set _currentLocation(Location value) {
    _$_currentLocationAtom.reportWrite(value, super._currentLocation, () {
      super._currentLocation = value;
    });
  }

  late final _$houseModelAtom =
      Atom(name: '_HomeViewModelBase.houseModel', context: context);

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

  late final _$fetchMapAsyncAction =
      AsyncAction('_HomeViewModelBase.fetchMap', context: context);

  @override
  Future<void> fetchMap() {
    return _$fetchMapAsyncAction.run(() => super.fetchMap());
  }

  late final _$showCurrentLocationAsyncAction =
      AsyncAction('_HomeViewModelBase.showCurrentLocation', context: context);

  @override
  Future<dynamic> showCurrentLocation() {
    return _$showCurrentLocationAsyncAction
        .run(() => super.showCurrentLocation());
  }

  late final _$_HomeViewModelBaseActionController =
      ActionController(name: '_HomeViewModelBase', context: context);

  @override
  dynamic changeAreMarkersReady() {
    final _$actionInfo = _$_HomeViewModelBaseActionController.startAction(
        name: '_HomeViewModelBase.changeAreMarkersReady');
    try {
      return super.changeAreMarkersReady();
    } finally {
      _$_HomeViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
houseModel: ${houseModel}
    ''';
  }
}
