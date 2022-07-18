// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import 'package:qrent/core/base/view/base_widget.dart';
import 'package:qrent/core/managers/theme/app_theme.dart';
import 'package:qrent/core/widgets/buttons/BaseButton.dart';
import 'package:qrent/core/widgets/cards/BaseCard.dart';
import 'package:qrent/screen/booking/service/booking_service.dart';
import 'package:qrent/screen/booking/view/slide_widget.dart';
import 'package:qrent/screen/booking/viewmodel/booking_view_model.dart';
import 'package:qrent/screen/house/model/house_model.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

import '../../../core/functions/Functions.dart';

class BookingView extends StatelessWidget {
  final HouseModel houseModel;
  final ValueNotifier<DateTime?> checkInDate = ValueNotifier(null);
  final ValueNotifier<DateTime?> checkOutDate = ValueNotifier(null);
  BookingView(
    this.houseModel,
  );

  @override
  Widget build(BuildContext context) {
    var safePadding = MediaQuery.of(context).padding.top +
        MediaQuery.of(context).padding.bottom;
    final screenHeight = dynamicHeight(1, context) - safePadding;
    final screenWidth = dyanmicWidth(1, context);
    String? x;
    return BaseView<BookingViewModel>(
      viewModel: BookingViewModel(BookingService(), houseModel),
      onModelReady: (model) {
        model.init();
      },
      onPageBuilder: (BuildContext context, BookingViewModel viewModel) =>
          buildPage(context, screenHeight, screenWidth, x),
    );
  }

