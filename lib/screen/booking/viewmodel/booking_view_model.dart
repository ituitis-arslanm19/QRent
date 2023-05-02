import 'dart:ui';

import 'package:mobx/mobx.dart';
import 'package:qrent/core/base/model/ViemModel.dart';
import 'package:qrent/core/constants/app/Enums/PageControlEnums.dart';
import 'package:qrent/screen/booking/service/booking_service.dart';
import 'package:qrent/screen/house/model/house_model.dart';
part 'booking_view_model.g.dart';

class BookingViewModel = _BookingViewModelBase with _$BookingViewModel;

abstract class _BookingViewModelBase with Store, BaseViewModel {
  final IBookingService houseService;
  final HouseModel houseModel;

  _BookingViewModelBase(
    this.houseService,
    this.houseModel,
  );

  @observable
  PageControl pageControl = PageControl.LOADING;

  int? _price;
  get price => _price;
  set price(value) => _price = value;

  @override
  void init() {
    price = houseModel.netM2;

    changePageControl(PageControl.READY);
  }

  @action
  changePageControl(PageControl pageControl) {
    this.pageControl = pageControl;
  }
}
