import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TemperatureType extends ChangeNotifier {
  bool isCel;
  TemperatureType({required this.isCel});

  void toggleTemp() {
    if (isCel != null) {
      isCel = !(isCel);
      notifyListeners();
    }
  }
}
