import 'package:flutter/material.dart';

import 'j_cherry_toast.dart';

extension PositionExtension on Position {
  AlignmentGeometry get alignment {
    switch (this) {
      case Position.center:
        return Alignment.center;
      case Position.top:
        return Alignment.topCenter;
      case Position.bottom:
        return Alignment.bottomCenter;
    }
  }
}
