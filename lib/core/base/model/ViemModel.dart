import 'package:flutter/material.dart';
import 'package:qrent/core/managers/network/IcoreDio.dart';

import '../../managers/navigation/NavigationManager.dart';
import '../../managers/network/NetworkManager.dart';

abstract class BaseViewModel {
  ICoreDio? coreDio = NetworkManager.instance!.coreDio;

  //LocaleManager localeManager = LocaleManager.instance;
  NavigationManager navigation = NavigationManager.instance;

  //void setContext(BuildContext context);
  void init();
}
