import 'package:flutter/material.dart';

class SwitchComponentModel extends ChangeNotifier {
  bool? switchValue;

  void onUpdate() {
    notifyListeners();
  }

  void maybeDispose() {
    dispose();
  }

  void dispose() {
    super.dispose();
  }
}
