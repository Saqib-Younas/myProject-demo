import 'package:flutter/material.dart';

class TextFieldModel extends ChangeNotifier {
  TextEditingController? inputTextController;
  FocusNode? inputFocusNode;
  String? Function(String?)? inputTextControllerValidator;
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