  SafeArea buildPage(BuildContext context, double screenHeight,
      double screenWidth, String? x) {
    return SafeArea(
      child: Container(
          color: myTheme.colorScheme.primary,
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                dyanmicVerticalSpace(context),
                dyanmicVerticalSpace(context),
                buildProgressIndicator(screenHeight),
                dyanmicVerticalSpace(context),
                dyanmicVerticalSpace(context),
                buildCard(screenHeight, screenWidth, context, x),
              ],
            ),
          )),
    );
  }

  BaseCard buildCard(double screenHeight, double screenWidth,
      BuildContext context, String? x) {
    return BaseCard(
      color: myTheme.colorScheme.surface,
      height: screenHeight * 0.6,
      width: screenWidth * 0.9,
      child: Column(
        children: [
          dyanmicVerticalSpace(context),
          buildTitle(),
          dyanmicVerticalSpace(context),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  buildFirstDate(x, screenWidth, screenHeight),
                  dyanmicHorizontalSpace(context),
                  buildLastDate(x, screenWidth, screenHeight),
                ],
              ),
              buildPersonNum(x, screenWidth, screenHeight),
            ],
          ),
          dyanmicVerticalSpace(context),
          buildButton(screenHeight, screenWidth),
          dyanmicVerticalSpace(context),
        ],
      ),
    );
  }

  StepProgressIndicator buildProgressIndicator(double screenHeight) {
    return StepProgressIndicator(
      totalSteps: 2,
      currentStep: 1,
      size: screenHeight * 0.07,
      selectedColor: myTheme.colorScheme.primary,
      unselectedColor: Colors.white,
      customStep: (index, color, _) => color == myTheme.colorScheme.primary
          ? AnimatedContainer(
              decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: color,
                  border: Border.all(color: myTheme.colorScheme.surface),
                  borderRadius: BorderRadius.circular(50)),
              duration: Duration(seconds: 4),
              curve: Curves.bounceInOut,
              child: Icon(
                Icons.check,
                color: Colors.white,
              ),
            )
          : Container(
              decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: color,
                  border: Border.all(color: myTheme.colorScheme.surface),
                  borderRadius: BorderRadius.circular(50)),
              child: Center(
                  child: Text(
                (index + 1).toString(),
                style: TextStyle(color: myTheme.colorScheme.primary),
              ))),
    );
  }

  Container buildLastDate(String? x, double screenWidth, double screenHeight) {
    return Container(
      width: screenWidth * 0.4,
      height: screenHeight * 0.10,
      child: ValueListenableBuilder<DateTime?>(
          valueListenable: checkOutDate,
          builder: (context, dateVal, child) {
            return InkWell(
                onTap: () async {
                  DateTime? date = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime.now(),
                      lastDate: DateTime(2050),
                      currentDate: DateTime.now(),
                      initialEntryMode: DatePickerEntryMode.calendar,
                      initialDatePickerMode: DatePickerMode.day,
                      builder: (context, child) {
                        return Theme(
                          data: myTheme.copyWith(
                              colorScheme: ColorScheme.fromSwatch(
                            primarySwatch:
                                myTheme.primaryColor as MaterialColor,
                            accentColor: myTheme.colorScheme.surface,
                            backgroundColor: myTheme.colorScheme.primary,
                            cardColor: Colors.white,
                          )),
                          child: child!,
                        );
                      });
                  checkOutDate.value = date;
                },
                child: buildCheckOut(
                    dateVal != null ? convertDate(dateVal) : 'Çıkış:'));
          }),
    );
  }

  Text buildTitle() {
    return Text(
      "1500 TL/gece",
      style: GoogleFonts.rubik(
          color: myTheme.colorScheme.primary,
          fontSize: 25,
          fontWeight: FontWeight.w400),
    );
  }

  Container buildFirstDate(String? x, double screenWidth, double screenHeight) {
    return Container(
      width: screenWidth * 0.4,
      height: screenHeight * 0.10,
      child: ValueListenableBuilder<DateTime?>(
          valueListenable: checkInDate,
          builder: (context, dateVal, child) {
            return InkWell(
                onTap: () async {
                  DateTime? date = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime.now(),
                      lastDate: DateTime(2050),
                      currentDate: DateTime.now(),
                      initialEntryMode: DatePickerEntryMode.calendar,
                      initialDatePickerMode: DatePickerMode.day,
                      builder: (context, child) {
                        return Theme(
                          data: myTheme.copyWith(
                              colorScheme: ColorScheme.fromSwatch(
                            primarySwatch:
                                myTheme.primaryColor as MaterialColor,
                            accentColor: myTheme.colorScheme.surface,
                            backgroundColor: myTheme.colorScheme.primary,
                            cardColor: Colors.white,
                          )),
                          child: child!,
                        );
                      });
                  checkInDate.value = date;
                },
                child: buildCheckIn(
                    dateVal != null ? convertDate(dateVal) : 'Giriş:'));
          }),
    );
  }

  Widget buildCheckIn(String data) {
    return ListTile(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
        side: BorderSide(color: myTheme.colorScheme.primary, width: 1.5),
      ),
      title: Text(data),
      trailing: Icon(
        Icons.calendar_today,
        color: myTheme.colorScheme.primary,
      ),
    );
  }

  Widget buildCheckOut(String data) {
    return ListTile(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
        side: BorderSide(color: myTheme.colorScheme.primary, width: 1.5),
      ),
      title: Text(data),
      trailing: Icon(
        Icons.calendar_today,
        color: myTheme.colorScheme.primary,
      ),
    );
  }

  String convertDate(DateTime dateTime) {
    return DateFormat('dd/MM/yyyy').format(dateTime);
  }

  BaseButton buildButton(double screenHeight, double screenWidth) {
    return BaseButton(
        text: "Rezerve Et",
        color: myTheme.colorScheme.primary,
        height: screenHeight * 0.1,
        width: screenWidth * 0.7,
        onPressed: () {});
  }

  Container buildPersonNum(String? x, double screenWidth, double screenHeight) {
    return Container(
      width: screenWidth * 0.6,
      height: screenHeight * 0.12,
      alignment: Alignment.centerLeft,
      child: DropdownButtonFormField(
          hint: Text("Kişi sayısı"),
          autovalidateMode: AutovalidateMode.onUserInteraction,
          borderRadius: BorderRadius.circular(50),
          decoration: InputDecoration(
            border: InputBorder.none,
            filled: true,
            fillColor: myTheme.colorScheme.surface,
          ),
          isExpanded: true,
          isDense: true,
          items: ['1', '2', '3', '4', '5'].map((item) {
            return DropdownMenuItem(
              value: item,
              child: Text(item),
            );
          }).toList(),
          validator: (value) => x,
          onChanged: (String? x) {}),
    );
  }
}
