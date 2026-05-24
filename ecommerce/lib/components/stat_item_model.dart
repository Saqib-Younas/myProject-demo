import 'package:flutter/material.dart';

class StatItemModel extends ChangeNotifier {
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
