import 'package:flutter/material.dart';

class MenuItemModel extends ChangeNotifier {
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
