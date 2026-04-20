import 'package:flutter/material.dart';

class UserProfileModel extends ChangeNotifier {
  // Component models
  dynamic profileHeaderModel;
  dynamic statItemModel1;
  dynamic statItemModel2;
  dynamic statItemModel3;
  dynamic sectionHeaderModel1;
  dynamic menuItemModel1;
  dynamic menuItemModel2;
  dynamic menuItemModel3;
  dynamic menuItemModel4;
  dynamic sectionHeaderModel2;
  dynamic switchComponentModel1;
  dynamic switchComponentModel2;
  dynamic sectionHeaderModel3;
  dynamic menuItemModel5;
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