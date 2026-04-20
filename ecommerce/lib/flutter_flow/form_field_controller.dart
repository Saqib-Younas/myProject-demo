import 'package:flutter/material.dart';

class FormFieldController<T> {
  FormFieldController(this._value);

  T? _value;

  T? get value => _value;

  set value(T? newValue) {
    _value = newValue;
  }

  void reset() {
    _value = null;
  }
}