import 'package:flutter/material.dart';

extension DurationPlus on Duration {
  Future<bool> get delay => Future.delayed(this, () => true);
  Future<void> schedule(VoidCallback task) => Future.delayed(this, task);
}
