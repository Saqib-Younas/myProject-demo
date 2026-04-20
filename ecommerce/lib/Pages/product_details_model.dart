import 'package:flutter/material.dart';

class ProductDetailsModel extends ChangeNotifier {
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