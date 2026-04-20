import 'package:flutter/material.dart';

class AddressCardModel extends ChangeNotifier {
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