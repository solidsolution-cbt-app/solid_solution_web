import 'package:flutter/material.dart';

class CloseKeyboard {
  static closeKeyboard() {
    FocusManager.instance.primaryFocus?.unfocus();
  }
}
