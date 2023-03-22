import 'dart:math' as math;

import 'package:flutter/material.dart';

import 'launguage_switcher.dart';

class AppSettings extends StatefulWidget {
  const AppSettings({super.key});

  @override
  State<AppSettings> createState() => _AppSettingsState();
}

class _AppSettingsState extends State<AppSettings> {
  double _positionX = 0;

  double _positionY = 100;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: _positionX,
      top: _positionY,
      child: Draggable(
        feedback: const LanguageSwitcher(),
        childWhenDragging: Container(),
        onDragEnd: (details) {
          final size = MediaQuery.of(context).size;
          setState(() {
            _positionX =
                math.min(size.width - 48, math.max(details.offset.dx, 0));
            _positionY =
                math.min(size.height - 48, math.max(details.offset.dy, 0));
          });
        },
        child: const LanguageSwitcher(),
      ),
    );
  }
}
