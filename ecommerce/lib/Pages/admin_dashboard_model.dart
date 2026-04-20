import 'package:flutter/material.dart';
import '../components/stat_card_model.dart';
import '../flutter_flow/form_field_controller.dart';

class AdminDashboardModel extends ChangeNotifier {
  StatCardModel? statCardModel1;
  StatCardModel? statCardModel2;
  FormFieldController<String>? dropdownValueController;
  String? dropdownValue;
  dynamic buttonModel;
  dynamic orderRowModel1;
  dynamic orderRowModel2;
  dynamic orderRowModel3;

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