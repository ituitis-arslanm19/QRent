import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:mobx/mobx.dart';
import 'package:qrent/core/base/model/ViemModel.dart';
import 'package:qrent/core/constants/app/strings/Strings.dart';

import 'package:qrent/screen/home/service/home_service.dart';
import 'package:qrent/screen/house/model/house_model.dart';

import '../../../core/constants/routeconst/RouteConstants.dart';

part 'home_view_model.g.dart';

class HomeViewModel = _HomeViewModelBase with _$HomeViewModel;

abstract class _HomeViewModelBase with Store, BaseViewModel {
  final IHomeService homeService;
  final TickerProvider? tickerProvider;

  _HomeViewModelBase(this.homeService, this.tickerProvider);

  late GoogleMapController? mapController;

  late AnimationController controller;

  late Animation<Offset> offset;

  @observable
  bool _areMarkersReady = false;

  get areMarkersReady => this._areMarkersReady;

  set areMarkersReady(value) => this._areMarkersReady = value;

  @observable
  bool _isHouseModelReady = false;

  get isHouseModelReady => this._areMarkersReady;

  set isHouseModelready(value) => this._areMarkersReady = value;

  @observable
  Set<Marker> _markers = {};
  get markers => this._markers;
  set markers(value) => this._markers = value;

  @observable
  Location _currentLocation = Location();
  get currentLocation => this._currentLocation;
  set currentLocation(value) => this._currentLocation = value;

  @observable
  HouseModel houseModel = HouseModel();

  @override
  void init() {
    controller = AnimationController(
        vsync: tickerProvider!, duration: Duration(milliseconds: 750));

    offset = Tween<Offset>(begin: Offset.zero, end: Offset(0.0, 0.7))
        .animate(CurvedAnimation(parent: controller, curve: Curves.easeInCirc));

    fetchMap();
  }

  @action
  changeAreMarkersReady() {
    areMarkersReady = !areMarkersReady;
  }

  @action
  Future<void> fetchMap() async {
    try {
      var locations = await homeService.fetchHomes();
      locations.forEach((element) {
        log(element.toString());
        _markers.add(Marker(
            markerId: MarkerId(element.toString()),
            onTap: () async {
              try {
                houseModel = await homeService.fetchHouse(element.id);
                _isHouseModelReady = true;
              } catch (e) {
                print(e);
              }

              switch (controller.status) {
                case AnimationStatus.completed:
                  controller.reverse();
                  break;
                case AnimationStatus.dismissed:
                  controller.forward();
                  break;
                default:
              }
            },
            icon: BitmapDescriptor.fromBytes(Base64Decoder().convert(icon)),
            position: LatLng(element.latitude!, element.longitude!)));
      });

      changeAreMarkersReady();
    } catch (e) {
      log(e.toString());
    }
  }

  void onMapCreated(GoogleMapController controller) {
    mapController = controller;
    mapController!.setMapStyle(MAPSTYLE);
  }

  @action
  Future showCurrentLocation() async {
    var l = await _currentLocation.getLocation();
    mapController!.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(target: LatLng(l.latitude!, l.longitude!), zoom: 15),
      ),
    );
  }

  void navigateToHousePage() {
    navigation.navigateToPage(path: RouteConstants.HOUSE, data: houseModel);
  }
}
