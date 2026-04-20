import 'package:flutter/material.dart';

class OrderSuccessModel extends ChangeNotifier {
  // Component models
  dynamic summaryItemModel1;
  dynamic summaryItemModel2;
  dynamic detailRowModel1;
  dynamic detailRowModel2;
  dynamic detailRowModel3;
  dynamic buttonModel1;
  dynamic buttonModel2;
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