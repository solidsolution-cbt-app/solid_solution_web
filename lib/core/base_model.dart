import 'package:flutter/material.dart';

class BaseModel extends ChangeNotifier {
  ViewState _state = ViewState.done;
  ViewState get state => _state;
  void reset(ViewState state) {
    _state = state;
    notifyListeners();
  }
}

enum ViewState { loading, error, done }
