import 'package:flutter/material.dart';
import 'package:qrent/core/managers/navigation/NavigationManager.dart';
import 'package:qrent/core/managers/navigation/RouteGenerator.dart';
import 'package:qrent/core/managers/theme/app_theme.dart';
import 'package:qrent/screen/booking/view/booking_view.dart';
import 'package:qrent/screen/home/view/home_view.dart';
import 'package:qrent/screen/house/model/house_model.dart';
import 'package:qrent/screen/key/view/key_view.dart';
import 'package:qrent/screen/qr/view/qr_view.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: myTheme,
      navigatorKey: NavigationManager.instance.navigatorKey,
      onGenerateRoute: RouteGenerator.instance.generateRoute,
      title: 'Material App',
      home: Scaffold(
        body: HomeView(),
      ),
    );
  }
}
