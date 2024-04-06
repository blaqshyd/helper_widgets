import 'dart:developer' as devtools;

extension Log on Object {
  void log() => devtools.log(toString());
}

extension Log1 on String {
  void log() => devtools.log(toString());
}

