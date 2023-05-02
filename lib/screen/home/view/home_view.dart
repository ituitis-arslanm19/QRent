import 'package:flutter/material.dart';

import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:qrent/core/base/view/base_widget.dart';
import 'package:qrent/core/managers/network/NetworkManager.dart';
import 'package:qrent/core/managers/theme/app_theme.dart';
import 'package:qrent/screen/home/viewmodel/home_view_model.dart';

import '../../../core/base/state/base_state.dart';
import '../../../core/functions/Functions.dart';
import '../../../core/widgets/buttons/BaseButton.dart';
import '../../../core/widgets/cards/BaseCard.dart';
import '../service/home_service.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends BaseState<HomeView>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return BaseView<HomeViewModel>(
      viewModel: HomeViewModel(HomeService(NetworkManager.instance), this),
      onModelReady: (model) {
        model.init();
      },
      onPageBuilder: (BuildContext context, HomeViewModel viewmodel) =>
          Scaffold(
        body: Stack(
          children: [
            buildMap(viewmodel, context),
            Align(
              alignment: AlignmentDirectional.bottomCenter,
              child: buildBottomButtons(viewmodel, context),
            ),
          ],
        ),
      ),
    );
  }

  SafeArea buildBottomButtons(HomeViewModel viewModel, BuildContext context) {
    return SafeArea(
      maintainBottomViewPadding: true,
      child: Container(
        alignment: Alignment.bottomCenter,
        height: dynamicHeight(0.5, context),
        width: dyanmicWidth(1, context),
        child: Align(
            //alignment: Alignment.bottomCenter,
            child: buildSlideTransition(viewModel, context)),
      ),
    );
  }

  SlideTransition buildSlideTransition(
      HomeViewModel viewModel, BuildContext context) {
    return SlideTransition(
        position: viewModel.offset,
        child: Padding(
          padding: EdgeInsets.all(0.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buildLocationButton(viewModel),
              buildLowBottomButtons(viewModel, context),
              Container(
                height: dynamicHeight(0.25, context),
                width: dyanmicWidth(1, context),
                child: BaseCard(
                  color: myTheme.colorScheme.surface,
                  height: dynamicHeight(0.25, context),
                  width: dyanmicWidth(1, context),
                  child: buildSlideCard(dynamicHeight(0.05, context),
                      dyanmicWidth(0.4, context), viewModel, context),
                ),
              )
            ],
          ),
        ));
  }

  Row buildLowBottomButtons(HomeViewModel viewModel, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        BaseButton(
          onPressed: () {},
          color: myTheme.primaryColor,
          height: dynamicHeight(0.05, context),
          width: dyanmicWidth(0.4, context),
          text: 'Liste',
        ),
        dyanmicHorizontalSpace(context),
        BaseButton(
          onPressed: () {},
          color: myTheme.colorScheme.surface,
          height: dynamicHeight(0.05, context),
          width: dyanmicWidth(0.4, context),
          text: 'QR',
        ),
      ],
    );
  }

  Container buildLocationButton(HomeViewModel viewmodel) {
    return Container(
      height: dynamicHeight(0.15, context),
      width: dyanmicWidth(1, context),
      child: Align(
        alignment: AlignmentDirectional.bottomEnd,
        child: ElevatedButton(
            style: myTheme.textButtonTheme.style,
            onPressed: viewmodel.showCurrentLocation,
            child: Icon(Icons.location_searching)),
      ),
    );
  }

  Observer buildMap(HomeViewModel viewmodel, BuildContext context) {
    return Observer(builder: (_) {
      return viewmodel.areMarkersReady
          ? map(viewmodel, context)
          : CircularProgressIndicator();
    });
  }
}

GoogleMap map(HomeViewModel viewModel, BuildContext context) {
  return GoogleMap(
    myLocationButtonEnabled: true,
    mapToolbarEnabled: false,
    onMapCreated: viewModel.onMapCreated,
    initialCameraPosition: CameraPosition(
      target: LatLng(41.023668, 29.022979),
      zoom: 11.0,
    ),
    mapType: MapType.normal,
    markers: viewModel.markers,
    zoomControlsEnabled: false,
  );
}

Observer buildSlideCard(double height, double width, HomeViewModel viewModel,
    BuildContext context) {
  return Observer(builder: (_) {
    return viewModel.isHouseModelReady
        ? Column(
            children: [
              Expanded(
                flex: 2,
                child: Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: myTheme.colorScheme.background,
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(40),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Container(
                        child: Padding(
                          padding: const EdgeInsets.all(5),
                          child: Align(
                            alignment: AlignmentDirectional.topStart,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Fiyat: " +
                                      viewModel.houseModel.grossM2.toString(),
                                  style: GoogleFonts.montserratTextTheme(
                                          myTheme.primaryTextTheme)
                                      .headlineMedium,
                                ),
                                Text(
                                  "m2: " +
                                      viewModel.houseModel.netM2.toString(),
                                  style: GoogleFonts.montserratTextTheme(
                                          myTheme.primaryTextTheme)
                                      .headlineMedium,
                                ),
                                Text(
                                  "Oda: " +
                                      viewModel.houseModel.roomNumber
                                          .toString(),
                                  style: GoogleFonts.montserratTextTheme(
                                          myTheme.primaryTextTheme)
                                      .headlineMedium,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    BaseButton(
                        text: "Kirala",
                        color: myTheme.primaryColor,
                        height: height,
                        width: width,
                        onPressed: () {}),
                    BaseButton(
                        text: "Sayfaya Git",
                        color: myTheme.colorScheme.surface,
                        height: height,
                        width: width,
                        onPressed: viewModel.navigateToHousePage)
                  ],
                ),
              ),
            ],
          )
        : CircularProgressIndicator();
  });
}
