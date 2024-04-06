import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

abstract class BaseProvider<T> extends ChangeNotifier {
  BaseProvider(T initialState) {
    _state = initialState;
  }

  late T _state;

  T get state => _state;

  @protected
  emit(T newState) {
    if (_state != newState) {
      _state = newState;
      notifyListeners();
    }
  }
}
