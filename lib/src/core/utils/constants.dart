import 'package:flutter/material.dart';

class Constants {
  static const pageSize = 15;
}

extension Merge on EdgeInsets {
  EdgeInsets merge(EdgeInsets? other) {
    return copyWith(
      left: other?.left != 0 ? other?.left : left,
      right: other?.right != 0 ? other?.right : right,
      top: other?.top != 0 ? other?.top : top,
      bottom: other?.bottom != 0 ? other?.bottom : bottom,
    );
  }
}

bool _isList(list) => list is List;

bool _checkArray(List list) {
  bool isAllList = false;
  for (var i = 0; i < list.length; i++) {
    isAllList = _isList(list[i]);
  }
  return isAllList;
}

extension Flatten on List {
  List flatten() {
    final shapeCheck = _checkArray(this);
    if (!shapeCheck) throw Exception('Uneven array dimension');
    var result = [];
    for (var i = 0; i < length; i++) {
      for (var j = 0; j < this[i].length; j++) {
        result.add(this[i][j]);
      }
    }
    return result;
  }
}

extension HexColor on Color {
  static Color fromHex(String hexColorString) {
    hexColorString = hexColorString.replaceAll("#", "");
    if (hexColorString.length == 6) {
      hexColorString = "FF$hexColorString";
    }
    return Color(int.parse(hexColorString, radix: 16));
  }
}

extension GlobalKeyExtension on GlobalKey {
  Rect? get globalPaintBounds {
    final renderObject = currentContext?.findRenderObject();
    var translation = renderObject?.getTransformTo(null).getTranslation();
    if (translation != null && renderObject?.paintBounds != null) {
      return renderObject!.paintBounds
          .shift(Offset(translation.x, translation.y));
    } else {
      return null;
    }
  }
}

class AppLocale {
  static const Locale ja = Locale("ja");
  static const Locale en = Locale("en");
}
