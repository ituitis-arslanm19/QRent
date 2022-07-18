import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qrent/core/managers/theme/app_theme.dart';
import 'package:qrent/core/widgets/buttons/BaseButton.dart';
import 'package:qrent/core/widgets/cards/BaseCard.dart';

import '../../../core/functions/Functions.dart';
import '../../../core/widgets/buttons/BaseIconButton.dart';

class KeyView extends StatelessWidget {
  Color WHITE = myTheme.colorScheme.surface;
  Color PRIMARY = myTheme.colorScheme.primary;
  KeyView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: WHITE,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(8, 20, 8, 0),
            child: Column(
              children: [
                //buildUserInfos(context),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Kontrol Merkezi",
                        style: GoogleFonts.rubik(
                            fontSize: 50,
                            color: PRIMARY,
                            fontWeight: FontWeight.w500)),
                  ],
                ),
                dyanmicVerticalSpace(context),
                buildKeyButtons(context),
                Divider(
                  color: PRIMARY,
                  thickness: 3,
                ),
                // dyanmicVerticalSpace(context),
                // dyanmicVerticalSpace(context),
                buildHouseInfos(context),
                Divider(
                  color: PRIMARY,
                  thickness: 3,
                ),
                buildButtons(context)
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container buildHouseInfos(BuildContext context) {
    return Container(
        child: Column(
      children: [
        Row(
          children: [
            dyanmicHorizontalSpace(context),
            Icon(
              Icons.timer,
              color: PRIMARY,
            ),
            dyanmicHorizontalSpace(context),
            Text("2 gün 16 saat",
                style: GoogleFonts.rubik(
                    fontSize: 25, color: PRIMARY, fontWeight: FontWeight.w500)),
          ],
        ),
        dyanmicVerticalSpace(context),
        Row(
          children: [
            dyanmicHorizontalSpace(context),
            Icon(
              Icons.door_back_door,
              color: PRIMARY,
            ),
            dyanmicHorizontalSpace(context),
            Text("Kilitli",
                style: GoogleFonts.rubik(
                    fontSize: 25, color: PRIMARY, fontWeight: FontWeight.w500)),
          ],
        ),
        dyanmicVerticalSpace(context),
        Row(
          children: [
            dyanmicHorizontalSpace(context),
            Icon(
              Icons.location_on_rounded,
              color: PRIMARY,
            ),
            dyanmicHorizontalSpace(context),
            Text("Maslak, 34467 Sarıyer",
                style: GoogleFonts.rubik(
                    fontSize: 25, color: PRIMARY, fontWeight: FontWeight.w500)),
          ],
        ),
      ],
    ));
  }

  Container buildKeyButtons(BuildContext context) {
    return Container(
      child: Container(
        color: WHITE,
        height: 250,
        width: 450,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 100,
                  width: 175,
                  decoration: BoxDecoration(
                      color: PRIMARY,
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(50)),
                  child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(PRIMARY),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ))),
                      onPressed: () {},
                      child: Icon(
                        Icons.lock,
                        size: 50,
                        color: WHITE,
                      )),
                ),
                dyanmicHorizontalSpace(context),
                Container(
                  height: 100,
                  width: 175,
                  decoration: BoxDecoration(
                      color: PRIMARY,
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(50)),
                  child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(PRIMARY),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ))),
                      onPressed: () {},
                      child: Icon(
                        Icons.key,
                        size: 50,
                        color: WHITE,
                      )),
                )
              ],
            ),
            dyanmicVerticalSpace(context),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 100,
                  width: 175,
                  decoration: BoxDecoration(
                      color: Colors.green,
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(50)),
                  child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(PRIMARY),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ))),
                      onPressed: () {},
                      child: Text("Dış Kapı",
                          style: GoogleFonts.rubik(
                              fontSize: 30,
                              color: WHITE,
                              fontWeight: FontWeight.w500))),
                ),
                dyanmicHorizontalSpace(context),
                Container(
                  height: 100,
                  width: 175,
                  decoration: BoxDecoration(
                      color: PRIMARY,
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(50)),
                  child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.red),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ))),
                      onPressed: () {},
                      child: Text("Çıkış Yap",
                          style: GoogleFonts.rubik(
                              fontSize: 30,
                              color: WHITE,
                              fontWeight: FontWeight.w500))),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Container buildUserInfos(BuildContext context) {
    return Container(
        child: Column(
      children: [
        Row(
          children: [
            dyanmicHorizontalSpace(context),
            Icon(
              Icons.person,
              color: myTheme.colorScheme.surface,
            ),
            dyanmicHorizontalSpace(context),
            Text("Mehmet Bilal Gökarslan",
                style: GoogleFonts.rubik(
                    fontSize: 25,
                    color: myTheme.colorScheme.surface,
                    fontWeight: FontWeight.w500)),
          ],
        ),
        dyanmicVerticalSpace(context),
        Row(
          children: [
            dyanmicHorizontalSpace(context),
            Icon(
              Icons.star,
              color: myTheme.colorScheme.surface,
            ),
            dyanmicHorizontalSpace(context),
            Text("1574",
                style: GoogleFonts.rubik(
                    fontSize: 25,
                    color: myTheme.colorScheme.surface,
                    fontWeight: FontWeight.w500)),
          ],
        ),
      ],
    ));
  }

  Container buildButtons(BuildContext context) {
    return Container(
        height: 75,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              BaseIconButton(
                onPressed: () {},
                color: myTheme.colorScheme.surface,
                height: 50,
                width: 250,
                icon: Icon(Icons.call),
              ),
            ],
          ),
        ));
  }
}
