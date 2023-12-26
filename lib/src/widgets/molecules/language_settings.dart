import 'dart:math' as math;

import 'package:flutter/material.dart'
    show
        BuildContext,
        Container,
        Draggable,
        Positioned,
        State,
        StatefulWidget,
        Widget;

import '../../core/extensions/context.dart';
import '../atoms/language_button.dart' show LanguageButton;

class LanguageSettings extends StatefulWidget {
  const LanguageSettings({super.key});

  @override
  State<LanguageSettings> createState() => _LanguageSettingsState();
}

class _LanguageSettingsState extends State<LanguageSettings> {
  double _positionX = 0;

  double _positionY = 100;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: _positionX,
      top: _positionY,
      child: Draggable(
        feedback: const LanguageButton(),
        childWhenDragging: Container(),
        onDragEnd: (details) {
          setState(() {
            _positionX =
                math.min(context.width - 48, math.max(details.offset.dx, 0));
            _positionY =
                math.min(context.height - 48, math.max(details.offset.dy, 0));
          });
        },
        child: const LanguageButton(),
      ),
    );
  }
}
