import 'package:flutter/material.dart';
import '../components/text_field_model.dart';
import '../components/stat_card_model.dart';
import '../components/product_row_model.dart';

class InventoryManagementModel extends ChangeNotifier {
  TextFieldModel? textFieldModel;
  StatCardModel? statCard2Model1;
  StatCardModel? statCard2Model2;
  ProductRowModel? productRowModel1;
  ProductRowModel? productRowModel2;
  ProductRowModel? productRowModel3;
  ProductRowModel? productRowModel4;
  ProductRowModel? productRowModel5;
  ProductRowModel? productRowModel6;
  ProductRowModel? productRowModel7;
  ProductRowModel? productRowModel8;

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