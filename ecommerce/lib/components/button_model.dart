import 'package:flutter/material.dart';

class ButtonModel extends ChangeNotifier {
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