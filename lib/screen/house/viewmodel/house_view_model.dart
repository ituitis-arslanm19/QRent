import 'dart:convert';
import 'dart:developer';
import 'dart:typed_data';

import 'package:mobx/mobx.dart';
import 'package:qrent/screen/house/model/house_model.dart';

import '../../../core/base/model/ViemModel.dart';
import '../service/house_service.dart';
part 'house_view_model.g.dart';

class HouseViewModel = _HouseViewModelBase with _$HouseViewModel;

abstract class _HouseViewModelBase with Store, BaseViewModel {
  final IHouseService houseService;
  final Object? id;

  _HouseViewModelBase(this.houseService, this.id);
  @observable
  HouseModel houseModel = HouseModel();

  @observable
  List<Uint8List> bytes = [];

  @observable
  bool isHouseInfoReady = false;

  @override
  void init() async {
    //getHouse(id);

    // var x = await houseService.saveHouse(new HouseModel(
    //     id: 7,
    //     title: "ÜSKÜDAR EV",
    //     floorNumber: 7,
    //     description: "kaçırma!",
    //     netM2: 120,
    //     grossM2: 110,
    //     bathroomNumber: 2,
    //     image: image,
    //     bedNumber: 2,
    //     airConditioner: false,
    //     address: "acbadem",
    //     longitude: 40,
    //     latitude: 40,
    //     roomNumber: "2+1",
    //     userId: 1));

    houseModel = id as HouseModel;
    houseModel.image!.forEach((element) {
      bytes.add(Base64Decoder().convert(element));
    });
    changeIsHouseInfoReady();
  }

  @action
  changeIsHouseInfoReady() {
    isHouseInfoReady = !isHouseInfoReady;
  }

  @action
  Future<void> getHouse(Object? id) async {
    try {
      houseModel = await houseService.fetchHouse(id);
    } catch (e) {
      log(e.toString());
    }
    if (houseModel.image != null) {}
    changeIsHouseInfoReady();
  }
}
