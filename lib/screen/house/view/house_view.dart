import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qrent/core/functions/Functions.dart';
import 'package:qrent/core/managers/theme/app_theme.dart';
import 'package:qrent/core/widgets/buttons/BaseButton.dart';
import 'package:qrent/core/widgets/cards/BaseCard.dart';
import 'package:qrent/screen/house/model/house_model.dart';

import '../../../core/base/view/base_widget.dart';
import '../../../core/managers/network/NetworkManager.dart';
import '../service/house_service.dart';
import '../viewmodel/house_view_model.dart';

class HouseView extends StatelessWidget {
  final HouseModel houseModel;
  const HouseView({required this.houseModel});

  @override
  Widget build(BuildContext context) {
    var safePadding = MediaQuery.of(context).padding.top +
        MediaQuery.of(context).padding.bottom;
    final screenHeight = dynamicHeight(1, context) - safePadding;
    final screenWidth = dyanmicWidth(1, context);

    return BaseView<HouseViewModel>(
      viewModel:
          HouseViewModel(HouseService(NetworkManager.instance), houseModel),
      onModelReady: (model) {
        model.init();
      },
      onPageBuilder: (BuildContext context, HouseViewModel viewModel) =>
          DefaultTabController(
        length: 2,
        child: Scaffold(
          body: SafeArea(
            child: Align(
              alignment: AlignmentDirectional.topCenter,
              child: Container(
                color: Colors.grey[300],
                child: Observer(builder: (_) {
                  return viewModel.isHouseInfoReady
                      ? buildPage(context, screenHeight, screenWidth, viewModel)
                      : CircularProgressIndicator();
                }),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Column buildPage(BuildContext context, double screenHeight,
      double screenWidth, HouseViewModel viewmodel) {
    return Column(
      children: [
        buildSlider(context, screenHeight, screenWidth, viewmodel),
        Container(
          color: myTheme.colorScheme.surface,
          height: screenHeight * 0.07,
          child: TabBar(tabs: <Widget>[
            Tab(
              icon: Text(
                "Bilgiler",
                style: GoogleFonts.rubik(
                    fontSize: dynamicHeight(0.03, context),
                    fontWeight: FontWeight.w500),
              ),
            ),
            Tab(
              icon: Text(
                "Konum",
                style: GoogleFonts.rubik(
                    fontSize: dynamicHeight(0.03, context),
                    fontWeight: FontWeight.w500),
              ),
            )
          ]),
        ),
        Container(
            height: screenHeight * 0.50,
            child: TabBarView(children: [
              buildList(context, screenHeight, screenWidth, viewmodel),
              Text("2")
            ])),
        //
        buildButtons(context, screenHeight, screenWidth)
      ],
    );
  }

  Container buildList(BuildContext context, double screenHeight,
      double screenWidth, HouseViewModel viewModel) {
    return Container(
      height: screenHeight * 0.51,
      width: screenWidth,
      child: ListView.builder(
        padding: EdgeInsets.all(8),
        itemCount: 5,
        itemBuilder: (_, int index) {
          if (index == 0) {
            return buildTittleContainer(
                context, screenHeight, screenWidth, viewModel);
          } else if (index == 1) {
            return dyanmicVerticalSpace(context);
          } else if (index == 2) {
            return buildDescriptionContainer(
                context, screenHeight, screenWidth, viewModel);
          } else if (index == 3) {
            return dyanmicVerticalSpace(context);
          } else if (index == 4) {
            return buildInfos(viewModel, context);
          }
          return Text("Error");
        },
      ),
    );
  }

  Container buildButtons(
      BuildContext context, double screenHeight, double screenWidth) {
    return Container(
        height: screenHeight * 0.07,
        color: myTheme.colorScheme.surface,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            BaseButton(
              onPressed: () {},
              color: myTheme.primaryColor,
              height: screenHeight * 0.07,
              width: screenWidth * 0.4,
              text: 'Rezerve et',
            ),
            dyanmicHorizontalSpace(context),
            BaseButton(
              onPressed: () {},
              color: myTheme.colorScheme.surface,
              height: screenHeight * 0.07,
              width: screenWidth * 0.4,
              text: 'QR',
            ),
          ],
        ));
  }

  CarouselSlider buildSlider(BuildContext context, double screenHeight,
      double screenWidth, HouseViewModel viewModel) {
    return CarouselSlider(
      options:
          CarouselOptions(height: screenHeight * 0.35, viewportFraction: 1.0),
      items: [0, 1].map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Image.memory(
              viewModel.bytes[i],
              fit: BoxFit.cover,
              width: screenWidth,
            );
          },
        );
      }).toList(),
    );
  }

  Padding buildInfos(HouseViewModel viewModel, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0.0),
      child: Container(
        height: dynamicHeight(0.5, context),
        decoration: BoxDecoration(
            color: myTheme.colorScheme.surface,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(15)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "İlan Bilgileri",
                style: GoogleFonts.rubik(
                    fontWeight: FontWeight.w500,
                    fontSize: dynamicHeight(0.04, context)),
              ),
              dyanmicVerticalSpace(context),
              Row(
                children: [
                  Text(
                    "Adres: ",
                    style: GoogleFonts.rubik(
                        fontWeight: FontWeight.w500,
                        fontSize: dynamicHeight(0.03, context)),
                  ),
                  Text(
                    viewModel.houseModel.address ?? "yüklenemedi",
                    style: GoogleFonts.rubik(
                        fontWeight: FontWeight.w200,
                        fontSize: dynamicHeight(0.03, context)),
                  ),
                ],
              ),
              Divider(
                color: Colors.grey,
                thickness: 1,
              ),
              Row(
                children: [
                  Text(
                    "Net m2: ",
                    style: GoogleFonts.rubik(
                        fontWeight: FontWeight.w500,
                        fontSize: dynamicHeight(0.03, context)),
                  ),
                  Text(
                    viewModel.houseModel.netM2.toString(),
                    style: GoogleFonts.rubik(
                        fontWeight: FontWeight.w200,
                        fontSize: dynamicHeight(0.03, context)),
                  ),
                ],
              ),
              Divider(
                color: Colors.grey,
                thickness: 1,
              ),
              Row(
                children: [
                  Text(
                    "Kullanılabilir m2: ",
                    style: GoogleFonts.rubik(
                        fontWeight: FontWeight.w500,
                        fontSize: dynamicHeight(0.03, context)),
                  ),
                  Text(
                    viewModel.houseModel.grossM2.toString(),
                    style: GoogleFonts.rubik(
                        fontWeight: FontWeight.w200,
                        fontSize: dynamicHeight(0.03, context)),
                  ),
                ],
              ),
              Divider(
                color: Colors.grey,
                thickness: 1,
              ),
              Row(
                children: [
                  Text(
                    "Oda: ",
                    style: GoogleFonts.rubik(
                        fontWeight: FontWeight.w500,
                        fontSize: dynamicHeight(0.03, context)),
                  ),
                  Text(
                    viewModel.houseModel.roomNumber ?? "yüklenemedi",
                    style: GoogleFonts.rubik(
                        fontWeight: FontWeight.w200,
                        fontSize: dynamicHeight(0.03, context)),
                  ),
                ],
              ),
              Divider(
                color: Colors.grey,
                thickness: 1,
              ),
              Row(
                children: [
                  Text(
                    "Kat Sayısı: ",
                    style: GoogleFonts.rubik(
                        fontWeight: FontWeight.w500,
                        fontSize: dynamicHeight(0.03, context)),
                  ),
                  Text(
                    viewModel.houseModel.floorNumber.toString(),
                    style: GoogleFonts.rubik(
                        fontWeight: FontWeight.w200,
                        fontSize: dynamicHeight(0.03, context)),
                  ),
                ],
              ),
              Divider(
                color: Colors.grey,
                thickness: 1,
              ),
              Row(
                children: [
                  Text(
                    "Klima: ",
                    style: GoogleFonts.rubik(
                        fontWeight: FontWeight.w500,
                        fontSize: dynamicHeight(0.03, context)),
                  ),
                  Text(
                    viewModel.houseModel.airConditioner! ? "var" : "yok",
                    style: GoogleFonts.rubik(
                        fontWeight: FontWeight.w200,
                        fontSize: dynamicHeight(0.03, context)),
                  ),
                ],
              ),
              Divider(
                color: Colors.grey,
                thickness: 1,
              ),
              Row(
                children: [
                  Text(
                    "Banyo Sayısı: ",
                    style: GoogleFonts.rubik(
                        fontWeight: FontWeight.w500,
                        fontSize: dynamicHeight(0.03, context)),
                  ),
                  Text(
                    viewModel.houseModel.bathroomNumber.toString(),
                    style: GoogleFonts.rubik(
                        fontWeight: FontWeight.w200,
                        fontSize: dynamicHeight(0.03, context)),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container buildTittleContainer(BuildContext context, double screenHeight,
      double screenWidth, HouseViewModel viewModel) {
    return Container(
      width: screenWidth,
      height: dynamicHeight(0.18, context),
      decoration: BoxDecoration(
          color: myTheme.colorScheme.surface,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
                alignment: AlignmentDirectional.topStart,
                child: Text(viewModel.houseModel.title ?? "Yüklenemedi",
                    style: GoogleFonts.rubik(
                        fontSize: dynamicHeight(0.05, context)))),
            Text(
              "Sarıyer, Istanbul ",
              style: GoogleFonts.rubik(
                  fontWeight: FontWeight.w200,
                  fontSize: dynamicHeight(0.03, context)),
            ),
            Row(
              children: [
                Text(
                  "2+1  ",
                  style: GoogleFonts.rubik(
                      fontWeight: FontWeight.w500,
                      fontSize: dynamicHeight(0.03, context)),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8.0, 0, 0, 0),
                  child: Text(
                    viewModel.houseModel.netM2.toString() + "m2",
                    style: GoogleFonts.rubik(
                        fontWeight: FontWeight.w500,
                        fontSize: dynamicHeight(0.03, context)),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Container buildDescriptionContainer(BuildContext context, double screenHeight,
      double screenWidth, HouseViewModel viewModel) {
    return Container(
      width: screenWidth,
      decoration: BoxDecoration(
          color: myTheme.colorScheme.surface,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Açıklama:",
                style: GoogleFonts.rubik(
                    fontSize: dynamicHeight(0.04, context),
                    fontWeight: FontWeight.w500)),
            dyanmicVerticalSpace(context),
            Text(viewModel.houseModel.description ?? "Yüklenemedi",
                style:
                    GoogleFonts.rubik(fontSize: dynamicHeight(0.03, context)))
          ],
        ),
      ),
    );
  }
}
