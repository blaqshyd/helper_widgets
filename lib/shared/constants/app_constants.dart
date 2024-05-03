// Buttons
import 'package:flutter/material.dart';

final transparentButtonStyle = ElevatedButton.styleFrom(
  backgroundColor: Colors.transparent,
  foregroundColor: Colors.black54,
  elevation: 0,
  minimumSize: const Size.fromHeight(45),
  shape: const RoundedRectangleBorder(
    side: BorderSide(color: Colors.black26, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(8.0)),
  ),
);

final secondaryButtonStyle = ElevatedButton.styleFrom(
  backgroundColor: Colors.grey.shade300,
  foregroundColor: Colors.black54,
  elevation: 0,
  minimumSize: const Size.fromHeight(45),
  shape: const RoundedRectangleBorder(
    side: BorderSide(color: Colors.black26, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(8.0)),
  ),
);

final roundedButtonStyle = ElevatedButton.styleFrom(
  backgroundColor: Colors.white,
  foregroundColor: Colors.black54,
  elevation: 0,
  minimumSize: const Size.fromHeight(45),
  shape: const RoundedRectangleBorder(
    side: BorderSide(color: Colors.black26, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(80.0)),
  ),
);
