import 'package:flutter/material.dart';

extension RouterContext on BuildContext {
  toNamed(String routeName, {Object? args}) {
    Navigator.of(this).pushNamed(routeName, arguments: args);
  }

  push(MaterialPageRoute routeName, {Object? args}) {
    Navigator.of(this).push(routeName);
  }

  pushReplacement(MaterialPageRoute routeName, {Object? args}) {
    Navigator.of(this).pushReplacement(routeName);
  }

  pushAndRemoveUntil(MaterialPageRoute routeName, {Object? args}) {
    Navigator.of(this).pushAndRemoveUntil(routeName, (route) => false);
  }

  pop() {
    Navigator.of(this).pop();
  }
}
